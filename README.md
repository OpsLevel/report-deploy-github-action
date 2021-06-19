# OpsLevel Github Actions

This action emits a deploy event to OpsLevel.

## Inputs

### `integrationId`

**Required** The OpsLevel deploy integration id.

### `service`

**Required** The service alias for the event

## Example usage

uses: opslevel/github-actions@v0.0.1
with:
  integrationId: ${{ secrets.OL_INTEGRATION_ID }}
  service: "foobar"