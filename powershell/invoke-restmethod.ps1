[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [String]
    $Uri
)
Invoke-RestMethod -Uri $Uri
