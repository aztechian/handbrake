FROM ubuntu:16.04
MAINTAINER Ian Martin <ian@imartin.net>

ENV DISPLAY :0
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial universe \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates universe \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse \
  deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates multiverse" >> /etc/apt/sources.list && \
  echo 'deb http://ppa.launchpad.net/heyarje/makemkv-beta/ubuntu xenial main' > /etc/apt/sources.list.d/makemkv.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8540356019f7e55b && \
  apt-get update && \
  apt-get install -yq makemkv-oss makemkv-bin curl

COPY run.sh /usr/bin/
RUN mkdir /rips
VOLUME /rips

ENTRYPOINT ["run.sh"]
CMD ["--progress=-stdout", "--robot", "disc:0", "/rips"]

