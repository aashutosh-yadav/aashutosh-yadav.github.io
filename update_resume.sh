#!/bin/bash

echo "Updating resume..."

# copy new file
cp ~/Downloads/*.pdf resume.pdf

# commit and push
git add resume.pdf
git commit -m "update resume"
git push

echo "Website updated!"
