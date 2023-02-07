az container create \
  --name appcontainer \
  --resource-group rsg-dataserv-weu1-d-022 \
  --image mcr.microsoft.com/azuredocs/aci-helloworld \
  --vnet vnt-dataserv-weu1-d-001 \
  --vnet-address-prefix 10.56.194.0/23 \
  --subnet snt-dataserv-weu1-d-001-04-aci \
  --subnet-address-prefix 	10.56.195.48/28

az acr create --resource-group rsg-dataserv-weu1-d-022 \
  --name regdataservweu1d001 --sku Basic

  
az container create \
  --name aci-dbrlibs \
  --resource-group rsg-dataserv-weu1-d-022 \
  --image regdataservweu1d001.azurecr.io/dbrlibs \
  --registry-login-server regdataservweu1d001.azurecr.io \
  --registry-username regdataservweu1d001 \
  --registry-password 7+PDkfsg2dsdHL1oIeUCotkoUYKNJ8zX \
  --vnet /subscriptions/9aaf76a1-3252-4daa-b293-faac15046878/resourceGroups/rsg-dataserv-weu1-d-002/providers/Microsoft.Network/virtualNetworks/vnt-dataserv-weu1-d-001 \
  --subnet snt-dataserv-weu1-d-001-08-aci \
  --subnet-address-prefix 10.56.195.48/29
   

sp=racwli&st=2022-10-03T12:54:31Z&se=2022-10-04T20:54:31Z&spr=https&sv=2021-06-08&sr=c&sig=xz3hmiS%2F6sJA1U5As1bVmUmx6L8lPJ16He5XZJ8IX44%3D