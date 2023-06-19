Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 8080 -Protocol Http
    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeJsonResponse -Value @{ 'value' = 'Welcome, PowerShell aficionado!' }
    }
}