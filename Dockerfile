# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ./src/App/*.csproj ./App/
RUN dotnet restore App/App.csproj
COPY ./src/App/. ./App/
WORKDIR /src/App
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:8.0 AS runtime
WORKDIR /app

# Patch OS packages to pull in security fixes
RUN apt-get update \
 && apt-get install -y --only-upgrade \
      libc-bin \
      libc6 \
      libpam-runtime \
      libpam-modules \
      libpam-modules-bin \
      libpam0g \
      perl-base \
      zlib1g \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/publish ./
ENTRYPOINT ["dotnet", "App.dll"]
