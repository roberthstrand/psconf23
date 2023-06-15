[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $SecretName
)

$ApiServer = "https://kubernetes.default.svc"
$ServiceAccountPath = "/var/run/secrets/kubernetes.io/serviceaccount"
#$Namespace = "$ServiceAccountPath/namespace"
$Token = Get-Content -Path "$ServiceAccountPath/token"
$CACertificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("$ServiceAccountPath/ca.crt")
$Header = @{
    'Authorization' = "Bearer $Token"
}

Write-Output "#########################"
Write-Output "Starting script..."
Write-Output "#########################"

Invoke-RestMethod -Method "GET" -Certificate $CACertificate -Headers @Header -Uri "$ApiServer/api" -TimeoutSec 30