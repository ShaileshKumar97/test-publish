#!/bin/bash
PREV_TAG="$(git tag --sort=-creatordate | sed -n '2 p')"
echo "### Bug Fixes" > CHANGELOG.md
echo $GITHUB_SERVER_URL/$GITHUB_REPOSITORY
git log ${PREV_TAG}..HEAD --grep="^fix" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep fix >> CHANGELOG.md
echo "" >> CHANGELOG.md
echo "### Features" >> changelog.md
git log ${PREV_TAG}..HEAD --grep="^chore" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep chore >> CHANGELOG.md
echo "" >> CHANGELOG.md
echo "### Merged Pull Requests" >> changelog.md
git log ${PREV_TAG}..HEAD --grep="^Merge pull request" --pretty=format:"%C(auto)- %s ([%h]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/commit/%H))" | grep "Merge pull request" >> CHANGELOG.md