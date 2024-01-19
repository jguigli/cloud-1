FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y \
	nginx 	\
	openssl \
	procps \
	&& openssl req -x509 -newkey rsa:2048 -sha256 -days 365 -nodes -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=jguigli.42.fr"

# certbot \

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
