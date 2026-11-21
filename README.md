# ☁️ Terraform Lab — Infrastructure as Code

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![License](https://img.shields.io/badge/License-GPL--3.0-blue?style=for-the-badge)

Repositório dedicado ao aprendizado, experimentação e implementação de infraestrutura como código (Infrastructure as Code — IaC), utilizando **Terraform** para provisionamento e gerenciamento de recursos em ambientes de Cloud Computing.

O laboratório reúne projetos práticos, experimentos e implementações envolvendo AWS, Microsoft Azure, gerenciamento de infraestrutura, automação, armazenamento de estado e monitoramento de custos.

O objetivo é consolidar conhecimentos em Cloud Infrastructure, automação e práticas de infraestrutura escalável, reproduzível e versionada.

---

## 🎯 Objetivos

- Aprender e aprofundar conhecimentos em Terraform.
- Implementar infraestrutura como código (IaC).
- Automatizar o provisionamento de recursos em Cloud Computing.
- Trabalhar com provedores AWS e Microsoft Azure.
- Compreender o funcionamento do Terraform State.
- Implementar gerenciamento de estado local e remoto.
- Explorar integração entre diferentes provedores de nuvem.
- Aplicar boas práticas de organização, manutenção e versionamento de infraestrutura.
- Desenvolver soluções de monitoramento e controle de custos em ambientes Cloud.

## 🛠️ Tecnologias e ferramentas

| Tecnologia | Aplicação |
|---|---|
| Terraform | Provisionamento e gerenciamento de infraestrutura |
| AWS | Infraestrutura em nuvem |
| Microsoft Azure | Infraestrutura em nuvem |
| Amazon S3 | Armazenamento e gerenciamento de Terraform State |
| AWS EC2 | Instâncias de computação |
| AWS VPC | Redes virtuais e conectividade |
| AWS CloudWatch | Monitoramento e alertas |
| Git / GitHub | Versionamento e documentação |

## 📂 Estrutura do repositório

Os laboratórios estão organizados em diretórios independentes, permitindo estudar e executar cada implementação separadamente.

| Diretório | Descrição |
|---|---|
| [AWS-Azure-Remote-State](./AWS-Azure-Remote-State) | Estudos de gerenciamento de estado remoto envolvendo AWS e Azure. |
| [AWS-Bucket](./AWS-Bucket) | Criação e gerenciamento de Buckets S3 utilizando Terraform. |
| [AWS-S3-local-state](./AWS-S3-local-state) | Estudos de gerenciamento de estado local e armazenamento no Amazon S3. |
| [AWS-VM-RemoteState](./AWS-VM-RemoteState) | Laboratório de infraestrutura com gerenciamento de estado remoto. |
| [AWS-VPC](./AWS-VPC) | Provisionamento e gerenciamento de redes virtuais na AWS. |
| [AWS-blocos-moved-removed-import](./AWS-blocos-moved-removed-import) | Gerenciamento do ciclo de vida de recursos utilizando os blocos `moved`, `removed` e `import`. |
| [AWS-show-state-import-refresh](./AWS-show-state-import-refresh) | Estudos de Terraform State, importação de recursos e atualização do estado. |
| [terraform-billing-multi-alert](./terraform-billing-multi-alert) | Implementação de alertas e monitoramento de custos na AWS. |
| [terraform-ec2-wordpress](./terraform-ec2-wordpress) | Provisionamento de infraestrutura EC2 para hospedagem WordPress. |

## 🚀 Como utilizar

### Pré-requisitos

Antes de executar os laboratórios, certifique-se de possuir:

- [Terraform](https://developer.hashicorp.com/terraform/install) instalado.
- Conta ativa na AWS e/ou Microsoft Azure, conforme o laboratório.
- AWS CLI configurado, quando necessário.
- Git instalado.
- Credenciais e permissões adequadas para os recursos utilizados.

### Clonando o repositório

```bash
git clone https://github.com/silvacharles/terraform-lab.git

cd terraform-lab
```

### Executando um laboratório

Entre no diretório do projeto desejado:

```bash
cd AWS-VPC
```

Inicialize o Terraform:

```bash
terraform init
```

Valide a configuração:

```bash
terraform validate
```

Visualize o plano de execução:

```bash
terraform plan
```

Execute o provisionamento, após revisar as alterações:

```bash
terraform apply
```

Para remover os recursos provisionados por um laboratório:

```bash
terraform destroy
```

> **Atenção:** os comandos devem ser executados dentro do diretório do laboratório correspondente. Revise sempre o plano de execução antes de aplicar alterações na infraestrutura.

## 🔐 Segurança e boas práticas

Este repositório também considera aspectos importantes para o gerenciamento seguro de infraestrutura como código.

- Não armazenar Access Keys, Secret Keys, tokens ou senhas no código.
- Utilizar variáveis de ambiente ou mecanismos seguros de gerenciamento de credenciais.
- Evitar versionar arquivos de estado (`terraform.tfstate`).
- Não publicar arquivos `.tfvars` contendo informações sensíveis.
- Utilizar `.gitignore` para proteger arquivos temporários e credenciais.
- Revisar alterações antes de executar `terraform apply` ou `terraform destroy`.
- Utilizar armazenamento remoto e mecanismos de controle de acesso para estados compartilhados.

## 📚 Referências e documentação

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Microsoft Azure Documentation](https://learn.microsoft.com/azure/)

## 📈 Evolução do laboratório

Este repositório é um ambiente de aprendizado contínuo.

Novos laboratórios, experimentos e implementações serão adicionados conforme a evolução dos estudos em:

- Infrastructure as Code (IaC).
- Cloud Computing.
- AWS e Microsoft Azure.
- Terraform Modules.
- Remote State e State Management.
- Cloud Security.
- Infrastructure Automation.
- FinOps e Cloud Cost Optimization.
- DevOps e Infrastructure Engineering.

## 👨‍💻 Autor

**Charles Silva**

Analista de Redes e Infraestrutura | Cloud Computing | DevOps | Infrastructure as Code

CEO — [RootSys Consultoria](https://rootsys.com.br)

- GitHub: [@silvacharles](https://github.com/silvacharles)
- LinkedIn: [Charles Silva](https://www.linkedin.com/in/charles-silva/)

---

**Learning by building. Automating infrastructure, one resource at a time.** ☁️

---

## 📄 Licença

Este projeto está licenciado sob a [GNU General Public License v3.0](./LICENSE).
