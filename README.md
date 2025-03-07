> [!IMPORTANT]  
> This repo and action is deprecated - OpsLevel now natively pulls in deploys based on your usage of Github deploy environments and setting up the [Github integration](https://docs.opslevel.com/docs/github-integration).  


[![Overall](https://img.shields.io/endpoint?style=flat&url=https%3A%2F%2Fapp.opslevel.com%2Fapi%2Fservice_level%2FtxxR0lvVSM0hcjQ9Nuig3F0jxjsS7F7Opeq2tTZ7rT0)](https://app.opslevel.com/services/report_deploy_github_action/maturity-report)

# OpsLevel - Report Deploy Github Action

This action emits a deploy event for service to OpsLevel.  We have configured it with sane defaults so you should only have to specify `integration_url` and `service`.  `environment` defaults to `production` so if you want to track deploys from other environments you'll want to specify that too.

## Example usage - uses OpsLevel CLI directly

```yaml
jobs:
  deploy:
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Report Deploy using OpsLevel CLI
        uses: OpsLevel/report-deploy-github-action@v3.0.0
        with:
          integration_url: ${{ secrets.DEPLOY_INTEGRATION_URL }}
          service: "my-service"
```

## Example usage - uses Docker image

```yaml
jobs:
  deploy:
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Report Deploy using Docker
        uses: OpsLevel/report-deploy-github-action/with-docker@v3.0.0
        with:
          integration_url: ${{ secrets.DEPLOY_INTEGRATION_URL }}
          service: "my-service"
```

## Inputs

### `integration_url`

**Required** The OpsLevel deploy integration url.

### `service`

The service alias for the event - Default: `<github_org_or_user_name>/<repository_name>`

If the repository has an `./opslevel.yml` file the service name will get pulled from it.

### `description`

The description or release notes for the event - Default: "Event Created by ${{ github.workflow }}"

### `environment`

The environment for the event - Default: "production"

### `number`

The deploy number for the event - Default: `${{ github.run_number }}`

### `deployer_name`

The deployer name who created the event - Default: `${{ github.actor }}`

### `deployer_email`

The deployer email who create the event - Default: ""

### `deploy_url`

The deploy url that OpsLevel points to - Default: `${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}`

### `deduplication_id`

An identifier that can be used to deduplicate deployments - Default: `${{ github.run_id }}`

## Reporting Deploy with Docker or OpsLevel CLI

This action can be run using either Docker or the OpsLevel CLI, both have identical inputs and behave identically.

To report deploys to OpsLevel with the OpsLevel CLI based Github Action (default), add `uses: OpsLevel/report-deploy-github-action@v3.0.0` to your workflow.

To report deploys to OpsLevel with the Docker based Github Action, add `uses: OpsLevel/report-deploy-github-action/with-docker@v3.0.0` to your workflow.

For Github workflows operating within intentional constraints, perhaps where building public Docker images is not
an option, it may be preferable to use the default OpsLevel CLI.

## Overriding Defaults Example

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
        uses: OpsLevel/report-deploy-github-action@v3.0.0
        with:
          integration_url: ${{ secrets.DEPLOY_INTEGRATION_URL }}
          service: "my-service"
          deployer_email: ${{ steps.deployer.outputs.DEPLOYER }}
```
