#! /bin/bash

set -e

./build.sh
pushd build
  scp * claw@kanga.nu:~/public_html/1839
popd
