#!/bin/bash


# Create and move to backup directory
cd ~/workspace/russia/regional_inequality
curl -o input.md http://muistio.tieke.fi/p/russia-regional-inequality/export/txt

#pandoc -s -S --number-section --toc --from=markdown+yaml_metadata_block -H /home/aurelius/web/css/rmarkdown.css input.md -o article_demokr.html
# pdf
pandoc --number-section --latex-engine=xelatex -V lang=english -V papersize:a4paper -V documentclass=scrartcl input.md -o regional_inequality.pdf
# word
pandoc --toc --number-section input.md -o regional_inequality.docx
pandoc -s -S -H /home/aurelius/web/css/rmarkdown.css index.md -o index.html

git commit -am "article updated"
git push
