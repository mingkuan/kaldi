#!/usr/bin/env bash

## Retrieving Kaldi source code
sudo apt-get install -y git sox libsox-fmt-mp3  swig python-setuptools python-dev python-pip zlib1g-dev gawk automake autoconf libtool libatlas3-base subversion build-essential flac


git clone https://github.com/mingkuan/kaldi.git
cd kaldi
export KALDI_GIT_ROOT=`pwd`
echo $KALDI_GIT_ROOT

## Compile Kaldi tools
cd $KALDI_GIT_ROOT/tools
make -j 24

## install some necessary tools
extras/install_irstlm.sh
sudo ./install_srilm.sh
# required by install_sequitur.sh
sudo pip install numpy
sudo ./extras/install_sequitur.sh


## Compile Kaldi
cd $KALDI_GIT_ROOT/src
./configure
make depend -j 24
make -j 24
make ext -j 24

# For qsub
#sudo apt-get remove torque-server torque-client torque-mom torque-pam
#sudo apt-get install gridengine-master gridengine-client gridengine-exec


## Common Voice
# Start Kaldi training on Common Voice
cd $KALDI_GIT_ROOT/egs/commonvoice/s5
source $KALDI_GIT_ROOT/tools/env.sh
./run.sh
