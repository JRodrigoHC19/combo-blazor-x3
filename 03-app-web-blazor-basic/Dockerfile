FROM mcr.microsoft.com/dotnet/sdk:8.0 AS create
WORKDIR /src
RUN dotnet new blazor -o web-01-blazor -n AppBlazor


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY --from=create /src/web-01-blazor/AppBlazor.csproj .
RUN dotnet restore
COPY --from=create /src/web-01-blazor .
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "AppBlazor.dll"]