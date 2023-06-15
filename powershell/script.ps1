[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $SecretName
)

$ApiServer = "https://kubernetes.default.svc"
$ServiceAccountPath = "/var/run/secrets/kubernetes.io/serviceaccount"
#$Namespace = "$ServiceAccountPath/namespace"
$Token = "$ServiceAccountPath/token"
[System.Security.Cryptography.X509Certificates.X509Certificate2]$CACertificate = "$ServiceAccountPath/ca.crt"

$Header = @{
    'Authorization' = "Bearer $Token"
}

Invoke-RestMethod -Method "GET" -Certificate $CACertificate -Headers $Header -Uri "$ApiServer/api"