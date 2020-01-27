FROM openjdk:8-jdk-alpine
ENV SBT_VERSION=1.2.8
RUN mkdir /usr/local/sbt
RUN wget https://piccolo.link/sbt-${SBT_VERSION}.tgz
RUN tar x -z -f sbt-${SBT_VERSION}.tgz -C /usr/local/sbt
RUN export PATH="$PATH:/usr/local/sbt/bin"
RUN sbt sbtVersion
