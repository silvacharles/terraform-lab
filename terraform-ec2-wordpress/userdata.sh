#!/bin/bash

yum update -y

# Instalar Docker
yum install docker -y
systemctl start docker
systemctl enable docker

usermod -aG docker ec2-user

# Instalar Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Criar pasta do projeto
mkdir -p /home/ec2-user/traefik
cd /home/ec2-user/traefik

# Criar docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  traefik:
    image: traefik:latest
    container_name: traefik
    restart: always
    networks:
      - traefik
    ports:
      - 80:80
      - 443:443
    volumes:
      - /etc/localtime:/etc/localtime
      - /var/run/docker.sock:/var/run/docker.sock
      - ./config/traefik.toml:/traefik.toml
      - ./config/traefik_dynamic.toml:/traefik_dynamic.toml
      - ./config/acme.json:/acme.json
    logging:
      options:
        max-size: "10m"
        max-file: "5"

  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./config/portainer/data:/data
    ports:
      - 8001:8000
      - 9000:9000
      - 9443:9443
    networks:
      - traefik
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.portainer.rule=Host(`portainer.charlessilva.com.br`)"
      - "traefik.http.routers.portainer.tls=true"
      - "traefik.http.routers.portainer.tls.certresolver=lets-encrypt"
      - "traefik.http.services.portainer.loadbalancer.server.port=9000"
      - "traefik.docker.network=traefik"
    logging:
      options:
        max-size: "10m"
        max-file: "5"


networks:
  traefik:
    external: true

EOF

# Criar pasta de configuração do Traefik
mkdir -p /home/ec2-user/traefik/config
cd /home/ec2-user/traefik/config

cat <<EOF > traefik.toml
[entryPoints]
  [entryPoints.web]
    address = ":80"
    
    [entryPoints.web.http]
      [entryPoints.web.http.redirections]
        [entryPoints.web.http.redirections.entryPoint]
          to = "websecure"
          scheme = "https"

  [entryPoints.websecure]
    address = ":443"

[log]
  level = "WARN"

[accessLog]

[metrics]
  [metrics.prometheus]
    addEntryPointsLabels = true
    addServicesLabels = true
    addRoutersLabels = true

[api]
  dashboard = true

[certificatesResolvers.lets-encrypt.acme]
  email = "suporte@charlessilva.com.br"
  storage = "acme.json"
  [certificatesResolvers.lets-encrypt.acme.tlsChallenge]

[providers.docker]
  watch = true
  network = "traefik"

[providers.file]
  filename = "traefik_dynamic.toml"

[acme]
  storage = "acme.json"  

[experimental.plugins.traefik-warp]
  moduleName = "github.com/l4rm4nd/traefik-warp"
  version = "v1.1.5"

[experimental.plugins.fail2ban]
  moduleName = "github.com/tomMoulard/fail2ban"
  version = "v0.8.9"

EOF

cat <<EOF > traefik_dynamic.toml

[http.middlewares.simpleAuth.basicAuth]
  users = [
    "admin:$criptografar_senha"
  ]

# Use with traefik.http.routers.myRouter.middlewares: "redirect-www-to-main@file"
[http.middlewares]
  [http.middlewares.redirect-www-to-main.redirectregex]
      permanent = true
      regex = "^https?://www\\.(.+)"
      replacement = "https://${1}"

[http.routers.api]
  rule = "Host(`traefik.charlessilva.com.br`)"
  entrypoints = ["websecure"]
  middlewares = ["simpleAuth"]
  service = "api@internal"
  [http.routers.api.tls]
    certResolver = "lets-encrypt"

EOF

# Criar arquivo acme.json
echo "{}" > acme.json
chmod 600 acme.json

cd /home/ec2-user/traefik/

# Subir containers
docker-compose up -d