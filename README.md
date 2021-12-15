# simple-portal-form

A simple Azure Portal Form View template.

This repo contains a [Azure Portal form](./form.json) that uses [CreateUiDefinition Elements](https://docs.microsoft.com/en-us/azure/azure-resource-manager/managed-applications/create-uidefinition-elements) and [CreateUiDefinition Functions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/managed-applications/create-uidefinition-functions) to pass output parameters into [an ARM template](./main.json) ([compiled](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-cli#build) from this [Bicep template](./main.bicep)) to deploy storage accounts into resource groups in different subscriptions.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fglennmusa%2Fsimple-portal-form%2Fmain%2Fmain.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fglennmusa%2Fsimple-portal-form%2Fmain%2Fform.json)
