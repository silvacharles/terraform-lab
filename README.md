# Terraform Lab — Infrastructure as Code

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)

Repositório de laboratórios práticos com **Terraform**, voltado ao provisionamento e gerenciamento de infraestrutura como código (Infrastructure as Code — IaC) em ambientes AWS e Microsoft Azure.

Os projetos documentam configurações reais presentes nos arquivos `.tf`, com diagramas de arquitetura, objetivos, recursos provisionados, pré-requisitos e instruções de execução.

## Laboratórios

| Laboratório | Conteúdo |
|---|---|
| [AWS-Bucket](./AWS-Bucket/) | Criação de bucket Amazon S3. |
| [AWS-S3-local-state](./AWS-S3-local-state/) | Bucket S3 provisionado com Terraform; state do laboratório permanece local. |
| [AWS-Azure-Remote-State](./AWS-Azure-Remote-State/) | Provisionamento de recursos de armazenamento em AWS e Azure para estudos de state. |
| [AWS-VPC](./AWS-VPC/) | VPC, subnet, Internet Gateway, tabela de rotas e Security Group. |
| [AWS-VM-RemoteState](./AWS-VM-RemoteState/) | EC2 consumindo outputs do state remoto da VPC. |
| [AWS-blocos-moved-removed-import](./AWS-blocos-moved-removed-import/) | Estudo de gerenciamento de recursos e endereços no Terraform. |
| [AWS-show-state-import-refresh](./AWS-show-state-import-refresh/) | Comandos e operações de Terraform State. |
| [terraform-billing-multi-alert](./terraform-billing-multi-alert/) | Alarmes de custos estimados com CloudWatch e notificações SNS. |
| [terraform-ec2-wordpress](./terraform-ec2-wordpress/) | EC2 com Docker, Traefik, WordPress, MySQL e phpMyAdmin. |

## Tecnologias

- [Terraform](https://developer.hashicorp.com/terraform)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- Amazon S3, EC2, VPC, CloudWatch e SNS
- Microsoft Azure Resource Manager e Storage Account
- Docker, Docker Compose e Traefik
- Git e GitHub

## Como começar

### Pré-requisitos
- Terraform instalado (verifique a versão exigida no `required_version` de cada laboratório).
- Credenciais e permissões necessárias para AWS e/ou Azure.
- AWS CLI, quando necessário.
- Git.

### Clonar
```bash
git clone https://github.com/silvacharles/terraform-lab.git
cd terraform-lab
```

### Executar um laboratório
Entre no diretório desejado e execute:
```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
```
Após revisar o plano, aplique:
```bash
terraform apply
```

Para destruir os recursos criados por aquele laboratório:
```bash
terraform destroy
```

> Execute os comandos dentro do diretório do laboratório. Cada projeto possui configuração e state próprios. Revise sempre o plano e os custos antes de aplicar ou destruir recursos.

## Diagramas e documentação

Cada laboratório possui um `README.md` próprio e os seguintes arquivos em `docs/`:
- `architecture.png`: diagrama visual para consulta rápida.
- `architecture.mmd`: fonte Mermaid editável.

Os diagramas representam os recursos e as relações identificadas nos arquivos enviados. Quando o diretório tem uma diferença entre o nome/objetivo sugerido e a configuração efetivamente declarada, isso está sinalizado no README correspondente.

## Segurança

- Nunca versione Access Keys, Secret Keys, tokens, senhas, chaves privadas ou arquivos de state.
- Não publique arquivos `.tfvars` com dados sensíveis.
- Restrinja SSH e interfaces administrativas a endereços confiáveis.
- Use secrets ou mecanismos de credenciais apropriados.
- Revise `terraform plan` antes de aplicar.
- Trate `terraform.tfstate` e backups como dados sensíveis.

## Autor

**Charles Silva**  
Analista de Redes e Infraestrutura | Cloud Computing | DevOps | Infrastructure as Code  
CEO — [RootSys Consultoria](https://rootsys.com.br)

- GitHub: [@silvacharles](https://github.com/silvacharles)

---

*Learning by building. Automating infrastructure, one resource at a time.* ☁️

## Licença

Consulte o arquivo [LICENSE](./LICENSE).
