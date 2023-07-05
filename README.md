# Docker SSH Conteiner



## Ubuntu Build

> Docker Run
```
# Docker Build
docker pull registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gpuubuntusshcontainer

# Docker Run
docker run -p 22:22 registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gpuubuntusshcontainer
```


> Docker-Compose
```yml
api:
    image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:gpuubuntusshcontainer
    restart: always
    container_name: Hosting-SSH-Container
    ports:
    - 2200:22
```