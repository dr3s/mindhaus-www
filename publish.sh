#!/bin/bash
# publish.sh
# Build everything and deploy this app to Heroku

set -e

# Change to the project root directory

cd "$(dirname ${BASH_SOURCE[0]})"

rake generate

# Temporarily add the generated files to version control
# (-f says "even though this file is in .gitignore")

git add -f public

# Push them to Heroku, then repent of the commit

git commit -m 'Temporary Heroku-only deployment commit'
git push prod master --force
git reset --soft HEAD~1

# Un-stage the generated files to finish
git rm -frq public
#  git clean -fd