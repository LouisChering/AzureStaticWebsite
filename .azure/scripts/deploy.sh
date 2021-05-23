#!/bin/bash -eu

environment=temp
appname=web-application
location="West Europe"

# az group create --name $appname-$environment  --location "$location"

az deployment group create \
  --name $appname-$environment \
  --resource-group $appname-$environment \
  --template-file ../template/template.json \
  --parameters ../template/parameters.json \
  --verbose
