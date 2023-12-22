FROM debian:buster

RUN	apt update -y && apt upgrade -y && apt install -y \
	vsftpd \
	procps

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY conf/init.sh /
RUN chmod +x init.sh

RUN mkdir -p /var/run/vsftpd/chroot

EXPOSE 21

ENTRYPOINT ["./init.sh"]