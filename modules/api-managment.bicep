param apimName string
param apimLocation string
param publisherName string
param publisherEmail string

resource apiManagementInstance 'Microsoft.ApiManagement/service@2023-05-01-preview' = {
  name: apimName
  location: apimLocation
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
  sku: {
    name: 'Developer'
    capacity: 1
  }
}
resource api 'Microsoft.ApiManagement/service/apis@2023-05-01-preview' = {
  parent: apiManagementInstance
  name: 'ecommerceapi'
  properties: {
    displayName: apimName
    format: 'openapi+json'
    value: loadTextContent('../resources/api.json')
    protocols: [
      'https'
    ]
    path: 'ecommerce'
    isCurrent: true
  }
  dependsOn: [
    apiManagementInstance
  ]
}
