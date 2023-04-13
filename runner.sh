#!/bin/bash
PREV_TAG="$(git tag --sort=-creatordate | sed -n '2 p')"
echo "Bug Fixes:" > changelog.md
git log ${PREV_TAG}..HEAD --grep="^fix" --pretty=format:"%C(auto)- %s %h" | grep fix >> changelog.md
echo "\\" >> changelog.md
echo "Features:" >> changelog.md
git log ${PREV_TAG}..HEAD --grep="^chore" --pretty=format:"%C(auto)- %s %h" | grep chore >> changelog.md
echo "\\" >> changelog.md
echo "Merged Pull Requests:" >> changelog.md
git log ${PREV_TAG}..HEAD --grep="^Merge pull request" --pretty=format:"%C(auto)- %s %h" | grep Merge pull request >> changelog.md
