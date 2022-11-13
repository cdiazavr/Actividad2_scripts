#!/bin/bash

# Author:            Carlos Diaz
# Date Created:      November 10, 2022
# Last Modified:     November 10, 2022


            ###############
            # DESCRIPTION #
            ###############
# Initializes a project by creating a series of files with the following structure:
#
# User_Project_Year_Journal     (main project directory)
# ┃                             ┬
# ┣━━analysis                   │
# ┣━━code                       │
# ┣━━data                       │ 	
# ┃  ┣━━processed               │ EMPTY 	
# ┃  ┗━━raw                     │ DIRECTORIES
# ┣━━submission                 │ 	
# ┃  ┣━━version1                │ 	
# ┃  ┗━━version2                │ 	
# ┣━━tools                      │ 	
# ┃                             ┼
# ┣━━LICENSE                    │ EMPTY
# ┗━━README                     │ FILES
#                               ┴

	
            #########
            # USAGE #
            #########
# The user should pass 4 ordered arguments corresponding to the following
# information of the project:
#  1) Last name of the user;
#  2) Name of the project;
#  3) Year;
#  4) Journal where the research will be submitted.
#
# NOTE:
# If any of the argumets is passed in quotes and includes black spaces, these
# spaces will be ignored.
#
# USAGE SYNTAX:
#            $./initProject.sh lastName projectName year journal
#


            ###################
            # EXECUTABLE CODE #
            ###################
# Check if user passed exactly 4 arguments:
numArgs=$#
if [[ numArgs -ne 4  ]]
then
	# Throw error message to stderr and exit with status 1:
	echo "ERROR: 4 arguments are required, but $numArgs were passed." >&2
	exit 1
fi

# Create the name of the main directory and ignore blank spaces:
mainDirName=$(echo "$1_$2_$3_$4" | tr -d ' ')

# Create the structure:
mkdir $mainDirName
mkdir $mainDirName/analysis
mkdir $mainDirName/code
mkdir $mainDirName/data
mkdir $mainDirName/data/processed
mkdir $mainDirName/data/raw
mkdir $mainDirName/submission
mkdir $mainDirName/submission/version1
mkdir $mainDirName/submission/version2
mkdir $mainDirName/tools

touch $mainDirName/LICENSE
touch $mainDirName/README

# Show results to the user:
echo "Project directory structure successfully created:"
## If exa or tree are installed, also try to show the directory structure:
exa --icons -T -s type $mainDirName || tree --dirsfirst $mainDirName || echo $mainDirName

exit 0
