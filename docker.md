# `docker`
Reference: [Dockerbook](https://www.dockerbook.com/)

### `list`
- List all running containers: `docker ps -a`
  - `-a`: lists all containers
  - `-l`: shows the last container launched
- Show the last x containers: `docker ps -n x`
- Show container's port: `docker port <container_name>`

### `run`
- Run a container in shell: `docker run -i -t <image_name> /bin/bash` - only runs for as long as the command we specied
- Name a container `docker run --name <container_name> -i -t <image_name> /bin/bash`
- Start a stopped cdontainer: `docker start <container_name>`
- Stop a container: `docker stop <container_name>`
- Attach to a running container: `docker attach <container_name>`
- Create a long running container: `docker run --name <container_name> -d <image_name> /bin/sh -c "while true; do echo hello world; sleep 1; done"`

### `delete`
- Detele a container: `docker rm <container_name>`
- Stop all containers: `docker stop $(docker ps -aq)`
  - `-q`: only returns the container IDs
  - `-f`: force removes any running containers
- Remove all containers: `docker rm $(docker ps -aq)`
- Remove all images: `docker rmi -f $(docker images -q)`

### `logs`
- Fetch the logs: `docker logs <container_name>`
- Tail the logs: `docker logs -f <container_name>`	
- Get the last 10 lines:`docker logs --tail 10 <container_name>`
- Follow the logs: `docker logs --tail 0 -f <container_name>`
- Add timestamp: `docker logs -ft <container_name>`

### `process`
- Inspect the process: `docker top <container_name>`
- Show statistics: `docker stats <container_name>`
- Running a background task inside a container: `docker exec -d <container_name> touch /etc/new_config_file`
- Running an interactive command inside a container: `docker exec -t -i <container_name> /bin/bash`

### `restart`
- `docker run --restart=always --name <container_name> -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"`
  - `always`: restarts the container no matter what exit code is returned
  - `on-failure`: restarts the container if it exits with a non-zero exit code
  - `on-failure:5`: restart the container a maximum of five times

### `inspect` 
- `docker inspect <container_name>`
  - State: `docker inspect --format='{{ .State.Running }}' <container_name>`
  - IP address: `docker inspect --format '{{ .NetworkSettings.IPAddress }}' <container_name>`
  - Multiple containers: `docker inspect --format '{{.Name}} {{.State.Running}}' <container_name_1> <container_name_2>` 
  - Health status: `docker inspect --format '{{.State.Health.Status}}' <container_name>`

### `images`
- List all images: `docker images`
- Pull an image: `docker pull <image_name>`
- Run a tagged image: `docker run -t -i --name <container_name> <image_name>:tag_number /bin/ bash`
- Search for an image: `docker search <image_name>`
- Login and logout to Docker Hub: `docker login` & `docker logout`

### `build`
- Build an image from Dockerfile: `docker build -t="<username>/<image_name>" .`
  - `-t`: mark our resulting image with a repository and a name
  - `.`: tlook in the local directory to to find the Dockerfile
  - default tag is `latest`
- Tag a build: `docker build -t="<username>/<image_name>:v1" .`
- Bypass the build cache: `docker build --no-cache -t="<username>/<image_name>" .`
- Show history: `docker history <image_name>`

### `run`
- `docker run -d -p 80 --name static_web <username>/static_web nginx -g "daemon off;"`
  - `-d`: runs detached in the background
  - `nginx -g "daemon off;"`: launches Nginx in the foreground to run our web server
  - `-p`: manages which network ports Docker publishes at runtime
- Bind port from the container to local host's:
  - 80 -> 8080: `docker run -d -p 8080:80 --name <container_name> <username>/<image_name> nginx -g "daemon off;"`
  - 80 -> 127.0.0.1's random port: `docker run -d -p 127.0.0.1::80 --name <container_name> <username>/<image_name> nginx -g "daemon off;"`
  - 80 -> 127.0.0.1:80: `docker run -d -p 127.0.0.1:80:80 --name <container_name> <username>/<image_name> nginx -g "daemon off;"`
  - Publish a random port and any additional ports we've specified in Dockerfile: `docker run -d -P --name <container_name> <username>/<image_name> nginx -g "daemon off;"`
- Run unless stop: `docker run -dit -p 5000:5000 --restart unless-stopped <container_name>`

### `Dockerfile`
- `CMD`: species the command to run when a container is launched
  - `CMD ["/bin/true"]`
  - Passing a parametter: `CMD ["/bin/bash", "-l"]`
  - Can only specify one `CMD`. If more than one is specied, then the last `CMD` will be used.

- `ENTRYPOINT`: any arguments we specify on the `docker run` command line will be passed as arguments to the command specied in the `ENTRYPOINT`
  - `ENTRYPOINT ["/usr/sbin/nginx"]`
  - Specify a parameter: `ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]`
  - Can also combine `ENTRYPOINT` and `CMD` to do some neat things.
    - `ENTRYPOINT ["/usr/sbin/nginx"]`
    - `CMD ["-h"]`
    - If we run `sudo docker run -t -i <username>/<image_name> -g "daemon off;"` then `-g "daemon off;"` will be pass to the `ENTRYPOINT` and `-h` is passed by the `CMD` and returns the Nginx help text: `/usr/sbin/nginx -h.`

- `WORKDIR`: provides a way to set the working directory for the container and the `ENTRYPOINT` and/or `CMD` to be executed when a container is launched from the image
  - `WORKDIR /opt/webapp/db`
  - `RUN bundle install`
  - `WORKDIR /opt/webapp`
  - `ENTRYPOINT [ "rackup" ]`

- `ENV`: set environment variables during the image build process
  - `ENV RVM_PATH /home/rvm/` then `RUN gem install unicorn` would be executed as `RVM_PATH=/home/rvm/ gem install unicorn`

- `USER`: species a user that the image should be run as
  - `USER nginx`

- `VOLUME`: adds volumes to any container created from the image
  - `VOLUME ["/opt/project"]`
  - Multiple volumnes: `VOLUME ["/opt/project", "/data" ]`

- `ADD`: adds files and directories from our build environment into our image
  - Copy software.lic from the build directory to /opt/application/software.lic in the image: `ADD software.lic /opt/application/software.lic`

- `COPY`: purely focuses on copying local files from the build context and does not have any extraction or decompression capabilities
  - Copy files from the conf.d directory to the /etc/apache2/ directory: `COPY conf.d/ /etc/apache2/`

- `LABEL`: adds metadata to a Docker image
  - `LABEL version="1.0"`
  - `LABEL location="New York" type="Data Center" role="Web Server"`

- `STOPSIGNAL`: sets the system call signal that will be sent to the container when you tell it to stop
- `ARG`: defines variables that can be passed at build-time via the docker build command
- Done by using the `--build-arg` flag

- - `ARG build`
  - `ARG webapp_user=user`
  - `docker build --build-arg build=1234 -t <username>/webapp .`
  - Predefined variables:
    - HTTP_PROXY
    - FTP_PROXY
    - NO_PROXY

- `SHELL`: allows the default shell used for the shell form of commands to be overridden.
  - Default shell on Linux is `["/bin/sh", "-c"]`

- `HEALTHCHECK`: tells Docker how to test a container to check that it is still working correctly
  - `HEALTHCHECK --interval=10s --timeout=1m --retries=5 CMD curl http ://localhost || exit 1`

- `ONBUILD`: adds triggers to images
  - `ONBUILD ADD . /app/src`
  - `ONBUILD RUN cd /app/src; make`

### `docker hub`
- Tag a specific image: `docker tag <image_id> <username>/<image_name>:latest`
- Push a specific image to a personal repo: `docker push <username>/<image_name>`
- Similarly for organiztion: `docker tag <image_id> <organization_name>/<image_name>:latest`
- `docker push <organization_name>/<image_name>:latest`