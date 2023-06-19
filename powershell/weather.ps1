# Fetches weather from openweathermap.org
# and writes the output to a file
[CmdletBinding()]
param (
    [Parameter()]
    [Switch]
    $Fetch
)

If ($Fetch) {
    $parameters = @{
        Uri = "http://api.openweathermap.org/data/2.5/weather?q=prague,cz&appid=$ENV:OPENWEATHERMAP_API_KEY"
        Method = "GET"
    }

    Invoke-RestMethod @parameters | Convertto-Json `
    | Out-File -FilePath "/Users/rs/dev/roberthstrand/psconf23/weather-$(Get-Date -Format FileDateTimeUniversal).json"
}