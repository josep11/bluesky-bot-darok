default: help

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
