# Docker SSH Conteiner




## CentOS Build

> Docker Run
```
# Docker Build
docker pull registry.gitlab.com/mireu-lab/docker-ssh-conteiner:centossshcontainer

# Docker Run
docker run -p 2200:22 registry.gitlab.com/mireu-lab/docker-ssh-conteiner:centossshcontainer
```


> Docker-Compose
```yml
api:
    image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:centossshcontainer
    restart: always
    container_name: Hosting-SSH-Container
    ports:
    - 2200:22
```