ARG JDK_VERSION=8

FROM "adoptopenjdk/openjdk$JDK_VERSION:alpine"

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/genghis-info/sbt-base.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor="Genghis Info" \
      org.label-schema.schema-version="1.0.0-rc1"

RUN apk add --no-cache bash

ARG SBT_VERSION=1.5.2
RUN wget -qO - "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar xz -C /usr/share && \
    chown -R root:root /usr/share/sbt && \
    chmod -R 755 /usr/share/sbt && \
    ln -s /usr/share/sbt/bin/sbt /usr/bin/sbt

# Run SBT to download any required libraries
RUN sbt -Dsbt.rootdir=true sbtVersion
