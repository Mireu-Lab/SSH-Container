# Docker SSH Container Proxy

```yml
version: '3.4'

services:
  proxy:
    build: proxy
    restart: always
    container_name: Hosting-Container-SSH-Proxy
    environment:
        - VIRTUAL_HOST=test2.container.mireu.xyz
        - ProxyURL=test2.container.mireu.xyz
        - WebProxyPort=8080
        - SSHProxyPort=2020

networks:
  default:
    external:
      name: Container_Proxy_Network
```