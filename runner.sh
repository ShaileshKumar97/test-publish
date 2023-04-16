#!/bin/bash
PREV_TAG="$(git tag --sort=-creatordate | sed -n '2 p')"
CURRENT_TAG="$(git tag --sort=-creatordate | sed -n '1 p')"

# Generate changelogs

echo "[${CURRENT_TAG#v}]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/compare/${PREV_TAG}...${CURRENT_TAG})" "($(date +%F))" > temp_changelog.md
echo "---" >> temp_changelog.md
echo "### Bug Fixes" >> temp_changelog.md
echo $GITHUB_SERVER_URL/$GITHUB_REPOSITORY
git log ${PREV_TAG}..HEAD --grep="^fix" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep fix >> temp_changelog.md
echo "" >> temp_changelog.md
echo "### Features" >> temp_changelog.md
git log ${PREV_TAG}..HEAD --grep="^chore" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep chore >> temp_changelog.md
echo "" >> temp_changelog.md
echo "### Merged Pull Requests" >> temp_changelog.md
git log ${PREV_TAG}..HEAD --grep="^Merge pull request" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep "Merge pull request" >> temp_changelog.md
echo >> temp_changelog.md

# Add generated changelogs to existing changelog file at the top
if [ -f "CHANGELOG.md" ]; then
  cat CHANGELOG.md >> temp_changelog.md
fi

mv temp_changelog.md CHANGELOG.md
