#!/bin/bash

jupyter-nbconvert --to html --template classic notebooks/index.ipynb
mv notebooks/index.html  index.html

# cd notebooks
# arr=(*.ipynb)
# cd ..
# for f in "${arr[@]}"; do
#    # Chop off the extension
#    filename=$(basename "$f")
#    extension="${filename##*.}"
#    filename="${filename%.*}"

#    # Convert the Notebook to HTML
#    jupyter-nbconvert --to html notebooks/"$filename".ipynb --reveal-prefix=reveal.js
#    # Move to the Html directory
#    mv notebooks/"$filename".html  pages/"$filename".html

# done
arr=$(find . -iname "*.ipynb" -exec basename {} .ipynb ';')
for nb in $arr; do
    # extension="${nb##*.}"
    # nb=$(basename "$nb")
    # filename="${nb%.*}"
    # Convert the Notebook to HTML
    jupyter-nbconvert --to html notebooks/"$nb".ipynb
    # Move to the Html directory
    mv notebooks/"$nb".html  pages/"$nb".html
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