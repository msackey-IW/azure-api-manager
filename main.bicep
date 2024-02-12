targetScope='resourceGroup' 
param apimName string = 'myapimanager'
param apimLocation string = 'australiaeast'
param publisherName string = 'Mathias'
param publisherEmail string = 'mathias.sackey@outlook.com'

module azureApiMangement 'modules/api-managment.bicep' = {
  name: apimName
  params: {
    apimLocation: apimLocation
    apimName: apimName
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}
