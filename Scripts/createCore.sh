#!/bin/bash

export INITIAL_DIR="${PWD}"
export CORE_DIR="${PWD}/Modules/Core/"

echo "Input the module name without GPS prefix"
read MODULE_NAME

cd ${CORE_DIR}
mkdir ${MODULE_NAME}
cd ${MODULE_NAME}

interfaceName="GPS${MODULE_NAME}Interface"
formattedModuleName="GPS${MODULE_NAME}"

yes "" | pod lib create --template-url=git@github.com:GilsonPSantos/template-module.git $interfaceName "core"
yes "" | pod lib create --template-url=git@github.com:GilsonPSantos/template-module.git $formattedModuleName "core"

cd ${INITIAL_DIR}

echo "Core module created at ${CORE_DIR}${MODULE_NAME}"
