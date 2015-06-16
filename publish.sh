#! /bin/bash

set -e

./build.sh
pushd build
  rsync -ra * claw@kanga.nu:~/public_html/1839/
popd
