#!/bin/sh -l

OPSLEVEL_FILE=./opslevel.yml
if test -f "$OPSLEVEL_FILE"; then
  OPSLEVEL_SERVICE=$(cat ./opslevel.yml | grep "name:" | awk '{gsub("name:",""); print}' | xargs) 
fi

cat << EOF | opslevel create deploy -i "${INPUT_INTEGRATION_URL}" -f -
service: "${INPUT_SERVICE:-${OPSLEVEL_SERVICE:-${GITHUB_REPOSITORY}}}"
description: "${INPUT_DESCRIPTION}"
environment: "${INPUT_ENVIRONMENT}"
deploy-number: "${INPUT_NUMBER:-${GITHUB_RUN_NUMBER}}"
deploy-url: "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"
dedup-id: "${GITHUB_RUN_ID}"
deployer:
  name: "${GITHUB_ACTOR}"
  email: ""
EOF
