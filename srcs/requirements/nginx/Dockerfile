FROM debian:buster

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install nginx openssl && \
	mkdir -p /etc/ssl && \
	openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/ST=Lyon/L=Lyon/O=42Lyon/OU=dso/CN=dso.42.fr" -keyout /etc/ssl/dso.42.fr.key -out /etc/ssl/dso.42.fr.pem

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY script/setup.sh .

RUN chmod +x setup.sh

EXPOSE 443

ENTRYPOINT ["sh", "/setup.sh"]