[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $ESTemplateUrl = 'https://raw.githubusercontent.com/navgov/wingtip/master/armTemplates/es-foundation.json',
    $location = "West Europe",
    $paramFileUrl = "https://raw.githubusercontent.com/navgov/wingtip/master/armTemplates/es-foundation.parameters.json"
)
#autentiserer med MSI
import-module az.accounts
connect-azaccount -identity

#deployer fra github
New-AzTenantDeployment -Name demoTenantDeployment -Location $location -TemplateUri $ESTemplateUrl -TemplateParameterUri $paramFileUrl