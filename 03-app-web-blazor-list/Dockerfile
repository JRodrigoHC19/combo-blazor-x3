FROM mcr.microsoft.com/dotnet/sdk:8.0 AS create
WORKDIR /src
RUN dotnet new blazor -o web-03-blazor -n AppBlazor
RUN dotnet new razorcomponent -n Todo -o ./web-03-blazor/Components/Pages
COPY ./NavMenu.razor ./web-03-blazor/Components/Layout/NavMenu.razor
COPY ./Todo.razor ./web-03-blazor/Components/Pages/Todo.razor
COPY ./TodoItem.cs ./web-03-blazor/TodoItem.cs


FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY --from=create /src/web-03-blazor/AppBlazor.csproj .
RUN dotnet restore
COPY --from=create /src/web-03-blazor .
RUN dotnet publish -c release -o /app


FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "AppBlazor.dll"]