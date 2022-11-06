# Docker SSH Conteiner



## Setup Program

> Setup
    `vim nano curl wget openssh-server`

> Programing Language
    `C, Cpp, Nodejs, Python`





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





## Debian Build

> Docker Run
    ```
    # Docker Build
    docker build registry.gitlab.com/mireu-lab/docker-ssh-conteiner:debian

    # Docker Run
    docker run -p 22:22 -e USERID="sample" registry.gitlab.com/mireu-lab/docker-ssh-conteiner:debian
    ```


> Docker-Compose
    ```yml
    api:
        image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:debian
        restart: always
        container_name: Hosting-SSH-Container
        ports:
        - 22:22
    ```





## Fedora Build

> Docker Run
    ```
    # Docker Build
    docker build registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedora

    # Docker Run
    docker run -p 22:22 -e USERID="sample" registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedora
    ```


> Docker-Compose
    ```yml
    api:
        image: registry.gitlab.com/mireu-lab/docker-ssh-conteiner:fedora
        restart: always
        container_name: Hosting-SSH-Container
        ports:
        - 22:22
    ```