#!/bin/sh

echo "INFO: Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "INFO: Checking out gh-pages branch into public"
git worktree add -B gh-pages public origin/gh-pages

echo "INFO: Building site"
hugo

echo "INFO: Pushing updates to GitHub"
cd public
git add .
git commit -m "Publishing to gh-pages (publish_date: $(date))"
git push origin gh-pages

echo "INFO: Deployment complete!"
cd ..
