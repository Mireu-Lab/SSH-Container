# Docker SSH Conteiner



## Ubuntu Build

> Docker Run
    ```
    # Docker Build
    docker build registry.gitlab.com/mireu-lab/docker-ssh-conteiner:ubuntu

    # Docker Run
    docker run -p 22:22 -e USERID="sample" registry.gitlab.com/mireu-lab/docker-ssh-conteiner:ubuntu
    ```


> Docker-Compose
    ```yml
    api:
        image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:ubuntu
        restart: always
        container_name: Hosting-SSH-Container
        ports:
        - 22:22
    ```