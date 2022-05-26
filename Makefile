# Makefile

# Run `$ make` to see docummentation
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

###########################################################################################################################################

# Scripts

SCRIPTS_DIR = ./Scripts

service: ## Run createService script
	bash $(SCRIPTS_DIR)/createService.sh

feature: ## Run createFeature script
	bash $(SCRIPTS_DIR)/createFeature.sh

core: ## Run createFeature script
	bash $(SCRIPTS_DIR)/createCore.sh

duplicate_and_replace: ## Duplicate and replace all files and their content replacing a word for another
	python3 $(SCRIPTS_DIR)/duplicateAndReplace.py