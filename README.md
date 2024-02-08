# Open Infra

Open Infra is a repository that provides infrastructure and CI/CD codes for open source projects.

## Project Structure

The project is organized as follows:

- **terraform:** Contains Terraform configurations for provisioning infrastructure.
  - **athena:** Local environment for development and testing.
    - **pegasus:** Submodule for the Pegasus microservice.
    - **.terraform.lock.hcl:** Terraform version lock.
    - **configuration.sh:** Script for local environment setup.
    - **main.tf:** Main Terraform configurations.
    - **pegasus.Dockerfile:** Dockerfile for the Pegasus microservice.
    - **terraform.tfvars:** Environment-specific variables.
    - **variables.tf:** Terraform variables definition.
  - **modules:** Reusable Terraform modules.
    - **docker:** Module for configuring Docker services.
      - **docker.tf:** Main configurations for the Docker module.
      - **providers.tf:** Provider configurations for the Docker module.
      - **variables.tf:** Variables definition for the Docker module.
- **.gitignore:** List of files/directories ignored by Git.
- **.gitmodules:** Configuration for Git submodules.
- **LICENSE:** Project license.
- **README.md:** Main project documentation.
- **yarn.lock:** Yarn package manager lock file.

## Getting Started

To use the local infrastructure, follow these steps:

1. **Clone this repository:**
    ```bash
    git clone https://github.com/CRFLuiz/open-infra.git
    ```

2. **Download submodules:**
    ```bash
    cd open-infra
    git submodule init
    git submodule update
    ```

3. **Configure the local environment:**
    ```bash
    ./terraform/athena/configuration.sh
    ```

4. **Run Terraform:**
    ```bash
    cd terraform/athena
    terraform init
    terraform apply -var-file="local.tfvars"
    ```

5. **Contribute and Develop:**
   - Ensure to push relevant changes to submodules if applicable.
   - Refer to the Contribution section for more information.

## Contributing

We'd love to receive contributions! Follow these steps to contribute:

1. Fork the repository.
2. Create a branch for your changes: `git checkout -b my-contribution`.
3. Make desired changes and commit: `git commit -m "My contribution"`.
4. Push to your fork: `git push origin my-contribution`.
5. Open a pull request for review.

## License

This project is licensed under the [MIT License](LICENSE).
