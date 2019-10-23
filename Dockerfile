FROM microsoft/dotnet:2.2-sdk AS installer-env
MAINTAINER "todd.hatcher@fcsamerica.com"

COPY . /src/dotnet-function-app
RUN cd /src/dotnet-function-app && \
    mkdir -p /home/site/wwwroot && \
    dotnet restore *.csproj && \
    dotnet publish *.csproj --output /home/site/wwwroot

FROM azure-functions-dotnet-with-r
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY --from=installer-env ["/home/site/wwwroot", "/home/site/wwwroot"]