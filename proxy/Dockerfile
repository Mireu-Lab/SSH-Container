FROM nginx:latest

# RUN echo stream "stream {include /etc/nginx/conf.d/stream;}" >> /etc/nginx/nginx.conf
COPY proxy.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
# CMD ["cat", "/etc/nginx/nginx.conf"]
