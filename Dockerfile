FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14
COPY powershell/* .
RUN pwsh -c Install-Module -Name Pode
ENTRYPOINT [ "pwsh" ]