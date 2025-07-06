.PHONY: setup
setup:
	git config core.hooksPath .githooks

# https://docs.fastlane.tools/getting-started/ios/setup/#use-a-gemfile
# https://docs.fastlane.tools/plugins/using-plugins/
# This may not work due to permissions, so use `$ fastlane update` which calls `brew` under the hood
.PHONY: update
update:
	sudo bundle update fastlane
	bundle exec fastlane update_plugins

.PHONY: local
local:
	bundle exec fastlane mac local

.PHONY: beta
beta:
	bundle exec fastlane mac beta

.PHONY: prod
prod:
	bundle exec fastlane mac production
