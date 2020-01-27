FROM openjdk:8-jre-alpine
ENV SBT_VERSION=1.2.8
RUN wget https://piccolo.link/sbt-${SBT_VERSION}.tgz
RUN tar x -z -f sbt-${SBT_VERSION}.tgz -C /usr/local
ENV PATH "$PATH:/usr/local/sbt/bin"
RUN apk add --no-cache bash

