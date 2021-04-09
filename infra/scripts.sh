#!/bin/bash
echo "Not inteded to be run from the cli but a collection of useful cli commands for reference"
exit 1

az deployment group create --resource-group studious-journey --template-file api-manager-arm.json --parameters ./api-manager-arm-parameters.json 

az deployment group create --resource-group studious-journey --template-file function-arm.json --parameters ./function-arm-parameters.json 
