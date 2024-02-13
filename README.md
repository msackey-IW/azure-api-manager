# AZURE API MANAGEMENT 
This repository contains bicep files which stand up an azure api management instance. 

## REQUIRED SOFTWARE
- [Azure Subscription](https://azure.microsoft.com/en-gb/free/search/?ef_id=_k_EAIaIQobChMIicr1geWkhAMVjahmAh2lGwlAEAAYASAAEgJIavD_BwE_k_&OCID=AIDcmmp3m06wb2_SEM__k_EAIaIQobChMIicr1geWkhAMVjahmAh2lGwlAEAAYASAAEgJIavD_BwE_k_&gad_source=1&gclid=EAIaIQobChMIicr1geWkhAMVjahmAh2lGwlAEAAYASAAEgJIavD_BwE)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [VS Code](https://code.visualstudio.com/download)
- [Git](https://www.google.com/search?q=git+download&oq=git+download&gs_lcrp=EgZjaHJvbWUqCQgAEEUYOxiABDIJCAAQRRg7GIAEMgcIARAAGIAEMgcIAhAAGIAEMgcIAxAAGIAEMgcIBBAAGIAEMgcIBRAAGIAEMgcIBhAAGIAEMgcIBxAAGIAEMgYICBBFGDzSAQgxOTU1ajBqMagCALACAA&sourceid=chrome&ie=UTF-8)

## SETTING UP
- Open a terminal or command prompt (Powershell on Windows and Terminal or linux or macOS)
- Navigate to the directory in which you want to clone the project as shown below.
```bash
cd path/to/your/directory
```
- Run the command below to clone the repository
```bash
git clone git@github.com:msackey-IW/azure-api-manager.git
```
- Run the code snippet below in the sample terminal directory as the now cloned project
``` bash
cd azure-api-manager
```
- Run the command below to login to your azure portal
``` bash
az login
```
- Run the code below to create an azure resource group
```bash
az group create -g azureapimanagerresourcegroup -l australiaeast
```
- Run the command below to execute the bicep script to create the azure api manager
``` bash
az deployment group create -g azureapimanagerresourcegroup -f main.bicep
```
- Due to the significant size of the resource, it may take up to an hour to get up and running.
- A successful completion of the apim instance should show a json with the details of the instance as shown in the example below.
```json
{
  "id": "/subscriptions/1c2f3635-7522-41b4-b63a-8a891c19fcbd/resourceGroups/azureapimanagerresourcegroup/providers/Microsoft.Resources/deployments/main",
  "location": null,
  "name": "main",
  "properties": {
    "correlationId": "d22cb78b-5b28-4eaa-9d68-443c726fe5e8",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT1M36.3840677S",
    "error": null,
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/1c2f3635-7522-41b4-b63a-8a891c19fcbd/resourceGroups/azureapimanagerresourcegroup/providers/Microsoft.ApiManagement/service/ecommercapimanager",
        "resourceGroup": "azureapimanagerresourcegroup"
      },
      {
        "id": "/subscriptions/1c2f3635-7522-41b4-b63a-8a891c19fcbd/resourceGroups/azureapimanagerresourcegroup/providers/Microsoft.ApiManagement/service/ecommercapimanager/apis/ecommerceapi",
        "resourceGroup": "azureapimanagerresourcegroup"
      }
    ],
    "outputs": null,
    "parameters": {
      "apimLocation": {
        "type": "String",
        "value": "australiaeast"
      },
      "apimName": {
        "type": "String",
        "value": "ecommercapimanager"
      },
      "publisherEmail": {
        "type": "String",
        "value": "mathias.sackey@outlook.com"
      },
      "publisherName": {
        "type": "String",
        "value": "Mathias Sackey"
      }
    },
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.Resources",
        "providerAuthorizationConsentState": null,
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              null
            ],
            "properties": null,
            "resourceType": "deployments",
            "zoneMappings": null
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "templateHash": "2855039350285583091",
    "templateLink": null,
    "timestamp": "2024-02-13T00:23:46.068344+00:00",
    "validatedResources": null
  },
  "resourceGroup": "azureapimanagerresourcegroup",
  "tags": null,
  "type": "Microsoft.Resources/deployments"
}
```

## TESTING
- Login to [azure portal](https://portal.azure.com/#home).
- Navigate to `resource groups -> azureapimanagerresourcegroup -> ecommerceapimanager`.
- In the left sidebar, click on `APIs -> ecommerceapimanager`.
- This should provide you will a list of API endpoints implemented using the openapi spec found in `resources/api.json` now manage in Azure APIM.
- The Endpoints are yet to be implemented but give you an idea of what they would look like within Azure APIM.

## CLOSING UP
- Once testing is completed, return to the terminal where all the previous commands were run and finish with the command below.
```bash
az group delete -g azureapimanagerresourcegroup
```
-  Type `y` and the `enter key` when prompted to do so.
- All resources created during this test should now be destroyed.
