#!/bin/bash

# Author:			Carlos Diaz
# Date Created:		November 12, 2022
# Last Modified:	November 12, 2022


					###############
					# DESCRIPTION #
					###############
# Takes a FASTA file and determines if it is a sequence of nucleotides or amino
# acids.
#
	
					#########
					# USAGE #
					#########
# The user should pass a single argument, corresponding to the
# absolute or relative path where the FASTA file is.
#
#  EXAMPLE SYNTAX:  $./typeofSequence.sh /path/to/my/file.FASTA
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

# Get sequence line:
sequence=$(sed -n '2p' $1)

# Check if $sequence contains any character other than [ATCGUNatcgun] 
if [[ $sequence =~ [^ATCGUNatcgun] ]]
then	# If so, then it must be a sequence of amino acids
	echo ""
	echo "       ⌬  It is a sequence of amino acids ⌬"
else	# Otherwise, it must be a sequence of nucleotides
	echo ""
	echo "        🧬 It is a sequence of nucleotides 🧬"
fi

exit 0
