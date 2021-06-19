# OpsLevel Github Actions

This action emits a deploy event to OpsLevel.

## Inputs

### `integrationId`

**Required** The OpsLevel deploy integration id.

### `service`

The service alias for the event - Default: `<org_user>/<repository>`

If the repository has an `./opslevel.yml` file the service name will get pulled from it.

### `environment`

The environment for the event - Default: ""

### `number`

The deploy number for the event - Default: `${GITHUB_RUN_NUMBER}`

## Example usage

uses: opslevel/github-actions@v0.0.1
with:
  integrationId: ${{ secrets.OL_INTEGRATION_ID }}
  service: "foobar"