#!/bin/sh -l

env

opslevel create deploy --logLevel=DEBUG \
  -i "${INPUT_INTEGRATIONID}" \
  -s "${INPUT_SERVICE:-${GITHUB_REPOSITORY}}" \
  -e "${INPUT_ENVIRONMENT}" \
  -n "${INPUT_NUMBER:-${GITHUB_RUN_NUMBER}}" \
  --url "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}" \
  --id "${GITHUB_RUN_ID}"
