#!/bin/bash
pushd `dirname ${BASH_SOURCE[0]}` > /dev/null; HERE=`pwd`; popd > /dev/null
cd $HERE

./clean.sh
zip farm.love -r *
mkdir build
mv farm.love build

