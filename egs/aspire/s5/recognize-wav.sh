#!/usr/bin/env bash


. ./path.sh


# Set the paths to the binaries and scripts needed
KALDI_ROOT=`pwd`/../../..
export PATH=$PWD/../s5/utils/:$KALDI_ROOT/src/online2bin:$KALDI_ROOT/src/onlinebin:$KALDI_ROOT/src/bin:$PATH



online2-wav-nnet3-latgen-faster --online=true --do-endpointing=false --frame-subsampling-factor=3 --config=exp/tdnn_7b_chain_online/conf/online.conf --max-active=7000 --beam=15.0 --lattice-beam=6.0 --acoustic-scale=1.0 --word-symbol-table=exp/tdnn_7b_chain_online/graph_pp/words.txt exp/tdnn_7b_chain_online/final.mdl exp/tdnn_7b_chain_online/graph_pp/HCLG.fst 'ark:echo utter1 utter1|' 'scp:echo utter1 test1-8k.wav|' ark:/dev/null

