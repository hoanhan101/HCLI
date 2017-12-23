### `stop` & `remove` all
- Stop all containers: `docker stop $(docker ps -aq)`
- Remove all containers: `docker rm $(docker ps -aq)`
- Remove all images: `docker rmi -f $(docker images -q)`

### `build` | `run`
- Build an image: `docker build -t image_name:latest .` 
- Run a container: `docker run -d -p 5000:5000 image_name`
- Run unless stop: `docker run -dit -p 5000:5000 --restart unless-stopped app_name`

### docker hub
- List all images: `docker images`
- Tag a specific image: `docker tag image_id username/image_name:latest`
- Push a specific image to a personal repo: `docker push username/image_name`
- Similarly for organiztion: `docker tag image_id organization_name/image_name:latest`
- `docker push organization_name/image_name:latest`

### `pull`
- `docker pull organization_name/app_name`
- `docker run -d -p organization_name/app_name`

### Execute in bash
- List all running containers: `docker ps -a`
- Execute in bash: `docker exec -ti container_name /bin/bash`

### Log
- `docker logs container_name`
