# Docker SSH Conteiner



## Tensorflow Build

> Docker Run
```
# Docker Build
docker pull registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gputensorflowsshcontainer

# Docker Run
docker run -p 22:22 registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gputensorflowsshcontainer
```


> Docker-Compose
```yml
api:
    image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gputensorflowsshcontainer
    restart: always
    container_name: Hosting-SSH-Container
    ports:
    - 2200:22
```
