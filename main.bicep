targetScope = 'subscription'

param location string

param subscriptionIdA string
param resourceGroupNameA string

module simpleResourceGroupA './modules/resourceGroup.bicep' = {
  name: 'simple-rg-a'
  scope: subscription(subscriptionIdA)
  params: {
    name: resourceGroupNameA
    location: location
  }
}
