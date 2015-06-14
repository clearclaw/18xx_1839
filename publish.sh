#! /bin/bash

set -e

./build.sh
scp 1839-Papers.xxp claw@kanga.nu:~/public_html/1839
pushd build
  scp * claw@kanga.nu:~/public_html/1839
popd
