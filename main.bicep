targetScope = 'subscription'

param location string

param resourceGroupNameA string

module simpleResourceGroupA './modules/resourceGroup.bicep' = {
  name: 'simple-rg-a'
  params: {
    name: resourceGroupNameA
    location: location
  }
}
