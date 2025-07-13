#!/bin/bash

incPath="../inc"   # Change this to your target directory

filelist=()
for file in "$incPath"/*; do
  if [[ -f "$file" ]]; then
    filename="${file##*/}"
    filename="${filename%.*}"
    filelist+=("$filename")
  fi
done

for file in ${filelist[@]}; do
  filename="$file.test.cpp" 
  touch $filename
  echo "#include \"$file.h\""> $filename
  echo "#include <gtest>">> $filename
done

