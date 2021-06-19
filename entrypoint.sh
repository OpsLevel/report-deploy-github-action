#!/bin/sh -l

OPSLEVEL_FILE=./opslevel.yml
if test -f "$OPSLEVEL_FILE"; then
  OPSLEVEL_SERVICE=$(cat ./opslevel.yml | grep "name:" | awk '{gsub("name: ",""); print}') 
fi

cat << EOF | opslevel create deploy -i "${INPUT_INTEGRATIONID}" -f -
service: "${INPUT_SERVICE:-${OPSLEVEL_SERVICE:-${GITHUB_REPOSITORY}}}"
environment: "${INPUT_ENVIRONMENT}"
deployNumber: "${INPUT_NUMBER:-${GITHUB_RUN_NUMBER}}"
deployUrl: "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"
dedupId: "${GITHUB_RUN_ID}"
deployer:
  name: "${GITHUB_ACTOR}"
EOF
