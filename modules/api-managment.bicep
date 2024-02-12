param apimName string
param apimLocation string
param publisherName string
param publisherEmail string

resource myApiManager 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: apimName
  location: apimLocation
  sku: {
    name: 'Developer'
    capacity: 1
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}

resource eCommerceApi 'Microsoft.ApiManagement/service/apis@2022-08-01' = {
  parent: myApiManager
  name: 'myapimanager'
  properties: {
    format: 'swagger-yml'
    value: loadTextContent('../resources/api.json')
    path: 'eCommerce'
  }
}

