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
#  convert -density 150 ${GAMENAME}-Map-B2.pdf -quality 90 ${GAMENAME}-Map.png
#  convert -density 150 ${GAMENAME}-Market-tabloid.pdf -quality 90 ${GAMENAME}-Market.png
#fi

lyx --export pdf2 ./${GAMENAME}-Rules.lyx
mv ./${GAMENAME}-Rules.pdf build

cp ${GAMENAME}-Papers.xxp build/
cp LICENSE build/

for paper in letter A4
do
  xxpaper make ${GAMENAME}-Papers -p ${paper} build/${GAMENAME}-Papers-${paper}-diecut.pdf
  xxpaper make ${GAMENAME}-Papers -p ${paper} -c build/${GAMENAME}-Papers-${paper}-outline.pdf
done
for suffix in Map-A4 Map-B2 Map-letter Map-tabloid Market-A4 Market-letter \
              Market-tabloid TrackTiles-letter-diecut TrackTiles-letter-outline
do
  cp ${GAMENAME}-${suffix}.pdf build
done  
