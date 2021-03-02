FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /app

RUN apt-get update -yq  

RUN apt-get install curl gnupg -yq

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash 

RUN apt-get install -y nodejs

COPY  . .

RUN dotnet build

WORKDIR /app/DotnetTemplate.Web

RUN npm install

RUN npm run build

ENTRYPOINT dotnet run 