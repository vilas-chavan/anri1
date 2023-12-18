FROM ubuntu:20.04
MAINTAINER vilaschavan80@gmail.com
ENV CONTAINER_TIMEZONE="Europe/Brussels"
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt update && apt install -y apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

RUN apt install -y zip
RUN apt install -y unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page266/active.zip  /var/www/html
WORKDIR /var/www/html
RUN unzip active.zip
RUN cp -rvf active/* .
RUN rm -rf active active.zip

#ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80
