#!/bin/sh -l

cat <<EOF > data.yaml
service: "${INPUT_SERVICE}"
description: "${INPUT_DESCRIPTION}"
environment: "${INPUT_ENVIRONMENT}"
deploy-number: "${INPUT_NUMBER}"
deploy-url: "${INPUT_DEPLOY_URL}"
dedup-id: "${INPUT_DEDUPLICATION_ID}"
deployer:
  name: "${INPUT_DEPLOYER_NAME}"
  email: "${INPUT_DEPLOYER_EMAIL}"
EOF

opslevel create deploy -i "$INPUT_INTEGRATION_URL" -f .

rm data.yaml
