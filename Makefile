.PHONY: update-hash
update-hash:
	@if [ -z "$$REPO_NAME" ]; then \
		read -r -p "Enter repository name: " REPO_NAME; \
	else \
		REPO_NAME="$$REPO_NAME"; \
	fi; \
	VERSION=$$(curl -s "https://api.github.com/repos/chenasraf/$$REPO_NAME/releases/latest" | jq -r .tag_name); \
	URL="https://github.com/chenasraf/$$REPO_NAME/archive/refs/tags/$$VERSION.tar.gz"; \
	echo "Version: $$VERSION"; \
	echo "URL: $$URL"; \
	curl -Ls "$$URL" -o "$$REPO_NAME-$$VERSION.tar.gz"; \
	HASH=$$(sha256sum "$$REPO_NAME-$$VERSION.tar.gz" | awk '{print $$1}'); \
	printf "SHA256: %s\n" "$$HASH"; \
	rm "$$REPO_NAME-$$VERSION.tar.gz"; \
	sed -i.bak "s/sha256 \".*\"/sha256 \"$$HASH\"/" "Formula/$$REPO_NAME.rb"; \
	rm "Formula/$$REPO_NAME.rb.bak"; \
	sed -i.bak "s| url \".*\"| url \"$$URL\"|" "Formula/$$REPO_NAME.rb"; \
	rm "Formula/$$REPO_NAME.rb.bak"

.PHONY: create-app-update
create-app-update:
	@if [ -z "$$REPO_NAME" ]; then \
		read -r -p "Enter repository name: " REPO_NAME; \
	else \
		REPO_NAME="$$REPO_NAME"; \
	fi; \
	$(MAKE) update-hash REPO_NAME="$$REPO_NAME"; \
	VERSION=$$(curl -s "https://api.github.com/repos/chenasraf/$$REPO_NAME/releases/latest" | jq -r .tag_name); \
	echo "Version: $$VERSION"; \
	BRANCH="feature/$$REPO_NAME-$$VERSION"; \
	if ! git switch -C "$$BRANCH"; then \
		echo "Branch already exists, aborting"; \
		exit 1; \
	fi; \
	git add "Formula/$$REPO_NAME.rb"; \
	git commit -m "feat: update $$REPO_NAME to $$VERSION"; \
	git push --force --set-upstream origin "$$BRANCH"; \
	if gh pr create --fill; then \
		URL=$$(gh pr list --json url | jq -r '.[0].url'); \
		open "$$URL"; \
		git switch master; \
	else \
		echo "Couldn't create PR, aborting"; \
		exit 1; \
	fi

.PHONY: create-app
create-app:
	@if [ -z "$$REPO_NAME" ]; then \
		read -r -p "Enter repository name: " REPO_NAME; \
	else \
		REPO_NAME="$$REPO_NAME"; \
	fi; \
	if [ -f "Formula/$$REPO_NAME.rb" ]; then \
		echo "Formula/$$REPO_NAME.rb already exists, aborting"; \
		exit 1; \
	fi; \
	VERSION=$$(curl -s "https://api.github.com/repos/chenasraf/$$REPO_NAME/releases/latest" | jq -r .tag_name); \
	URL="https://github.com/chenasraf/$$REPO_NAME/archive/refs/tags/$$VERSION.tar.gz"; \
	HOMEBREW_EDITOR=cat brew create --tap chenasraf/tap --set-name "$$REPO_NAME" "$$URL"; \
	echo "Created Formula/$$REPO_NAME.rb"; \
	echo "Version: $$VERSION"; \
	echo "URL: $$URL"
