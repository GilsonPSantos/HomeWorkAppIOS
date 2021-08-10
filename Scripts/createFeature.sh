#!/bin/bash

export INITIAL_DIR="${PWD}"
export FEATURES_DIR="${PWD}/Modules/Features"

echo "Input the feature name without GPS prefix"
read FEATURE_NAME

cd ${FEATURES_DIR}

formattedFeatureName="GPS${FEATURE_NAME}"

yes "" | pod lib create --template-url=git@github.com:GilsonPSantos/template-module.git $formattedFeatureName "feature"
cd $formattedFeatureName
cd Example
python3 createSwiftLint.py

cd ${INITIAL_DIR}

echo "Feature created at ${FEATURES_DIR}"
