# Notas da revisão documental

Esta revisão atualizou os READMEs e adicionou diagramas com base exclusivamente nos arquivos incluídos no ZIP recebido.

Itens identificados para revisão técnica posterior:
- `AWS-Azure-Remote-State`: cria recursos S3 e Azure Storage, mas não declara um backend remoto Terraform.
- `AWS-S3-local-state`: cria um bucket S3, mas não declara backend S3.
- `AWS-blocos-moved-removed-import`: o código atual não contém blocos `moved`, `removed` ou `import`; apenas declara três buckets.
- `AWS-VPC`: a regra SSH permite `0.0.0.0/0`; restringir antes de uso real.
- `AWS-VM-RemoteState` e `terraform-ec2-wordpress`: referenciam `aws-key.pub`, ausente no ZIP.
- `terraform-ec2-wordpress`: há senha literal no Compose e o script não cria explicitamente a rede Docker externa `traefik` antes de iniciar o Compose.
- `AWS-show-state-import-refresh`: a documentação original cita `terraform migrate-state`; o comando atual para migrar backend é `terraform init -migrate-state`. O uso de `terraform refresh` é legado; considerar `plan -refresh-only`.

Nenhum arquivo de infraestrutura (`.tf`, `.sh`, `.yml`) foi alterado nesta entrega. Foram criados/atualizados somente documentação e diagramas.
