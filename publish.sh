#!/bin/bash

jupyter-nbconvert --to html --template classic notebooks/index.ipynb
mv notebooks/index.html  index.html

arr=$(find notebooks -iname "*.ipynb" -exec basename {} .ipynb ';')
for nb in $arr; do
    jupyter-nbconvert --to html --template classic notebooks/"$nb".ipynb
    mv notebooks/"$nb".html pages/"$nb".html
done

# Push the updates to gh-pages
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "update pages"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "update pages"
git push -f origin main gh-pages
git checkout main
rm -rf /tmp/workspace
