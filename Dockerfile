FROM cgr.dev/chainguard/powershell:7.3.4
COPY src/script.ps1 script.ps1
CMD [ "./script.ps1" ]