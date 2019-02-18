FROM debian:jessie
MAINTAINER Glenn Engelen <glenn@roxorstudios.com>

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install \
apache2 php5 php5-mysql php5-mcrypt php5-memcache php5-curl php5-memcached php5-apcu php5-gd zip mcrypt ssmtp
RUN apt-get clean

ADD systemfiles/php.ini /etc/php5/apache2/php.ini
ADD systemfiles/apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN \
a2enmod headers && \
a2enmod rewrite && \
a2enmod expires

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
