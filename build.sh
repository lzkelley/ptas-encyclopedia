#!/bin/bash
# LaTeX build using PDFLaTeX and BiBTeX
# -------------------------------------
# pdflatex > bibtex > pdflatex > pdflatex
#

CWD=$(pwd)

MY_PATH="./manuscript"
FNAME="ptas-encyclopedia"
OUTDIR="out"

cd ${MY_PATH}

TEX_FILE=${FNAME}.tex
# OUTDIR=${OUT_DNAME}
mkdir -p ${OUTDIR}

pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=${OUTDIR} ${TEX_FILE}
bibtex ${OUTDIR}/${FNAME}.aux
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=${OUTDIR} ${TEX_FILE}
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=${OUTDIR} ${TEX_FILE}

cp ${OUTDIR}/${FNAME}.pdf .
cp ${OUTDIR}/${FNAME}.pdf ${CWD}

cd -