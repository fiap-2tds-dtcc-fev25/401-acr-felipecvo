REGISTRY=2tdsapf2128
RG_NAME=rg-pf2128-aci
LOCATION=eastus

az group create --name $RG_NAME --location $LOCATION

ACR_USERNAME=$(az acr credential show \
  --name $REGISTRY \
  --query username \
  --output tsv)

ACR_PASSWORD=$(az acr credential show \
  --name $REGISTRY \
  --query 'passwords[0].value' \
  --output tsv)

az container create \
    --resource-group $RG_NAME \
    --name guacamole-api \
    --image $REGISTRY.azurecr.io/guacamole:v1 \
    --cpu 1 \
    --memory 2 \
    --ports 8080 \
    --registry-username $ACR_USERNAME \
    --registry-password $ACR_PASSWORD \
    --os-type Linux \
    --ip-address Public