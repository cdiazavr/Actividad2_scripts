#!/bin/bash

# Author:            Carlos Diaz
# Date Created:      November 12, 2022
# Last Modified:     November 12, 2022


            ###############
            # DESCRIPTION #
            ###############
# Takes one ore several FASTA file that contain a single DNA sequence and 
# transforms it into a RNA sequence (simple substitution of T by U)
#
	
            #########
            # USAGE #
            #########
# The user should pass one or several FASTA files, each one containing one
# DNA sequence.
#
#  EXAMPLE SYNTAX:  $./DNAtoRNA.sh /path/to/my/file.FASTA
#

            ###################
            # MISC. VARIABLES #
            ###################
# Colors for formated output:
color='\033[1;32m'
noColor='\033[0m'

            ###################
            # EXECUTABLE CODE #
            ###################
# Iterate over each file passed as argument:
for file in "$@"
do
	echo "" # Empty line just for aesthetic
	
	# Get only the sequence line from the file:
	DNAseq=$(sed -n '2p' $file )

	# Set/reset an empty variable to store the transcribed sequences:
	RNAseq=''
	# Transcribe the $DNAseq by replacing all the T by U:
	RNAseq=$(echo $DNAseq | sed 's/T/U/g')
	## TODO: deal with upper and lowercases.

	# Count each nucleotide in $RNAseq:
	## Approach is: delete whatever nucleotide that it is not the one being
	## counted with sed, and then just count the surviving ones (matchs) with
	## awk.
	numA=$(echo $RNAseq | sed 's/[^A]//g' | awk '{print length}')
	numG=$(echo $RNAseq | sed 's/[^G]//g' | awk '{print length}')
	numC=$(echo $RNAseq | sed 's/[^C]//g' | awk '{print length}')
	numU=$(echo $RNAseq | sed 's/[^U]//g' | awk '{print length}')

	# Show results:
	echo -e "${color}===> $(basename $file) <=== ${noColor}"
	echo "Nucleotides counts (as RNA):  "
	echo "       A: $numA"
	echo "       G: $numG"
	echo "       C: $numC"
	echo "       U: $numU"
	
done

exit 0
