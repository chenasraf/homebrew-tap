.PHONY: update-hash
update-hash:
	@./scripts/update-hash.sh

.PHONY: create-app-update
create-app-update: update-hash
	@./scripts/create-app-update.sh
