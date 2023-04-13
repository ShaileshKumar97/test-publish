#!/bin/bash
# PREV_TAG="$(git tag --sort=-creatordate | sed -n '2 p')"
PREV_TAG="v1.2"
echo "Hello world!"
echo "Bug Fixes:" > changelog.md
git log ${PREV_TAG}..${GITHUB_REF} --grep="^fix" --pretty=format:"%C(auto)- %s %h" >> changelog.md
echo "" >> changelog.md
echo "Features:" >> changelog.md
git log ${PREV_TAG}..${GITHUB_REF} --grep="^chore" --pretty=format:"%C(auto)- %s %h" >> changelog.md
echo "" >> changelog.md
echo "Merged Pull Requests:" >> changelog.md
git log ${PREV_TAG}..${GITHUB_REF} --grep="^Merge pull request" --pretty=format:"%C(auto)- %s %h" >> changelog.md
