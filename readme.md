# Azure DevOps Bitbucket CI/CD

## Overview

* Automate setup of ci/cd pipeline on Azure DevOps with Bitbucket.org repository
* Create a **private** git repo on Bitbucket.org with the following source code: https://github.com/vkhazin/azure-function-cli
* Create a Function App manually in Azure Subscription
* Build a script using [azure cli](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) that will automate the setup of Azure DevOps pipeline
* The pipeline will run on commit to master branch
* The pipeline will run unit tests
* The pipeline will update existing Function App deployment
* The script to be called with the required parameters - nothing is hard-coded inside the script

-------------------------------------------------------------------------------------------------------------------------------------

#### 1: Create Bitbukcet Repository - [Bitbucket.org](https://bitbucket.org/) - [Steps](https://github.com/MuddassirNayyer/CreateBitbucketRepo) 

#### 2: To import a Bitbucket Repo to Azure DevOps, [Click Here](https://developercommunity.visualstudio.com/content/problem/348941/repository-sync-from-bitbucket.html)

#### 3: Upload [yaml script](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/funcApp.yaml), to the root directory of the repo, for a multi-stage ci/cd pipeline automation

#### 4: Create Function App in Azure - [Azure Portal](https://portal.azure.com/) - [Steps](https://github.com/MuddassirNayyer/CreateAzureFunctionApp)

#### 5: Azure CLI - [Build Pipeline Script (.Net Core)](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/pipelinesSetupCli.sh) - [Azure Cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) - Run in Azure CLI
