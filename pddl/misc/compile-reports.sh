#!/bin/sh

#Compile every .tex document in folder
for f in *.tex; do pdflatex.exe -synctex=1 -interaction=nonstopmode $f; done;

#Remove extra files
rm *.bak *.log *.aux *.out *.gz
