# Docker SSH Container

## Proxy Container

**현재 작동되지 않는 이미지 입니다.**

```yml
  proxy:
    image: registry.gitlab.com/mireu-lab/docker-ssh-container:containernetwork
    restart: always
    container_name: Proxy-Container
    environment:
      - VIRTUAL_HOST=test2.container.mireu.xyz
      - ProxyURL=0.0.0.0
      - WebProxyPort=8080
    depends_on:
      - ubuntu_ssh
      - fedora_ssh
```

## Debian Container
```yml
  debian_ssh:
    image: registry.gitlab.com/mireu-lab/docker-ssh-container:containersshdebian
    restart: always
    container_name: SSH-Debian-Container
    volumes:
      - Container_SSH:/workspace
    ports:
      - "2201:22"
    depends_on:
      - datebase_mongo
      - datebase_mariadb
      - datebase_mysql
      - schema_redis
```

## Ubuntu Container
```yml
  ubuntu_ssh:
    image: registry.gitlab.com/mireu-lab/docker-ssh-container:containersshubuntu
    restart: always
    container_name: SSH-Ubuntu-Container
    volumes:
      - Container_SSH:/workspace
    ports:
      - "2202:22"
    depends_on:
      - datebase_mongo
      - datebase_mariadb
      - datebase_mysql
      - schema_redis
```

## Fedora Container

**해당 이미지는 작동되지 않는 이미지입니다.**

```yml
  fedora_ssh:
    image: registry.gitlab.com/mireu-lab/docker-ssh-container:containersshfedora
    restart: always
    container_name: SSH-Fedora-Container
    volumes:
      - Container_SSH:/workspace
    ports:
      - "2203:22"
    depends_on:
      - datebase_mongo
      - datebase_mariadb
      - datebase_mysql
      - schema_redis
```

## MongoDB Container
```yml
  datebase_mongo:
    image: mongo
    restart: always
    container_name: SSH-MongoDB
    volumes:
      - Container_Datebase_MongoDB:/data/db
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: SSH
```

## MariaDB Container
```yml
  datebase_mariadb:
    image: mariadb
    restart: always
    container_name: SSH-MariaDB
    volumes:
      - Container_Datebase_MariaDB:/var/lib/maria
    environment:
      MARIADB_ROOT_PASSWORD: SSH
```

## MySQL Container
```yml

  datebase_mysql:
    image: mysql
    restart: always
    container_name: SSH-MySQL
    command: --default-authentication-plugin=mysql_native_password
    volumes:
      - Container_Datebase_MySQL:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: SSH
```

## PostgresDB Container
```yml

detebase_postgres:
    image: postgres
    restart: always
    container_name: SSH-PostgresDB
    volumes:
      - Container_Datebase_PostgresDB:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: SSH
```

## Redis Container
```yml

  schema_redis:
    image: redis:alpine
    restart: always
    container_name: SSH-Redis
    command: redis-server --port 6379
    volumes:
      - Container_Schema_Redis:/data
    labels:
      - "name=redis"
      - "mode=standalone"
```

## Container Volume


SSH Container는 하나의 스토리지로 묶어 다른 컨테이너에서도 동작시킬수있게 구현하였다.


```yml
volumes:
  Container_SSH:
  Container_Datebase_MySQL:
  Container_Datebase_MariaDB:
  Container_Datebase_MongoDB:
  Container_Datebase_PostgresDB:
  Container_Schema_Redis:
```