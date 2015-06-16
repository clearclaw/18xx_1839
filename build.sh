#! /bin/bash
set -e

lyx --export pdf2 ./1839-Rules.lyx
mkdir -p build
pushd build
  mv ../1839-Rules.pdf ./
  xxpaper ../1839-Papers.xxp $*
  cp ../1839-Papers.xxp ./
  for file in *.ps
  do
    ps2pdf $file
  done
  rm *.ps
popd
