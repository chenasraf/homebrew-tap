#!/usr/bin/env bash

if [[ -z "$REPO_NAME" ]]; then
  read -r -p "Enter repository name: " REPO_NAME
fi

VERSION=$(curl -s "https://api.github.com/repos/chenasraf/$REPO_NAME/releases/latest" | jq -r .tag_name)

echo "Version: $VERSION"

if ! git switch -C "feature/$REPO_NAME-$VERSION"; then
  echo "Branch already exists, aborting"
fi
git add "Formula/$REPO_NAME.rb"
git commit -m "feat: update $REPO_NAME to $VERSION"
git push origin

if gh pr create --fill; then
  echo open -u "$(gh pr list --json url | jq -r '.[0].url')"
else
  echo "Couldn't create PR, aborting"
fi
