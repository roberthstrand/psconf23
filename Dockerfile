FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14
COPY powershell/invoke-restmethod.ps1 script.ps1
ENTRYPOINT [ "pwsh" ]