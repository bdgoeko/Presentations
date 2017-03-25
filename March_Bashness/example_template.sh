#!/bin/bash

# Name: test_script.sh 
# Description: An example script that does nothing.
#
# Copyright Brian Dolan-Goecke 2011-2017
# Contact Brian Dolan-Goecke 

VERSION="0.0.4-bdg-2011"

# Global Variables
EXIT_STATUS=0

################################################################################
# FUNCTIONS ####################################################################
################################################################################
function LOG {
  # keep track of what we are doing
  DATETIME=`date +%Y%m%d%H%M`
  # output date pid into log file
  echo "${DATETIME} [$$] $1" >> ${LOG_FILE}
}

function LOGERR {
  # lets know why we had an error
  # the error number is the exit code used
  LOG "$1 (ERROR:$2)"
}

function usage() {
  NAME=`basename ${0}`
  echo "${NAME} options for script"
  echo "explain the options here"
}

################################################################################
# Script Starts Here ###########################################################
################################################################################

# Not needed for this script.
## Make sure we are root
#if test ${EUID} -ne 0 ; then
#  echo "Not running as root, unable to make changes."
#  echo "no point then! dieing..."
#  # Exit now with error
#  exit 2
#fi

if test $# -le 0
then
  echo "No options, exiting..."
  exit 2
fi

echo "The number of options you passed was $#"
echo "They were"
while test $# -ge 1
do
  echo $1
  shift
done

# Alls well that ends well.
exit ${EXIT_STATUS}

