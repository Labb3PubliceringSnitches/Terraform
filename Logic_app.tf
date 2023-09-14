
resource "azurerm_logic_app_workflow" "Snitches_logic" {
name                = "snitches_logicapp"
location            = local.RGlocation
resource_group_name = local.RGname

definition = <<EOF
{
    "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
    "actions": {
        "Send_an_email_(V2)": {
            "type": "ApiConnection",
            "inputs": {
                "body": {
                    "To": "rickard.bohman@iths.se",
                    "Subject": "New HTTP Request",
                    "Body": "A new HTTP request has been received."
                },
                "host": {
                    "connectionName": "@parameters('$connections')['office365']['connectionId']"
                },
                "method": "post",
                "path": "/v2/Mail"
            },
            "runAfter": {},
            "type": "ApiConnection"
        }
    },
    "contentVersion": "1.0.0.0",
    "outputs": {
        "test"
    },
    "triggers": {
        "manual": {
            "inputs": {
                "schema": {
                    "type": "object",
                "properties": {
                    "snitchstory": {
                        "type": "string"
                    }
                },
                "required": ["snitchstory"]
            }
                }
            },
            "kind": "Http",
            "type": "Request"
        }
    }
}
EOF
}

