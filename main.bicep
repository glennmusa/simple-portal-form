targetScope = 'subscription'

param location string

param resourceGroupNameA string

param tags object = {}

module simpleResourceGroupA './modules/resourceGroup.bicep' = {
  name: 'simple-rg-a'
  params: {
    name: resourceGroupNameA
    location: location
    tags: tags
  }
}
