#!/bin/bash -eu
environment=development
appshortname=web-app
az deployment group create \
  --name $appshortname-$environment \
  --resource-group $appshortname-$environment \
  --template-file ../template/template.json \
  --parameters ../template/parameters.json \
  --verbose
