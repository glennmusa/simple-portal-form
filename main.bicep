targetScope = 'subscription'

param location string

param subscriptionIdA string
param subscriptionIdB string

param resourceGroupNameA string
param resourceGroupNameB string

param storageAccountNameA string
param storageAccountNameB string

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

module simpleStorageAccountA './modules/storageAccount.bicep' = {
  name: 'simple-sa-a'
  scope: resourceGroup(subscriptionIdA, resourceGroupNameA)
  params: {
    name: storageAccountNameA
    location: location
    skuName: 'Standard_GRS'
    tags: tags
  }
  dependsOn: [
    simpleResourceGroupA
  ]
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

module simpleStorageAccountB './modules/storageAccount.bicep' = {
  name: 'simple-sa-b'
  scope: resourceGroup(subscriptionIdB, resourceGroupNameB)
  params: {
    name: storageAccountNameB
    location: location
    skuName: 'Standard_GRS'
    tags: tags
  }
  dependsOn: [
    simpleResourceGroupB
  ]
}
