#! /bin/bash
set -e

ARG="${1}"
GAMENAME=1839

dir_root=`pwd`

mkdir -p build
rm -f build/* || true

#if [[ ! -f "1828-Market.png" || ! -f "1828-Map.png" ]]
#then
#  echo "Making rules images"
#  \rm -f 1828-Map.png 1828-Market.png
#  convert -density 150 1828-Map-B2.pdf -quality 90 1828-Map.png
#  convert -density 150 1828-Market-tabloid.pdf -quality 90 1828-Market.png
#fi

lyx --export pdf2 ./${GAMENAME}-Rules.lyx
mv ./${GAMENAME}-Rules.pdf build

cp ${GAMENAME}-Papers.xxp build/
cp LICENSE build/

for paper in letter A4
do
  xxpaper make ${GAMENAME}-Papers -p ${paper} build/${GAMENAME}-Papers-${paper}-diecut.pdf
  xxpaper make ${GAMENAME}-Papers -p ${paper} -c build/${GAMENAME}-Papers-${paper}-outline.pdf
  pdfunite masthead-${paper}.pdf box-sides-${paper}.pdf build/${GAMENAME}-BoxCovers-${paper}.pdf
done
for suffix in Map-A3 Map-A4 Map-B2 Map-letter Map-tabloid Market-A3 Market-A4 Market-letter \
              Market-tabloid TrackTiles-letter-diecut TrackTiles-letter-outline
do
  cp ${GAMENAME}-${suffix}.pdf build
done  
