#! /bin/bash
set -e

ARG="${1}"
GAMENAME=1839

dir_root=`pwd`

mkdir -p build
rm -f build/* || true

#if [[ ! -f "${GAMENAME}-Market.png" || ! -f "${GAMENAME}-Map.png" ]]
#then
#  echo "Making rules images"
#  \rm -f ${GAMENAME}-Map.png ${GAMENAME}-Market.png
#  convert -density 150 ${GAMENAME}-Map.pdf -quality 90 ${GAMENAME}-Map.png
#  convert -density 150 ${GAMENAME}-Market.pdf -quality 90 ${GAMENAME}-Market.png
#fi

lyx --export pdf2 ./${GAMENAME}-Rules.lyx
mv ./${GAMENAME}-Rules.pdf build

cp ${GAMENAME}-Papers.xxp build/
cp LICENSE README.txt build/

for paper in letter A4
do
  xxpaper make assets ${GAMENAME}-Papers -p ${paper} build/${GAMENAME}-Papers-${paper}-diecut.pdf
  xxpaper make assets ${GAMENAME}-Papers -p ${paper} -c build/${GAMENAME}-Papers-${paper}-outline.pdf
  # pdfunite masthead-${paper}.pdf box-sides-${paper}.pdf build/${GAMENAME}-BoxCovers-${paper}.pdf
done
for suffix in Map-B2 Map-A4 Market-A4 Map-letter Market-letter Map-tabloid Market-tabloid \
              TrackTiles-letter-diecut TrackTiles-letter-outline Map Market \
              TileRoster-letter TileRoster-A4
do
  cp ${GAMENAME}-${suffix}.pdf build
done  
