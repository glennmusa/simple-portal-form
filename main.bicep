targetScope = 'subscription'

param nowUtc string = utcNow()

param subscriptionId string = subscription().subscriptionId
param location string = deployment().location

param resourceGroupName string

param storageAccountName string

param tags object = {}

module simpleResourceGroup './modules/resourceGroup.bicep' = {
  name: 'simple-rg-${nowUtc}'
  scope: subscription(subscriptionId)
  params: {
    name: resourceGroupName
    location: location
    tags: tags
  }
}

module simpleStorageAccount './modules/storageAccount.bicep' = {
  name: 'simple-sa-${nowUtc}'
  scope: resourceGroup(subscriptionId, resourceGroupName)
  params: {
    name: storageAccountName
    location: location
    skuName: 'Standard_GRS'
    tags: tags
  }
  dependsOn: [
    simpleResourceGroup
  ]
}
