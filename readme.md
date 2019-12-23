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

### Prerequisites:

#### Function App in Azure - [Azure Portal](https://portal.azure.com/) - [Create New](https://github.com/MuddassirNayyer/CreateAzureFunctionApp)

#### Bitbukcet Repository - [Bitbucket.org](https://bitbucket.org/) - [Create New](https://github.com/MuddassirNayyer/CreateBitbucketRepo) 

-------------------------------------------------------------------------------------------------------------------------------------

## Steps with Azure CLI


#### 1: Upload [yaml script](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/funcApp.yaml), to the root directory of the (Github or TfsGit) repo (used for pipeline automation) and Bitbucket Repo (actual repository), for a multi-stage ci/cd pipeline automation

#### 2: Create Service Connection in Azure Devops Project - [Steps](https://github.com/MuddassirNayyer/CreateServiceConnection)

#### 3: Azure CLI - [CLI Pipeline Script (.Net Core)](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/pipelinesSetupCli.sh) - [Azure Cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) - Run in Azure CLI

#### 4: Change Repo to Bitbucket

<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do1..PNG" alt="drawing" width="600"/>

--------------------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do2..PNG" alt="drawing" width="400"/>

--------------------------------------------------------------------------------------------------------------------------------------

<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do3.PNG" alt="drawing" width="600"/>

--------------------------------------------------------------------------------------------------------------------------------------


## Steps with Azure DevOps GUI

### 1: Go to DevOps Project and Pieplines
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do4.PNG" alt="drawing" width="450"/>

### 2: Select Bitbucket Cloud 
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do5.PNG" alt="drawing" width="450"/>

### 3: Select the Bitbucket Repo
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do6.PNG" alt="drawing" width="450"/>

### 4: Select the template
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do7.PNG" alt="drawing" width="450"/>

### 5: Select the subscription
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do8.PNG" alt="drawing" width="450"/>

### 6: Select the Azure Function App
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do9.PNG" alt="drawing" width="450"/>

### 7: Add Task to run 'Unit Tests'
<img src="https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/do10.PNG" alt="drawing" width="450"/>

<pre><code>

- task: DotNetCoreCLI@2
      displayName: 'Run Tests'
      inputs:
        command: test
        projects: '**/*Tests/*.csproj'
        arguments: '--configuration $(buildConfiguration)'
        
</code></pre>
