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

