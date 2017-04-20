#!/bin/bash

LATEX=pdflatex
LATEXOPTS1="-draftmode -interaction=batchmode -output-directory=tmp"
LATEXOPTS2="-interaction=batchmode -output-directory=tmp"

for tex in `ls tex_compile`
do
  echo -n "compiling $tex ... "
  $LATEX $LATEXOPTS1 tex_compile/$tex 2>&1 > /dev/null && \
  $LATEX $LATEXOPTS2 tex_compile/$tex 2>&1 > /dev/null && \
  echo "done" || echo "fail"
done

echo -en "\nmoving pdf to pdfoutput ... "
mv tmp/*.pdf pdfoutput 2> /dev/null && \
echo "done" || echo "fail: no PDFs found"

if [[ "$1" == "clean" ]]; then
  echo 
  rm -f tmp/* && echo "cleaned up tmp" && exit 0
fi

exit 0
