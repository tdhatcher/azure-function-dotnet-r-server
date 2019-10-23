# Azure Function using Custom Container with R Server

### Extend the base Azure Function (Linux/.Net Core 2.2) by installing R Server
`docker build -t azure-functions-dotnet-with-r -f Dockerfile-r .`

### Quick building of project image
`docker build -t testapp:latest .`

### Run Locally
`docker run -d -it -p 8080:80 testapp`

### Attach and explore instance
`docker exec -it {container_id} bin/bash`

### Cleanup Local dangling Docker images
`docker image prune`