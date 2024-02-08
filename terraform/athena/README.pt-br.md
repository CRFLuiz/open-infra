# Projeto Athena - Open Infra

O projeto Athena faz parte do repositório Open Infra e é dedicado ao ambiente local para desenvolvimento e testes. Aqui você encontrará informações sobre a estrutura do projeto, como começar, configurações Terraform e submódulos específicos para microservices como Pegasus.

## Estrutura do Projeto

- **pegasus:** Submódulo para o microserviço Pegasus.
- **.terraform.lock.hcl:** Bloqueio de versão do Terraform.
- **configuration.sh:** Script para configuração do ambiente local.
- **main.tf:** Configurações principais do Terraform.
- **pegasus.Dockerfile:** Dockerfile para o microserviço Pegasus.
- **terraform.tfvars:** Variáveis específicas do ambiente.
- **variables.tf:** Definição de variáveis Terraform.

## Como Começar

Para usar o ambiente local do projeto Athena, siga estas etapas:

1. **Clone e acesse o repositório Open Infra:**
    ```bash
    git clone https://github.com/CRFLuiz/open-infra.git
    cd open-infra/
    ```

2. **Baixe os submódulos:**
    ```bash
    git submodule init
    git submodule update
    ```

3. **Navegue até a pasta do projeto Athena:**
    ```bash
    cd terraform/athena
    ```

4. **Configure o ambiente local:**
    ```bash
    ./configuration.sh
    ```

5. **Execute o Terraform:**
    ```bash
    terraform init
    terraform plan -var-file="local.tfvars"
    terraform apply -var-file="local.tfvars"
    ```

Consulte o [README.md](../../README.md) principal do projeto Open Infra para informações sobre a estrutura geral do projeto e como contribuir.

Continue lendo para detalhes específicos sobre configurações Terraform, submódulos e contribuições.


# Configurações Terraform

O projeto Athena utiliza o Terraform para provisionar a infraestrutura local. Aqui estão os detalhes das configurações principais.

## Terraform Lock e Configurações Principais

- **.terraform.lock.hcl:** Este arquivo contém o bloqueio de versão do Terraform. Certifique-se de revisar este arquivo antes de realizar alterações significativas nas configurações do Terraform.

- **main.tf:** O arquivo principal de configuração do Terraform, onde as configurações específicas do ambiente local são definidas. 

## Dockerfile para Pegasus

- **pegasus.Dockerfile:** Este Dockerfile é usado para construir a imagem Docker para o microserviço Pegasus. Certifique-se de revisar e personalizar conforme necessário.

## Variáveis Terraform

- **terraform.tfvars:** Este arquivo contém variáveis específicas do ambiente local. Antes de executar o Terraform, certifique-se de revisar e fornecer os valores necessários.

- **variables.tf:** Neste arquivo, as variáveis Terraform são definidas. Certifique-se de revisar caso precise ajustar as variáveis.

Continue lendo para obter detalhes sobre os submódulos e como contribuir.


# Submódulos

Os submódulos são repositórios dos microserviços referente ao projeto athena. Você pode personalizar conforme necessário e ver a atualização em tempo real utilizando o ambiente local.

## Estrutura do Submódulo

- **Pegasus:** [CRFLuiz/pegasus](https://github.com/CRFLuiz/pegasus)
- **Dockerfile:** O Dockerfile específico para construir a imagem Docker para o microserviço Pegasus. Deve haver um dentro de cada submódulo.


# Contribuindo

Adoramos receber contribuições! Siga estas etapas para contribuir:

1. Faça um fork do repositório.
2. Crie uma branch para suas alterações: `git checkout -b minha-contribuicao`.
3. Faça as alterações desejadas e commit: `git commit -m "Minha contribuição"`.
4. Envie para o seu fork: `git push origin minha-contribuicao`.
5. Abra um pull request para revisão.

Certifique-se de incluir detalhes sobre suas alterações, especialmente se estiver contribuindo para o submódulo Pegasus.

## Licença

Este projeto é licenciado sob a [Licença MIT](../../LICENSE). Se você não concorda com os termos desta licença, não contribua ou use o projeto.
