FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y rsyslog
RUN apt-get install -y postfix
RUN apt-get install -y libsasl2-modules
RUN apt-get install -y ca-certificates
ADD ./docker/postfix/scripts/configure.sh /configure.sh
RUN ["chmod", "+x", "/configure.sh"]
EXPOSE 25
CMD /configure.sh
