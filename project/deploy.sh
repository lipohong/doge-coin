#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd ../

git init
git add -A
git commit -m 'Update and deploy'

git push -f git@github.com:lipohong/doge-coin.git master:gh-pages
git push -f git@github.com:lipohong/doge-coin.git master

cd -