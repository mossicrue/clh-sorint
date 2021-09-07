#!/bin/bash

# The script can be launched with this command in katacoda
# curl -s https://raw.githubusercontent.com/mossicrue/clh-sorint/master/katacoda-install.sh | bash

# variables
MANIFEST_PATH="https://raw.githubusercontent.com/mossicrue/clh-sorint/master/kubernetes/clh-all.yml"
GAME_ROUTE_LINK=""

# Check oc command presence
OC_COMMAND=$(which oc 2>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "FATAL ERROR: Openshift environment didn't load well!\nRefresh the page and start a new scenario."
  exit 10
fi

# Check if user is logged
(${OC_COMMAND} whoami &>/dev/null)
if [[ $? -ne 0 ]]
then
  echo -e "FATAL ERROR: Openshift user is not logged.\nTry to refresh the page or wait some minutes."
  exit 11
fi

# Apply the all in one manifest
(${OC_COMMAND} apply -f ${MANIFEST_PATH} &>/dev/null)

# Get all the route in clh-game namespace
GAME_ROUTE_LINK=$(${OC_COMMAND} get route clh-game -n clh-game --output=custom-columns=HOST:.spec.host --no-headers=true 2>/dev/null)
if [[ -z "${GAME_ROUTE_LINK}" ]]
then
  echo -e "FATAL ERROR: Seems that no route is deployed. Try to relaunch the install script"
fi

cat << EOF

***********************
* COMMAND LINE HEROES *
***********************

SUCCESS! The game is now up and running and is available at the following link, use Chrome for the best experience.

${GAME_ROUTE_LINK}

NOTE: Keep this page open while playing the game

EOF