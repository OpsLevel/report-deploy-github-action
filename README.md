[![Overall](https://img.shields.io/endpoint?style=flat&url=https%3A%2F%2Fapp.opslevel.com%2Fapi%2Fservice_level%2FtxxR0lvVSM0hcjQ9Nuig3F0jxjsS7F7Opeq2tTZ7rT0)](https://app.opslevel.com/services/report_deploy_github_action/maturity-report)

# OpsLevel - Report Deploy Github Action

This action emits a deploy event for service to OpsLevel.

## Inputs

### `integration_url`

**Required** The OpsLevel deploy integration url.

### `service`

The service alias for the event - Default: `<github_org_or_user_name>/<repository_name>`

If the repository has an `./opslevel.yml` file the service name will get pulled from it.

### `description`

The description or release notes for the event - Default: ""

### `environment`

The environment for the event - Default: ""

### `number`

The deploy number for the event - Default: `${GITHUB_RUN_NUMBER}`

### `deployer_name`

The deployer name who created the event - Default: `${GITHUB_ACTOR}`

### `deployer_email`

The deployer email who create the event - Default: ""

### `deploy_url`

The deploy url that OpsLevel points to - Default: `${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}`

### `deduplication_id`

An identifier that can be used to deduplicate deployments - Default: `${GITHUB_RUN_ID}`

### `use_docker`

Send deploy using Docker container if "true" - use OpsLevel CLI otherwise - Default: `true`

## Reporting Deploy with Docker or OpsLevel CLI

This action can be run using either Docker or the OpsLevel CLI, depending on the value of the `use_docker` input.

While both behave identically, this action will run using Docker by default - see [./with-docker](./with-docker).
For Github workflows operating within intentional constraints, perhaps where building public Docker images is not
an option, it may be preferable to use the OpsLevel CLI.

## Example usage

```yaml
jobs:
  deploy:
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Report Deploy
        uses: OpsLevel/report-deploy-github-action@v2.0.0
        with:
          integration_url: ${{ secrets.DEPLOY_INTEGRATION_URL }}
          service: "my-service"
          use_docker: "true"
```

If you want to add the git commit author as the deployer

```yaml
jobs:
  deploy:
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Get Deployer
        id: deployer
        run: |
          DEPLOYER=$(git show -s --format='%ae')
          echo "DEPLOYER=${DEPLOYER}" >> $GITHUB_OUTPUT
      - name: Report Deploy
        uses: OpsLevel/report-deploy-github-action@v2.0.0
        with:
          integration_url: ${{ secrets.DEPLOY_INTEGRATION_URL }}
          service: "my-service"
          deployer_email: ${{ steps.deployer.outputs.DEPLOYER }}
          use_docker: "false"
```
