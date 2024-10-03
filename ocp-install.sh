#!/bin/bash

# The script can be launched with this command in katacoda
# curl -s https://raw.githubusercontent.com/mossicrue/clh-sorint/master/katacoda-install.sh | bash

echo -e "Command Line Heroes Katacoda install script.\nThe installation process may take some times, please wait."

# variables
MANIFEST_PATH="https://raw.githubusercontent.com/mossicrue/clh-sorint/master/kubernetes/ocp-resources.yml"
GAME_ROUTE_LINK=""

# Check oc command presence
OC_COMMAND=$(which oc 2>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "\nFATAL ERROR: Openshift environment didn't load well!\nRefresh the page and start a new scenario."
  exit 10
fi

# Check if user is logged
(${OC_COMMAND} whoami &>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "\nFATAL ERROR: Openshift user is not logged.\nTry to refresh the page or wait some minutes."
  exit 11
fi

# Apply the all in one manifest
(${OC_COMMAND} apply -f ${MANIFEST_PATH} &>/dev/null)

# Wait for the Pod to be in running state
POD_STATUS="$(${OC_COMMAND} get pod -n clh-game --no-headers=true -o custom-columns=READY:.status.phase 2>/dev/null)"
while [[ ${POD_STATUS} != "Running" ]]
do
  sleep 10s
  POD_STATUS="$(${OC_COMMAND} get pod -n clh-game --no-headers=true -o custom-columns=READY:.status.phase 2>/dev/null)"
done

# Get all the route in clh-game namespace
GAME_ROUTE_LINK=$(${OC_COMMAND} get route clh-game -n clh-game --output=custom-columns=HOST:.spec.host --no-headers=true 2>/dev/null)
if [[ -z "${GAME_ROUTE_LINK}" ]]
then
  echo -e "\nFATAL ERROR: Seems that no route is deployed. Try to relaunch the install script"
fi

cat << EOF

***********************
* COMMAND LINE HEROES *
***********************

SUCCESS! The game is now up and running at the following link:

http://${GAME_ROUTE_LINK}

NOTE: Use Chrome for the best experience and keep this page open while playing the game!

EOF