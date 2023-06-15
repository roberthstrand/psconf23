[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $SecretName
)

$ApiServer = "https://kubernetes.default.svc"
$ServiceAccountPath = "/var/run/secrets/kubernetes.io/serviceaccount"
#$Namespace = "$ServiceAccountPath/namespace"
$Token = Get-Content -Path "$ServiceAccountPath/token" | ConvertTo-SecureString -AsPlainText -Force
$CACertificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("$ServiceAccountPath/ca.crt")

Write-Output "#########################"
Write-Output "Starting script..."
Write-Output "#########################"

$RestParams = @{
    Method = "GET"
    Uri = "$ApiServer/api"
    Certificate = $CACertificate
    Authentication = "Bearer"
    Token = $Token
    TimeoutSec = 30
}

Invoke-RestMethod @RestParams