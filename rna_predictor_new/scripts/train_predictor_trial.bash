#!/bin/bash
if [[ $# -ne 2 ]]
then
	echo "Script to calculate chemical shifts"
	echo "usage $0: <rna> <nucleus>"
else
	source ~/.bashrc	
	
  rna=$1
  nucleus=$2
  
  # script to train chemical shift predictor for a given nucleus
  awk -v nucleus=${nucleus} '{if($1==nucleus) print}' data/initial_parameters.txt > data/initial_parameters_tmp.txt
  cat ${rna}/train_features_min_15.0A.txt | awk -v nucleus=${nucleus} '{ if($5==nucleus) print}' > data/train_tmp.txt   
  ./scripts/train.R --verbose --ga_populations=68 --ga_cycles=1000 --output_parameters=data/ga_model_${nucleus}.txt data/train_tmp.txt
fi