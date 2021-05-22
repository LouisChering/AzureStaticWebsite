#!/bin/bash -eu

environment=staging
appshortname=web-app
location="West Europe"

az group create --name $appshortname-$environment  --location "$location"

az deployment group create \
  --name $appshortname-$environment \
  --resource-group $appshortname-$environment \
  --template-file ../template/template.json \
  --parameters ../template/parameters.json \
  --verbose
