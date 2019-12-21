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

## 4: Create Bitbukcet Repository - [Bitbucket.org](https://bitbucket.org/)

### Step 4.1: Click on '+' icon
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%201.PNG)

### Step 4.2: Click on Repository
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%202.PNG)

### Step 4.3: Enter required Reposioty Information and create Repo
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%203.PNG)

### Step 4.4: Copy this Remote access Repository Link
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/B%204.PNG)



## Create a Function App manually in Azure Subscription

## 1: Create Function App in Azure - [Azure Portal](https://portal.azure.com/)

### Step 1.1: Create Function App in Azure Portal
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%201.PNG)

### Step 1.2: Click on Add
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%202.PNG)

### Step 1.3: Add Basic Information
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%203.PNG)

### Step 1.4: Change Hosting and Select Service Plan
![](https://github.com/MuddassirNayyer/azure-devops-cicd/blob/master/Images/AZ%204.PNG)



## Azure Build Automation Script 

<pre><code>

#!/bin/bash

# Variables: Project Configuration
projectName=TestProjectFromCli
organization=https://dev.azure.com/exampleOrg/

# Variables: Build Pipeline Configuration
buildPipelineName=testBuildPipelineName
buildPipelineDescription=testBuildPipelineDescription
repositoryType=tfsgit # {github, tfsgit}
repositoryCloneUri=https://github.com/ExampleUserName/testRepo.git
repoBranch=master
skipFirstRun=false # {true, false}
yamlPipelinePath=/[funcAppBuildPipeline.yaml](https://github.com/MuddassirNayyer/azure-devops-bitbucket-cicd/blob/master/funcAppBuildPipeline.yaml) # yaml script to generate build pipeline, place it at root of the repository

# DevOps Extension: Install if not already installed
az extension add --name azure-devops

# Connect with DevOps account
az login

# Set Default DevOps Organization
az devops configure \
	--defaults organization=$organization

# Create build pipeline
az pipelines create \
	--name $buildPipelineName \
	--description $buildPipelineName \
	--repository $repositoryCloneUri --branch $repoBranch --repository-type $repositoryType \
	--yaml-path $yamlPipelinePath \
	--project $projectName \
	--org $organization \
	--skip-first-run $skipFirstRun

</code></pre>
