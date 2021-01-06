#!/bin/bash

echo "Git Push process"
echo "###=> " "$1"
echo "\n"
git config --global user.email "hanseung0609@gmail.com"
git config --global user.name "viassh"
git add .
git commit -m "$1"
git push -u origin main
