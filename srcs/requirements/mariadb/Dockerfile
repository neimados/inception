
FROM debian:buster

COPY ./tools/db.sh /db.sh

EXPOSE 3306

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y mariadb-server mariadb-client && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && \
	chmod +x db.sh

RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["sh", "/db.sh"]