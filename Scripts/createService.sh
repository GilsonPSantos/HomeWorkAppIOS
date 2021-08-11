#!/bin/bash

export INITIAL_DIR="${PWD}"
export FEATURES_DIR="${PWD}/Modules/Services"

echo "Input the service name without GPS prefix"
read FEATURE_NAME

cd ${FEATURES_DIR}
formattedFeatureName="GPS${FEATURE_NAME}"

yes "" | pod lib create --template-url=git@github.com:GilsonPSantos/template-module.git $formattedFeatureName "service"

cd $formattedFeatureName
cd Example
python3 createSwiftLint.py

cd ${INITIAL_DIR}

echo "Service created at ${FEATURES_DIR}"
