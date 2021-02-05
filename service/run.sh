#!/bin/bash

# avoid error message on ctrl-c
cleanup() {
    echo
    exit 0
}
trap cleanup EXIT

# get the directory containing this script
SCRIPT_DIR=`dirname $0`

# enter directory containing this script
cd ${SCRIPT_DIR}

# run the service
echo
echo "--------------------------------------------------------------------------"
echo "The sleep service has been started in the REPRO."
echo
echo "Terminate the service by typing CTRL-C in this terminal."
echo "--------------------------------------------------------------------------"
sleep infinity
