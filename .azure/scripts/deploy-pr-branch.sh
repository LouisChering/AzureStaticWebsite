#!/bin/bash -eu

environment=development
appshortname=web-app
location="West Europe"
expires=$(date -d "+1 week" +%Y%m%d)

gitsha=$(git rev-parse --short HEAD)
gitshortsha=$(git rev-parse --short $gitsha)
owner=$(git log -1 --pretty=format:'%an')

az group create --name $appshortname-$environment-$gitshortsha  --location "$location" --tags pr-branch=true expires=$expires sha=$gitsha owner="$owner"

az deployment group create \
  --name $appshortname-$environment-$gitshortsha \
  --resource-group $appshortname-$environment-$gitshortsha \
  --template-file ../template/template.json \
  --parameters ../template/parameters.json \
  --verbose
