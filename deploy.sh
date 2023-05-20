#!/bin/bash

# Build the Nuxt app
npm run build

# Create a temporary directory for deployment
tmpDir=$(mktemp -d)
cp -R dist/* "$tmpDir"

# Initialize a new Git repository in the temporary directory
cd "$tmpDir"
git init

# Configure Git to allow pushing to the "deploy" branch
git checkout -b deploy
git remote add origin git@github.com:mahmoud-alawad/my-site.git

# Commit and push the built app to the "deploy" branch
git add .
git commit -m "Deploy nuxt to github-pages.."
git push origin deploy --force

# Clean up the temporary directory
rm -rf "$tmpDir"

echo "Deployment complete!"
