# `docker`

### `list`
- List all running containers: `docker ps -a`
- - `-a`: lists all containers
- - `-l`: shows the last container launched
- Show the last x containers: `docker ps -n x`
- Show container's port: `docker port container_name`

### `run`
- Run a container in shell: `docker run -i -t image_name /bin/bash` - only runs for as long as the command we specied
- Name a container `docker run --name container_name -i -t image_name /bin/bash`
- Start a stopped cdontainer: `docker start container_name`
- Stop a container: `docker stop container_name`
- Attach to a running container: `docker attach container_name`
- Create a long running container: `docker run --name container_name -d image_name /bin/sh -c "while true; do echo hello world; sleep 1; done"`

### `delete`
- Detele a container: `docker rm container_name`
- Stop all containers: `docker stop $(docker ps -aq)`
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

### `images`
- List all images: `docker images`
- Pull an image: `docker pull image_namae`
- Run a tagged image: `docker run -t -i --name container_name image_name:tag_number /bin/ bash`
- Search for an image: `docker search image_name`
- Login and logout to Docker Hub: `docker login` & `docker logout`

### `build`
- Build an image from Dockerfile: `docker build -t="hoanhan/image_name" .`
- - `-t`: mark our resulting image with a repository and a name
- - `.`: tlook in the local directory to to find the Dockerfile
- - default tag is `latest`
- Tag a build: `docker build -t="hoanhan/image_name:v1" .`
- Bypass the build cache: `docker build --no-cache -t="hoanhan/image_name" .`
- Show history: `docker history image_name`

### `run`
- `docker run -d -p 80 --name static_web hoanhan/static_web nginx -g "daemon off;"`
- - `-d`: runs detached in the background
- - `nginx -g "daemon off;"`: launches Nginx in the foreground to run our web server
- - `-p`: manages which network ports Docker publishes at runtime
- Bind port from the container to local host's:
- - 80 -> 8080: `docker run -d -p 8080:80 --name container_name hoanhan/image_name nginx -g "daemon off;"`
- - 80 -> 127.0.0.1's random port: `docker run -d -p 127.0.0.1::80 --name container_name hoanhan/image_name nginx -g "daemon off;"`
- - 80 -> 127.0.0.1:80: `docker run -d -p 127.0.0.1:80:80 --name container_name hoanhan/image_name nginx -g "daemon off;"`
- - Publish a random port and any additional ports we've specified in Dockerfile: `docker run -d -P --name container_name hoanhan/image_name nginx -g "daemon off;"`
- Run unless stop: `docker run -dit -p 5000:5000 --restart unless-stopped container_name`



<!-- To be organized -->



### `docker hub`
- Tag a specific image: `docker tag image_id username/image_name:latest`
- Push a specific image to a personal repo: `docker push username/image_name`
- Similarly for organiztion: `docker tag image_id organization_name/image_name:latest`
- `docker push organization_name/image_name:latest`