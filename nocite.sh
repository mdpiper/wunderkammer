#! /usr/bin/env bash
# Creates a TeX file with a list of \nocite references.
# See https://tex.stackexchange.com/a/170415 for original idea.

bibfiles=" \
  csdms_20_references.bib \
  csdms_20_references_hutton.bib \
  csdms_20_abstracts_hutton.bib \
  csdms_ak.bib"

citefile=sections/nocite.tex
if [ -f $citefile ]; then
    rm $citefile;
fi

echo "%% CSDMS2 references included in bibliography but not cited." >> $citefile
echo "\nociterfp{" >> $citefile
for bib in $bibfiles; do
    grep @ $bib | grep -v '@string' | grep -v '\\\@' | sed 's/@.*{/  /g' >> $citefile
done
echo "}" >> $citefile
