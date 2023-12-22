FROM debian:buster

RUN	apt update -y && apt upgrade -y && apt install -y \
	redis-server \
	redis\
	procps

COPY conf/init.sh init.sh

RUN	chmod +x init.sh

EXPOSE 6379

ENTRYPOINT ["./init.sh"]
