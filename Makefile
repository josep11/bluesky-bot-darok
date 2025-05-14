default: help

## Help
help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-\_0-9%:\\]+/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
		helpCommand = $$1; \
		helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
	gsub("\\\\", "", helpCommand); \
	gsub(":+$$", "", helpCommand); \
		printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

## start
start:
	NODE_ENV=production npm start
	@$(call log-success,"Run successful")

## start-dev
start-dev:
	npm start
	@$(call log-success,"Run successful")

## make notify MESSAGE="my message"
notify:
	@$(shell /opt/homebrew/bin/terminal-notifier -message "${MESSAGE}")

## Install the dependencies
npm/i:
	npm i

## Run npm audit
npm/audit:
	npm audit

## Run npm audit fix (force)
npm/audit-fix:
	npm audit fix --force

## Run update deps for all of them
update-deps:
	ncu -u && npm i && npm test
