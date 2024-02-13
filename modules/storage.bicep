@minLength(5)
@maxLength(24)
@description('StorageName must have min 5 chars and a max of 24 chars')
param storageName string

param storageLocation string = 'australiaeast'

resource storageAcct 'Microsoft.Storage/storageAccounts@2023-01-01'= {
  name: storageName
  location: storageLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
  properties: {}
}
