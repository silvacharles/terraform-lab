# Método — Backup e restore (o jeito certo)

## 1. Descobrir os volumes

<code>docker volume ls</code>

## 2. Fazer backup dos volumes

### WordPress (arquivos)
<code>docker run --rm \
  -v wordpress_wordpress:/volume \
  -v $(pwd):/backup \
  alpine \
  tar czf /backup/wordpress.tar.gz -C /volume .</code>

### Banco de dados (MySQL/MariaDB)

<code>docker exec -t nome_do_container_db \
  mysqldump -u root -pSENHA wordpress > db.sql</code>

  ## 3. Transferir arquivos

  <code>scp wordpress.tar.gz db.sql usuario@NOVO_SERVIDOR:/home/ec2-user/wordpress/</code>

  ## 4. Restaurar no novo servidor

  <code>docker volume create wordpress_wordpress \
docker volume create wordpress_db</code>


### Restaurar arquivos do WordPress

<code>docker run --rm \
  -v wordpress_wordpress:/volume \
  -v $(pwd):/backup \
  alpine \
  sh -c "cd /volume && tar xzf /backup/wordpress.tar.gz"</code>


 ## Subir containers (docker-compose ou docker run) 

 ### Restaurar banco

<code> docker exec -i nome_container_db \
  mysql -u root -pSENHA wordpress < db.sql</code>

 