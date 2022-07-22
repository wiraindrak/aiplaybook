jupyter-nbconvert --to html notebooks/Index.ipynb --reveal-prefix=reveal.js
mv notebooks/Index.html  index.html

# cd notebooks
# arr="*.ipynb"
# cd ..
# for f in "${arr[@]}"; do
#    # Chop off the extension
#    filename=$(basename "$f")
#    extension="${filename##*.}"
#    filename="${filename%.*}"

#    # Convert the Notebook to HTML
#    jupyter-nbconvert --to html notebooks/"$filename".ipynb --reveal-prefix=reveal.js
#    # Move to the Html directory
#    mv notebooks/"$filename".html  html/"$filename".html

#    # Convert the Notebook to slides
#    jupyter-nbconvert --to slides notebooks/"$filename".ipynb --reveal-prefix=reveal.js
#    # Move to the Slides directory
#    mv notebooks/"$filename".slides.html  slides/"$filename".html

#    # Convert the Notebook to Markdown
#    jupyter-nbconvert --to markdown notebooks/"$filename".ipynb
#    # Move to the Markdown directory
#    mv notebooks/"$filename".md  markdown/"$filename".md

#    # Convert the Notebook to Pdf
#    cp Notebooks/"$filename".ipynb src/"$filename".ipynb
#    cd src
#    jupyter-nbconvert --to pdf "$filename".ipynb

#    # Move to the html directory
#    mv "$filename".pdf  ../pdfs/"$filename".pdf
#    rm "$filename".ipynb
#    cd ..
# done

# Push the updates to gh-pages
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update Slides"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "Update Slides"
git push origin main gh-pages
git checkout main
rm -rf /tmp/workspace