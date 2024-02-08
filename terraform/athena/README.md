# Athena Project - Open Infra

The Athena project is part of the Open Infra repository and is dedicated to the local environment for development and testing. Here you will find information about the project structure, how to get started, Terraform configurations, and specific submodules for microservices like Pegasus.

## Project Structure

- **pegasus:** Submodule for the Pegasus microservice.
- **.terraform.lock.hcl:** Terraform version lock.
- **configuration.sh:** Script for local environment setup.
- **main.tf:** Main Terraform configurations.
- **pegasus.Dockerfile:** Dockerfile for the Pegasus microservice.
- **terraform.tfvars:** Environment-specific variables.
- **variables.tf:** Terraform variables definition.

## Getting Started

To use the local environment of the Athena project, follow these steps:

1. **Clone and access the Open Infra repository:**
    ```bash
    git clone https://github.com/CRFLuiz/open-infra.git
    cd open-infra/
    ```

2. **Download submodules:**
    ```bash
    git submodule init
    git submodule update
    ```

3. **Navigate to the Athena project folder:**
    ```bash
    cd terraform/athena
    ```

4. **Configure the local environment:**
    ```bash
    ./configuration.sh
    ```

5. **Run Terraform:**
    ```bash
    terraform init
    terraform plan -var-file="local.tfvars"
    terraform apply -var-file="local.tfvars"
    ```

Refer to the [README.md](../../README.md) main document of the Open Infra project for information about the overall project structure and how to contribute.

Continue reading for specific details on Terraform configurations, submodules, and contributions.


# Terraform Configurations

The Athena project uses Terraform to provision the local infrastructure. Here are details about the main configurations.

## Terraform Lock and Main Configurations

- **.terraform.lock.hcl:** This file contains the Terraform version lock. Make sure to review this file before making significant changes to Terraform configurations.

- **main.tf:** The main Terraform configuration file where specific settings for the local environment are defined.

## Pegasus Dockerfile

- **pegasus.Dockerfile:** This Dockerfile is used to build the Docker image for the Pegasus microservice. Make sure to review and customize as needed.

## Terraform Variables

- **terraform.tfvars:** This file contains environment-specific variables. Before running Terraform, make sure to review and provide the necessary values.

- **variables.tf:** In this file, Terraform variables are defined. Make sure to review if adjustments to variables are needed.

Continue reading for details on submodules and how to contribute.


# Submodules

Submodules are repositories for microservices related to the Athena project. You can customize as needed and see real-time updates using the local environment.

## Submodule Structure

- **Pegasus:** [CRFLuiz/pegasus](https://github.com/CRFLuiz/pegasus)
- **Dockerfile:** The specific Dockerfile to build the Docker image for the Pegasus microservice. There should be one within each submodule.


# Contributing

We love to receive contributions! Follow these steps to contribute:

1. Fork the repository.
2. Create a branch for your changes: `git checkout -b my-contribution`.
3. Make desired changes and commit: `git commit -m "My contribution"`.
4. Push to your fork: `git push origin my-contribution`.
5. Open a pull request for review.

Make sure to include details about your changes, especially if you are contributing to the Pegasus submodule.

## License

This project is licensed under the [MIT License](../../LICENSE). If you do not agree with the terms of this license, do not contribute or use the project.
