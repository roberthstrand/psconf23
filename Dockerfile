FROM cgr.dev/chainguard/powershell:7.3.4
COPY powershell/script.ps1 /home/nonroot/script.ps1
CMD [ "./home/nonroot/script.ps1" ]