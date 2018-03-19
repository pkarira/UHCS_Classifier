#!/bin/bash
for file in `ls -v *.tif`
do
   convert +repage -crop 224X224 "$file" cropped_%d.tif
   rm -f cropped_1.tif
   rm -f cropped_2.tif
   rm -f cropped_3.tif
   rm -f cropped_3.tif
   rm -f $file		
   mv "cropped_0.tif" "$file"
done

