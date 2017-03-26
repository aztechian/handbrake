FROM ubuntu:16.04
MAINTAINER Ian Martin <ian@imartin.net>

ENV DISPLAY :0
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial universe \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -yq lsdvd dvdbackup libdvd-pkg && \
  dpkg-reconfigure libdvd-pkg

RUN mkdir /rips
VOLUME /rips

ENTRYPOINT ["dvdbackup", "-p", "-v"]
CMD ["-M", "-i", "/dev/dvd", "-o", "/rips"]

