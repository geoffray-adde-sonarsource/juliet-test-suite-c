#!/bin/bash

outfile=./compile_commands.json
outfile2=./compile_commands.json.tmp 
rm -f $outfile
rm -f $outfile2

for compdb_dir in `ls -d testcases/*`; do
  cdb="$compdb_dir/compile_commands.json"
  cat $cdb | sed 's/\[/,/g' | sed 's/\]//g' >> $outfile  
done
echo '[' >> $outfile2
tail -n +2 $outfile >> $outfile2
echo ']' >> $outfile2
mv $outfile2 $outfile