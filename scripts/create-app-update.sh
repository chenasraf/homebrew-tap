#!/usr/bin/env bash

if [[ -z "$REPO_NAME" ]]; then
  read -r -p "Enter repository name: " REPO_NAME
fi

VERSION=$(curl -s "https://api.github.com/repos/chenasraf/$REPO_NAME/releases/latest" | jq -r .tag_name)

echo "Version: $VERSION"

git switch -c "feature/$REPO_NAME"
git add "Formula/$REPO_NAME.rb"
git commit -m "feat: update $REPO_NAME to $VERSION"
git push

if gh pr create --fill; then
  echo open "$(gh pr list --json url | jq -r '.[0].url')"
else
  echo "Couldn't create PR, aborting"
fi
