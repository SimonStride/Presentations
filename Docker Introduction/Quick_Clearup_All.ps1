
## Needs admin shell
## DO NOT RUN ON PROD

docker ps -a | where-object {$_.substring(0, 9) -ne "CONTAINER"} | ForEach-Object{ docker rm -f $_.substring(0, 8) }
