resource "azurerm_logic_app_workflow" "Snitches_logicapp" {
  name                = "SendMailWhenNewSnitch"
  location            = local.RGlocation
  resource_group_name = local.RGname
}

resource "azurerm_logic_app_trigger_http_request" "Snitches_http" {
  name         = "Snitch-http-trigger"
  logic_app_id = azurerm_logic_app_workflow.Snitches_logicapp.id

  schema = <<SCHEMA
{
    "type": "object",
    "properties": {
        "SnitchesStory": {
            "type": "string"
        },
            "required": ["SnitchesStory"]
        
    }
}
SCHEMA

}