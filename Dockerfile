FROM openjdk:8-jre-alpine
RUN apk add --no-cache bash
ENV PATH "$PATH:/usr/local/sbt/bin"
ENV SBT_VERSION=1.2.8
RUN wget -qO - https://piccolo.link/sbt-${SBT_VERSION}.tgz | tar xz -C /usr/local

