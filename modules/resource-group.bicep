targetScope='subscription'

param resourceGroupName string 
param resourceGroupLocation string = 'australiaeast'
param storageName string 
param storageLocation string = 'australiaeast'

resource newRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module storageAcct 'storage.bicep' = {
  name: 'storageModule'
  scope: newRG
  params: {
    storageLocation: storageLocation
    storageName: storageName
  }
}
