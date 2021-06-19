#!/bin/sh -l

cat << EOF | opslevel create deploy -i "${INPUT_INTEGRATIONID}"
service: "${INPUT_SERVICE:-${GITHUB_REPOSITORY}}"
environment: "${INPUT_ENVIRONMENT}"
deployNumber: "${INPUT_NUMBER:-${GITHUB_RUN_NUMBER}}"
deployUrl: "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"
dedupId: "${GITHUB_RUN_ID}"
deployer:
  name: "${GITHUB_ACTOR}"
EOF
