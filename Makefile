.PHONY: setup
setup:
	git config core.hooksPath .githooks

# Fastlane will automatically run `$ brew upgrade fastlane` as part of this
.PHONY: fastlane-update
fastlane-update:
	fastlane update_fastlane

.PHONY: local
local:
	fastlane mac local

.PHONY: beta
beta:
	fastlane mac beta

.PHONY: prod
prod:
	fastlane mac release
