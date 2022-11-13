#!/bin/bash

# Author:            Carlos Diaz
# Date Created:      November 12, 2022
# Last Modified:     November 12, 2022


            ###############
            # DESCRIPTION #
            ###############
# Takes a FASTQ file and reports the number of reads contained
#
	
            #########
            # USAGE #
            #########
# The user should pass a single argument, corresponding to the
# absolute or relative path where the FASTQ file is.
#
#  EXAMPLE SYNTAX:  $./countSeqFASTQ.sh /path/to/my/file.FASTQ
#


            ###################
            # EXECUTABLE CODE #
            ###################
# Check if user passed exactly one argument:
numArgs=$#
if [[ numArgs -ne 1  ]]
then
	# Throw error message to stderr and exit with status 1:
	echo "ERROR: a single file name required, but $numArgs were passed." >&2
	exit 1
fi

# First, count total lines in the file:
len=$(wc -l $1 | cut -d' ' -f1)

# Validate that the number of sequences is a multiple of 4:
if [ $(expr $len % 4) -ne 0 ]
then
	# Thrown error message to stderr and exit with status 1:
	echo "ERROR: The number of lines in the file is not multiple of 4. Check file." >&2
	exit 1
fi

# Count and report the number of sequences:
echo $(expr $len / 4) # report just the plain number to make easier to use it further.

exit 0
