#!/bin/bash

echo "***Multi-line substitutions across multiple files***"
echo "[Leading and Trailing white spaces are ignored]"
echo "Note: when passing arguments always separate lines with \n"
echo ""
echo ""


USAGE="Usage: $0 <multiline-sed script> <input folder> <output folder> <file with list of file names (only fine names without the full path) of interest from the input folder> <replace this (regex)> <with this>"

EXAMPLE='Sample replacement string: if\s(theCookie.getName().equals("vector"))\s{\nparam\s=\sjava.net.URLDecoder.decode(theCookie.getValue(),\s"UTF-8");\nbreak;\n}'

if [[ "$#" -lt 6 ]]; then
   echo $USAGE
   echo ""
   echo $EXAMPLE
   exit 2
fi

for tname in $(cat $4); do
  fpath=$2/$tname
  #remove leading white spaces
  echo "Removing all leading and trailing white spaces."
  cat $fpath | sed -r 's/^[ \t]*//;s/[ \t]*$//' > $tname.out
  sed -r 's/\s+/ /g' $tname.out
  echo "...done."
  
  echo ""
  
  #$fpath without leading/trailing white spaces is now stored in $tname.out
  echo "Substituting $5 with $6..."
  ./$1 $tname.out "s/$5/$6/g" $3/$tname
  echo "...done."
  echo "new version stored in $3/$tname"
  rm $tname.out
  #$tname.out removed
done

echo "Complete."
