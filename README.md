# Docker SSH Conteiner




## Fedora Build

> Docker Run
```
# Docker Build
docker pull registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedorasshcontainer

# Docker Run
docker run -p 22:22 -e USERID="sample" registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedorasshcontainer
```


> Docker-Compose
```yml
api:
    image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedorasshcontainer
    restart: always
    container_name: Hosting-SSH-Container
    ports:
    - 22:22
```