FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14
COPY powershell/script.ps1 script.ps1
CMD [ "./script.ps1" ]