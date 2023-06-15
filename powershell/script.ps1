[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [String]
    $SecretName
)

$ApiServer = "https://" + $ENV:KUBERNETES_SERVICE_HOST + ":" + $ENV:KUBERNETES_SERVICE_PORT
$ServiceAccountPath = "/var/run/secrets/kubernetes.io/serviceaccount"
$Namespace = "$ServiceAccountPath/namespace"
$Token = Get-Content -Path "$ServiceAccountPath/token" | ConvertTo-SecureString -AsPlainText -Force
#$CACertificate = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("$ServiceAccountPath/ca.crt")

Write-Output "#############################"
Write-Output "#    Starting script...     #"
Write-Output "# Connecting to the address #"
Write-Output "#   $ApiServer   #"
Write-Output "#############################"

$RestParams = @{
    Method = "GET"
    Uri = "$ApiServer/api/v1/namespaces/$Namespace/pods"
    #Certificate = $CACertificate
    Header = @{
        Authorization = "Bearer $Token"
    }
    TimeoutSec = 45
    SkipCertificateCheck = $true
}

Invoke-RestMethod @RestParams