#!/bin/bash

# Check for bibtex and pdflatex
command -v bibtex >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Could not find bibtex";
    exit 1;
fi

command -v pdflatex >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Could not find pdflatex";
    exit 2;
fi

# Okay, we have those. Let's generate the PDF!

cd LaTeX/

echo "Pass 1/4..."
pdflatex isolette-assign.tex >/dev/null 2>&1

echo "Pass 2/4..."
bibtex isolette-assign >/dev/null 2>&1

echo "Pass 3/4..."
pdflatex isolette-assign.tex >/dev/null 2>&1

echo "Pass 4/4..."
pdflatex isolette-assign.tex >/dev/null 2>&1

echo "Done!"
