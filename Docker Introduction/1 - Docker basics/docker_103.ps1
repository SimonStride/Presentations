
# Run SQL Server in Docker
docker run --rm -d -p 1001:1433 -e ACCEPT_EULA=Y -e SA_PASSWORD="Password1234" --name sqlserver_demo mcr.microsoft.com/mssql/server

<#

Command breakdown
docker run                                              ...Create a container from an image
    --rm                                                ...Replace if it is already created
    -d                                                  ...Run in Daemon (background) mode
    -p 1001:1433                                        ...Expose/map external port 1001 to internal port 1433 (SQL Server default)
    -e ACCEPT_EULA=Y -e SA_PASSWORD="Password1234"      ...Environment variables for SQL Server
    --name sqlserver_demo                               ...Name the container for simplicity later
    mcr.microsoft.com/mssql/server                      ...Image to create
#>


