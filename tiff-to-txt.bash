#!/bin/bash

# Reference
# https://diging.atlassian.net/wiki/spaces/DCH/pages/5275668/Tutorial+Text+Extraction+and+OCR+with+Tesseract+and+ImageMagick

# TIFF File
tiff_file=$1
language=$2

if [ -z $language ]; then
    language=rus
fi

echo ======================
echo Converting TIFF to TXT
echo ======================

tesseract $tiff_file -l $language ocr_output