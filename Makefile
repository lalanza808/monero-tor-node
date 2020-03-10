.PHONY: format help

# Help system from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Build container images
	docker-compose build

up: ## Run all the containers in the background
	docker-compose up -d --build

ps: ## Show currently running containers
	docker-compose ps

logs: ## Begin streaming logs to terminal
	docker-compose logs -f

stop: ## Stop all containers
	docker-compose stop

start: ## Start all containers
	docker-compose start

down: ## Stop and remove all containers
	docker-compose down --remove-orphans

clean: ## Stop and remove all containers and their data
	rm -rf ./data/*
