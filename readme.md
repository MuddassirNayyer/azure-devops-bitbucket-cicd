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

## Create a **private** git repo on Bitbucket.org with the following source code: https://github.com/vkhazin/azure-function-cli

## 1: Create Bitbukcet Repository - [Bitbucket.org](https://bitbucket.org/)

### Step 1.1: Click on '+' icon
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%201.PNG)

### Step 1.2: Click on Repository
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%202.PNG)

### Step 1.3: Enter required Reposioty Information and create Repo
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%203.PNG)

### Step 1.4: Copy this Remote access Repository Link
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%204.PNG)

### 2: To import this newly created or any other existing Bitbucket Repo to Azure DevOps, [Click Here](https://developercommunity.visualstudio.com/content/problem/348941/repository-sync-from-bitbucket.html)

### 3: Upload [yaml script](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/funcAppBuildPipeline.yaml), to the root directory of the repo, for build pipeline automation

## 4: Create Function App in Azure - [Azure Portal](https://portal.azure.com/)

### Step 4.1: Create Function App in Azure Portal
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%201.PNG)

### Step 4.2: Click on Add
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%202.PNG)

### Step 4.3: Add Basic Information and Click Create
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%203.PNG)



## 5: Azure CLI - [Build Pipeline Script (.Net Core)](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/pipelinesSetupCli.sh) - [Azure Cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) - Run in Azure CLI


### Variables: Project Configuration
<pre><code>
projectName=TestProjectFromCli
organization=https://dev.azure.com/exampleOrg/
</code></pre>

### Variables: Build Pipeline Configuration
<pre><code> 
buildPipelineName=testBuildPipelineName
buildPipelineDescription=testBuildPipelineDescription
repositoryType=tfsgit # {github, tfsgit}
repositoryCloneUri=https://github.com/ExampleUserName/testRepo.git
repoBranch=master
skipFirstRun=false # {true, false}
yamlPipelinePath=/funcAppBuildPipeline.yaml # yaml script to generate build pipeline, place it at root of the repository
</code></pre>

### DevOps Extension: Install if not already installed
<pre><code>
az extension add --name azure-devops
</code></pre>

### Connect with DevOps account
<pre><code>
az login
</code></pre>


### Set Default DevOps Organization
<pre><code>
az devops configure \
	--defaults organization=$organization

</code></pre>


### Create build pipeline
<pre><code>
az pipelines create \
	--name $buildPipelineName \
	--description $buildPipelineName \
	--repository $repositoryCloneUri --branch $repoBranch --repository-type $repositoryType \
	--yaml-path $yamlPipelinePath \
	--project $projectName \
	--org $organization \
	--skip-first-run $skipFirstRun
</code></pre>
