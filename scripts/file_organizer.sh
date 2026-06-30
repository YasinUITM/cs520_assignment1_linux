#!/bin/bash

cd ~/linux_assignment/

mkdir -p Images Documents Others

doc_count=0
other_count=0

shopt -s nullglob

for file in documents/*.txt documents/*.md documents/*.pdf; do
    mv "$file" Documents/
    ((doc_count++))
done

for file in documents/*.csv documents/*.conf; do
    mv "$file" Others/
    ((other_count++))
done

echo "=== Ringkasan Pemindahan Fail ===" 
echo "File move to folder Documents/: $doc_count" 
echo "File move to folder Others/: $other_count" 
echo "Total file moved: $((doc_count + other_count))" 
