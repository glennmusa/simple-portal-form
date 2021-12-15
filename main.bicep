targetScope = 'subscription'

param location string = deployment().location

param subscriptionIdA string = subscription().subscriptionId
param subscriptionIdB string = subscription().subscriptionId

param resourceGroupNameA string
param resourceGroupNameB string

param storageAccountNameA string
param storageAccountNameB string

var storageAccountSkuName = 'Standard_GRS'

module simpleResourceGroupA './modules/resourceGroup.bicep' = {
  name: 'simple-rg-a'
  scope: subscription(subscriptionIdA)
  params: {
    name: resourceGroupNameA
    location: location
  }
}

module simpleResourceGroupB './modules/resourceGroup.bicep' = {
  name: 'simple-rg-b'
  scope: subscription(subscriptionIdB)
  params: {
    name: resourceGroupNameB
    location: location
  }
}

module simpleStorageAccountA './modules/storageAccount.bicep' = {
  name: 'simple-sa-a'
  scope: resourceGroup(subscriptionIdA, resourceGroupNameA)
  params: {
    name: storageAccountNameA
    location: location
    skuName: storageAccountSkuName
  }
  dependsOn: [
    simpleResourceGroupA
  ]
}

module simpleStorageAccountB './modules/storageAccount.bicep' = {
  name: 'simple-sa-b'
  scope: resourceGroup(subscriptionIdB, resourceGroupNameB)
  params: {
    name: storageAccountNameB
    location: location
    skuName: storageAccountSkuName
  }
  dependsOn: [
    simpleResourceGroupB
  ]
}
