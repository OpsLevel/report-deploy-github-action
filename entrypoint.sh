#!/bin/sh -l

OPSLEVEL_FILE=./opslevel.yml
if test -f "$OPSLEVEL_FILE"; then
  OPSLEVEL_SERVICE=$(cat ./opslevel.yml | grep "name:" | awk '{gsub("name:",""); print}' | xargs)
fi

cat <<EOF > data.yaml
service: "${SERVICE:-${OPSLEVEL_SERVICE}}"
description: "${DESCRIPTION}"
environment: "${ENVIRONMENT}"
deploy-number: "${NUMBER}"
deploy-url: "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"
dedup-id: "${DEDUPLICATION_ID}"
deployer:
  name: "${DEPLOYER_NAME}"
  email: "${DEPLOYER_EMAIL}"
EOF

opslevel create deploy -i "$INTEGRATION_URL" -f .

rm data.yaml
