FROM nginx:latest

COPY proxy.conf /etc/nginx/sites-available/default

EXPOSE 2222
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]