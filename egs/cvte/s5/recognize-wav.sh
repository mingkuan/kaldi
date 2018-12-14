#!/bin/bash


. ./cmd.sh
. ./path.sh


# Set the paths to the binaries and scripts needed
KALDI_ROOT=`pwd`/../../..
export PATH=$KALDI_ROOT/src/online2bin:$KALDI_ROOT/src/onlinebin:$KALDI_ROOT/src/bin:$PATH


#
#ln -s ~/ProtoType/kaldi/egs/wsj/s5/steps ~/ProtoType/kaldi/egs/cvte/s5/steps
#ln -s ~/ProtoType/kaldi/egs/wsj/s5/utils ~/ProtoType/kaldi/egs/cvte/s5/utils


#
#online2-wav-nnet3-latgen-faster --do-endpointing=false --online=false --feature-type=fbank --fbank-config=conf/fbank.conf --max-active=7000 --beam=15.0 --lattice-beam=6.0 --acoustic-scale=1.0 --word-symbol-table=exp/chain/tdnn/graph/words.txt exp/chain/tdnn/final.mdl exp/chain/tdnn/graph/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 data/wav/00030/2017_03_07_16.57.22_1175.wav|' ark:/dev/null
#

# less accurate
#online2-wav-nnet3-latgen-faster --do-endpointing=false --online=true --feature-type=fbank --fbank-config=conf/fbank.conf --max-active=7000 --beam=15.0 --lattice-beam=6.0 --acoustic-scale=1.0 --word-symbol-table=exp/chain/tdnn/graph/words.txt exp/chain/tdnn/final.mdl exp/chain/tdnn/graph/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 data/wav/00030/2017_03_07_16.58.30_5107.wav|' ark:/dev/null

online2-wav-nnet3-latgen-faster --do-endpointing=false --online=true --feature-type=fbank --fbank-config=conf/fbank.conf --max-active=7000 --beam=15.0 --lattice-beam=6.0 --acoustic-scale=1.0 --word-symbol-table=exp/chain/tdnn/graph/words.txt exp/chain/tdnn/final.mdl exp/chain/tdnn/graph/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 zh-buy-shoes.wav|' ark:/dev/null


#
## more accurate: TO DO, CHECK: https://www.zhihu.com/question/57230747
#online2-wav-nnet3-latgen-faster --do-endpointing=false --online=false --config=conf/online.conf --max-active=7000 --beam=15.0 --lattice-beam=6.0 --acoustic-scale=1.0 --word-symbol-table=exp/chain/tdnn/graph/words.txt exp/chain/tdnn/final.mdl exp/chain/tdnn/graph/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 data/wav/00030/2017_03_07_16.58.30_5107.wav|' ark:/dev/null
#
