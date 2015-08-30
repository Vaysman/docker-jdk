FROM ubuntu:latest

MAINTAINER mikhail.vaysman@gmail.com

RUN apt-get install -y curl ca-certificates

ENV JAVA_HOME /usr/jdk1.7.0_79

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/GeoTrust_Global_CA.pem \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && ln -s $JAVA_HOME /usr/java \
    && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man

ENV PATH ${PATH}:${JAVA_HOME}/bin

ENTRYPOINT [ "java" ]
CMD [ "-fullversion" ]
