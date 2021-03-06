#!/bin/bash

export WD=`pwd`
git clone https://github.com/cyriltasse/SkyModel.git
git clone https://github.com/saopicc/killMS.git
git clone https://github.com/cyriltasse/DynSpecMS.git
cd killMS
git checkout lofar-stable
cd Predict
make
cd ../Array/Dot
make
cd ../../Gridder
make
cd $WD
git clone https://github.com/cyriltasse/DDFacet.git
# fix compile options
cp ddf-pipeline/misc/setup.cfg DDFacet
cd DDFacet
git checkout master
python setup.py build
cd $WD
sed -e "s|INSTALLDIR|$WD|" ddf-pipeline/misc/DDF.sh > init.sh
