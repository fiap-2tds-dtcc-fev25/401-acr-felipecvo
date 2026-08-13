REGISTRY=2tdsapf2128
SERVIDOR_LOGON="$REGISTRY.azurecr.io"
DOCKER_LOGIN=$(az acr credential show --name $REGISTRY --query username -o tsv)
DOCKER_PASSWORD=$(az acr credential show --name 2tdsapf2128 --query 'passwords[0].value' -o tsv)

echo "docker login -u $DOCKER_LOGIN -p $DOCKER_PASSWORD $SERVIDOR_LOGON"