# OpsLevel - Report Deploy Github Action

This action emits a deploy event for service to OpsLevel.

## Inputs

### `integration_url`

**Required** The OpsLevel deploy integration url.

### `service`

The service alias for the event - Default: `<github_org_or_user_name>/<repository_name>`

If the repository has an `./opslevel.yml` file the service name will get pulled from it.

### `description`

The description or release notes for the event

### `environment`

The environment for the event - Default: ""

### `number`

The deploy number for the event - Default: `${GITHUB_RUN_NUMBER}`

## Example usage

```yaml
uses: OpsLevel/report-deploy-github-action@v0.1.0
with:
  integration_url: ${{ secrets.OL_INTEGRATION_URL }}
```
