FROM nginx:latest
ENV TZ=Asia/Bangkok
ENV NGINX_DOCUMENT_ROOT=/usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf 
COPY default.conf.template /etc/nginx/templates/default.conf.template
RUN sed -ri -e 's|MinProtocol = TLSv1.2|MinProtocol = TLSv1.0|g' "/etc/ssl/openssl.cnf"
RUN apt-get update && apt-get -y install apt-transport-https wget nano cron iputils-ping
RUN TEST