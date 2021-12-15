targetScope = 'subscription'

param location string

param subscriptionIdA string
param subscriptionIdB string

param resourceGroupNameA string
param resourceGroupNameB string

param tags object = {}

module simpleResourceGroupA './modules/resourceGroup.bicep' = {
  name: 'simple-rg-a'
  scope: subscription(subscriptionIdA)
  params: {
    name: resourceGroupNameA
    location: location
    tags: tags
  }
}

module simpleResourceGroupB './modules/resourceGroup.bicep' = {
  name: 'simple-rg-b'
  scope: subscription(subscriptionIdB)
  params: {
    name: resourceGroupNameB
    location: location
    tags: tags
  }
}
