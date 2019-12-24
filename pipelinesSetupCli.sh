#!/bin/bash

# Variables: Project Configuration
projectName=TestProjectFromCli
organization=https://dev.azure.com/exampleOrg/

# Variables: Build/Release Pipeline Configuration
pipelineName=pipelineName
pipelineDescription=pipelineDescription
repositoryType=tfsgit # {github, tfsgit}
repositoryCloneUri=https://github.com/ExampleUserName/testRepo.git
repoBranch=master
skipFirstRun=false # {true, false}
yamlPipelinePath=/funcApp.yaml # yaml script to generate build pipeline, place it at root of the repository

# DevOps Extension: Install if not already installed
az extension add --name azure-devops

# Connect with DevOps account
az login

# Set Default DevOps Organization
az devops configure \
	--defaults organization=$organization

# Create build/Release pipeline
az pipelines create \
	--name $buildPipelineName \
	--description $buildPipelineName \
	--repository $repositoryCloneUri --branch $repoBranch --repository-type $repositoryType \
	--yaml-path $yamlPipelinePath \
	--project $projectName \
	--org $organization \
	--skip-first-run $skipFirstRun

