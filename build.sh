#! /bin/bash
set -e

lyx --export pdf2 ./1839-Rules.lyx
mkdir -p build
pushd build
  mv ../1839-Rules.pdf ./
  xxpaper ../1839-Papers.xxp $*
  \rm market_*-nooutline* || true
  cp ../1839-Papers.xxp ./
  cp ../README.txt ./
  cp ../M39.pdf ./1839-Map.pdf
  cp ../P39.pdf ./1839-Tiles.pdf
  for file in *.ps
  do
    ps2pdf $file
  done
  rm *.ps
popd
