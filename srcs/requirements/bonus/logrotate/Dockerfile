FROM debian:buster

RUN	apt update -y && apt upgrade -y && apt install -y \
	logrotate \
	cron \
	nano \
	procps

COPY conf/logrotate.conf /etc/logrotate.d/
COPY conf/logrotate-job /etc/cron.d/logrotate-job

RUN chmod 644 /etc/cron.d/logrotate-job \
	&& crontab /etc/cron.d/logrotate-job

ENTRYPOINT ["cron", "-f"]