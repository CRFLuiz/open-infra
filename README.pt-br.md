# Open Infra

Open Infra é um repositório que fornece infraestrutura e códigos CI/CD para projetos open source.

## Estrutura do Projeto

O projeto é organizado da seguinte forma:

- **terraform:** Contém as configurações do Terraform para provisionar infraestrutura.
  - **athena:** Ambiente local para desenvolvimento e testes.
    - **pegasus:** Submódulo para o microserviço Pegasus.
    - **.terraform.lock.hcl:** Bloqueio de versão do Terraform.
    - **configuration.sh:** Script para configuração do ambiente local.
    - **main.tf:** Configurações principais do Terraform.
    - **pegasus.Dockerfile:** Dockerfile para o microserviço Pegasus.
    - **terraform.tfvars:** Variáveis específicas do ambiente.
    - **variables.tf:** Definição de variáveis Terraform.
  - **modules:** Módulos Terraform reutilizáveis.
    - **docker:** Módulo para configurar serviços Docker.
      - **docker.tf:** Configurações principais do módulo Docker.
      - **providers.tf:** Configurações de provedores para o módulo Docker.
      - **variables.tf:** Definição de variáveis para o módulo Docker.
- **.gitignore:** Lista de arquivos/diretórios ignorados pelo Git.
- **.gitmodules:** Configuração dos submódulos Git.
- **LICENSE:** Licença do projeto.
- **README.md:** Documentação principal do projeto.
- **yarn.lock:** Lock file do gerenciador de pacotes Yarn.

## Como Começar

Para usar a infraestrutura local, siga estas etapas:

1. **Clone e acesse este repositório:**
    ```bash
    git clone https://github.com/CRFLuiz/open-infra.git
    cd open-infra
    ```

2. **Baixe os submódulos:**
    ```bash
    git submodule init
    git submodule update
    ```

3. **Configure o ambiente local:**
    ```bash
    ./terraform/athena/configuration.sh
    ```

4. **Execute o Terraform:**
    ```bash
    cd terraform/athena
    terraform init
    terraform apply -var-file="local.tfvars"
    ```

5. **Contribua e Desenvolva:**
   - Certifique-se de enviar alterações relevantes nos submódulos, se aplicável.
   - Consulte a seção de Contribuição para obter mais informações.

## Contribuindo

Adoraríamos receber contribuições! Siga estas etapas para contribuir:

1. Faça um fork do repositório.
2. Crie uma branch para suas alterações: `git checkout -b minha-contribuicao`.
3. Faça as alterações desejadas e commit: `git commit -m "Minha contribuição"`.
4. Envie para o seu fork: `git push origin minha-contribuicao`.
5. Abra um pull request para revisão.

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).
