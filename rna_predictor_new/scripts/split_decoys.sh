#!/bin/bash

# script to split decoy files
source ~/.bashrc	
rnas="1KKA  1PJY  1Z2J  2L3E  2LI4  2LUB  2M24  2MHI  2N6S  2NBZ  4A4S 1L1W  1R7W  1ZC5  2LBJ  2LK3  2LUN  2M4W  2MNC  2N6T  2NC0  4A4T 1LC6  1SCL  2FDT  2LBL  2LP9  2LV0  2M5U  2MXL  2N6W  2NCI  4A4U 1LDZ  1UUU  2JWV  2LDL  2LPA  2M12  2M8K  2N2O  2N6X  2QH2  5A17 1NC0  1XHP  2K66  2LDT  2LQZ  2M21  2MEQ  2N2P  2N7X  2QH4  5A18 1OW9  1YSV  2KOC  2LHP  2LU0  2M22  2MFD  2N4L  2NBY  2Y95  5KQE"

# loop over rnas and get data
for rna in ${rnas}
do	
	inputname=decoy_files/${rna}_nlb_decoys
  mkdir decoy_files/${rna}
  
	# Count number of models using catdcd
	models=`catdcd -pdb ${inputname}.pdb | tail -2 | head -1 | awk '{print $3}'`	
	echo "${rna} contains ${models} models"	
	
	# Create sequence of model numbers
	models=`seq 1 ${models}`	
	# Loop over models and write out individual PDBs
	for i in $models
	do
		model=$((i+offset))
		catdcd -o decoy_files/${rna}/decoy_${model}.pdb -otype pdb -s ${inputname}.pdb -stype pdb -first ${i} -last ${i} -pdb ${inputname}.pdb #> /dev/null
	done
done	
fi
