#!/bin/bash

# variables
MANIFEST_PATH="https://raw.githubusercontent.com/mossicrue/clh-sorint/master/kubernetes/clh-all.yml"

# Check oc command presence
OC_COMMAND=$(which oc 2>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "FATAL ERROR: Openshift environment didn't load well!\nRefresh the page and start a new scenario."
fi

# Check if user is logged
(${OC_COMMAND} whoami &>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "FATAL ERROR: Openshift user is not logged.\nTry to refresh the page or wait some minutes."
fi

# Apply the all in one manifest
(${OC_COMMAND} apply -f ${MANIFEST_PATH})

# Get all the route in clh-game namespace
