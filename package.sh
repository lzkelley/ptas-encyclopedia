#!/bin/bash

OUT_DIR="ptas-encyclopedia"
INP_DIR="./manuscript"

# Ensure the target directory does not exist; otherwise, exit with an error
if [ -e "$OUT_DIR" ]; then
    echo "Error: output directory '$OUT_DIR' already exists."
    exit 1
fi

# Define an array of files
# files=("Harvard.bst" "booksetup.sty" "commands.tex" "els-mrw.cls" "figs" "journals.tex" "ptas-encyclopedia.tex" "refs.bib")
files=("booksetup.sty" "commands.tex" "els-mrw.cls" "figs" "journals.tex" "ptas-encyclopedia.tex" "refs.bib")

echo "Making output directory..."
mkdir ${OUT_DIR}

echo "Copying files..."
# Copy each file to the target directory
for file in "${files[@]}"; do
    cp -r "${INP_DIR}/$file" "${OUT_DIR}"
done

echo "Creating tarball..."
tar -cvzf  "${OUT_DIR}.tar.gz" ${OUT_DIR}

echo "Cleaning up..."
rm -r ${OUT_DIR}

echo "Done"