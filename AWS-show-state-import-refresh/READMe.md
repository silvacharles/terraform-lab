# Comandos utilizados

#### Mostra em formato JSON

<code>terraform show</code>

### Listagem de quais recursos no state

<code>terraform state list</code>

### Alterar o nome do recurso no state

<code>terraform mv aws_s3_bucket.nomeatual aws_s3_bucket.nomenovo</code>

### Baixar state remoto

<code>terraform state pull > state.tfstate</code>

### Fazer upload do arquivo state

<code>terraform state push -force state.tfstate</code>

### Remover um recurso

<code>terraform state rm aws_s3_bucket.nome</code>

### Importar recurso 

<code>terraform import aws_s3_bucket.nomerecursobucket nomebucket </code>

### Refresh para o terraform (obs: não altera o aquivo quando utiliza o comando plan)

<code>terraform refresh</code>

### Reinicia state do zero

<code>terraform init -reconfigure</code>

### Migra alterações do backend

<code>terraform migrate-state</code>

### configuração backend

<code>terraform init -backend-config=backend-dev.hcl -reconfigure</code>