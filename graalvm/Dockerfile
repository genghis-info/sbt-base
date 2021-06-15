ARG GRAALVM_VERSION=21.1.0

FROM ghcr.io/graalvm/graalvm-ce:${GRAALVM_VERSION}

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/genghis-info/sbt-base.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor="Genghis Info" \
      org.label-schema.schema-version="1.0.0-rc1"

ARG MUSL_VERSION="1.2.2"
ARG ZLIB_VERSION="1.2.11"
ARG PREFIX="/usr/local"

# Install native-image
RUN gu install native-image

# BEGIN PRE-REQUISITES FOR STATIC NATIVE IMAGES FOR GRAAL
# SEE: https://github.com/oracle/graal/blob/master/substratevm/StaticImages.md
RUN mkdir -p ${PREFIX} && \
    curl -L -o musl.tar.gz https://musl.libc.org/releases/musl-${MUSL_VERSION}.tar.gz && \
    mkdir musl && tar -xvzf musl.tar.gz -C musl --strip-components 1 && cd musl && \
    ./configure --disable-shared --prefix=${PREFIX} && \
    make && make install && \
    cp /usr/lib/gcc/x86_64-redhat-linux/8/libstdc++.a ${PREFIX}/lib/ && \
    cd .. && rm -rf musl musl.tar.gz
ENV CC="musl-gcc"
RUN curl -L -o zlib.tar.gz https://zlib.net/zlib-${ZLIB_VERSION}.tar.gz && \
    mkdir zlib && tar -xvzf zlib.tar.gz -C zlib --strip-components 1 && cd zlib && \
    ./configure --static --prefix=${PREFIX} && \
    make && make install && \
    cd .. && rm -rf zlib zlib.tar.gz
#END PRE-REQUISITES FOR STATIC NATIVE IMAGES FOR GRAAL

# Install sbt
ARG SBT_VERSION=1.5.4
RUN curl -fsL "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | tar xfz - -C /usr/share && \
    chown -R root:root /usr/share/sbt && \
    chmod -R 755 /usr/share/sbt && \
    ln -s /usr/share/sbt/bin/sbt /usr/bin/sbt

# Run SBT to download any required libraries
RUN sbt -Dsbt.rootdir=true sbtVersion