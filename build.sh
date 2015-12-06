#! /bin/bash
set -e

lyx --export pdf2 ./1839-Rules.lyx
mkdir -p build
pushd build
  mv ../1839-Rules.pdf ./
  xxpaper ../1839-Papers.xxp $*
  rm market_sheet1-nooutline*
  cp ../1839-Papers.xxp ./
  cp ../README.txt ./
  cp ../M39.pdf ./1839-Map.pdf
  for file in *.ps
  do
    ps2pdf $file
  done
  rm *.ps
popd
