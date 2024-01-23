FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y \
	nginx 	\
	openssl \
	procps

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
