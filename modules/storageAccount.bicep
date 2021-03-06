param name string
param location string
param skuName string
param tags object = {}

resource storageAccount 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: name
  location: location
  kind: 'Storage'
  sku: {
    name: skuName
  }
  tags: tags
}

output id string = storageAccount.id
