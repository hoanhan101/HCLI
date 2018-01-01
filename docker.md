# `docker`

### `basic`
- List all images: `docker images`
- List all running containers: `docker ps -a`
- Run a container in shell: `docker run -i -t image_name /bin/bash` - only runs for as long as the command we specied
- Name a container `docker run --name container_name -i -t image_name /bin/bash`
- Start a stopped cdontainer: `docker start container_name`
- Stop a container: `docker stop container_name`
- Attach to a running container: `docker attach container_name`
- Create a long running container: `docker run --name container_name -d image_name /bin/sh -c "while true; do echo hello world; sleep 1; done"`
- Show the last x containers: `docker ps -n x`

### `delete`
- Detele a container: `docker rm container_name`
- Stop all containers: `docker stop $(docker ps -aq)`
- - `-a`: lists all containers
- - `-q`: only returns the container IDs
- - `-f`: force removes any running containers
- Remove all containers: `docker rm $(docker ps -aq)`
- Remove all images: `docker rmi -f $(docker images -q)`

### `logs`
- Fetch the logs: `docker logs container_name`
- Tail the logs: `docker logs -f container_name`	
- Get the last 10 lines:`docker logs --tail 10 container_name`
- Follow the logs: `docker logs --tail 0 -f container_name`
- Add timestamp: `docker logs -ft container_name`

### `process`
- Inspect the process: `docker top container_name`
- Show statistics: `docker stats container_name`
- Running a background task inside a container: `docker exec -d containder_name touch /etc/new_config_file`
- Running an interactive command inside a container: `docker exec -t -i container_dave /bin/bash`

### `restart`
- `docker run --restart=always --name container_name -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"`
- - `always`: restarts the container no matter what exit code is returned
- - `on-failure`: restarts the container if it exits with a non-zero exit code
- - `on-failure:5`: restart the container a maximum of five times

### `inspect` 
- `docker inspect container_name`
- - State: `docker inspect --format='{{ .State.Running }}' container_name`
- - IP address: `docker inspect --format '{{ .NetworkSettings.IPAddress }}' container_name`
- - Multiple containers: `docker inspect --format '{{.Name}} {{.State.Running}}' container_1 container_2` 




<!-- To be organized -->

- Run a container as daemon, map ports: `docker run -d -p 5000:5000 image_name`
- Run unless stop: `docker run -dit -p 5000:5000 --restart unless-stopped container_name`

### `build`
- Build an image: `docker build -t image_name:latest .` 

### `docker hub`
- Tag a specific image: `docker tag image_id username/image_name:latest`
- Push a specific image to a personal repo: `docker push username/image_name`
- Similarly for organiztion: `docker tag image_id organization_name/image_name:latest`
- `docker push organization_name/image_name:latest`

### `pull`
- `docker pull organization_name/app_name`
- `docker run -d -p organization_name/app_name`
