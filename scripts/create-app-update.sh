#!/usr/bin/env bash

if [[ -z "$REPO_NAME" ]]; then
  read -r -p "Enter repository name: " REPO_NAME
fi

if [[ -z "$REPO_NAME" ]]; then
  echo "Repository name is required"
  exit 1
fi

VERSION=$(curl -s "https://api.github.com/repos/chenasraf/$REPO_NAME/releases/latest" | jq -r .tag_name)

echo "Version: $VERSION"
BRANCH="feature/$REPO_NAME-$VERSION"

if ! git switch -C "$BRANCH"; then
  echo "Branch already exists, aborting"
  exit 1
fi
git add "Formula/$REPO_NAME.rb"
git commit -m "feat: update $REPO_NAME to $VERSION"
git push --set-upstream origin "$BRANCH"

if gh pr create --fill; then
  open -u "$(gh pr list --json url | jq -r '.[0].url')"
  git switch master
else
  echo "Couldn't create PR, aborting"
  exit 1
fi
