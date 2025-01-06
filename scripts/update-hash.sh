#!/usr/bin/env bash

if [[ -z "$REPO_NAME" ]]; then
  read -r -p "Enter repository name: " REPO_NAME
fi

VERSION=$(curl -s "https://api.github.com/repos/chenasraf/$REPO_NAME/releases/latest" | jq -r .tag_name)
URL="https://github.com/chenasraf/$REPO_NAME/archive/refs/tags/$VERSION.tar.gz"

echo "Version: $VERSION"
echo "URL: $URL"

curl -Ls "$URL" -o "$REPO_NAME-$VERSION.tar.gz"
echo -n "SHA256: "
hash=$(sha256sum "$REPO_NAME-$VERSION.tar.gz" | awk '{print $1}')
echo "$hash"
rm "$REPO_NAME-$VERSION.tar.gz"

sed -i.bak "s/sha256 \".*\"/sha256 \"$hash\"/" "Formula/$REPO_NAME.rb"
rm "Formula/$REPO_NAME.rb.bak"

sed -i.bak "s|\\burl \".*\"|url \"$URL\"|" "Formula/$REPO_NAME.rb"
rm "Formula/$REPO_NAME.rb.bak"
