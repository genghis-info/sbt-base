# SBT-BASE

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yangcheng2503/sbt-base)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/yangcheng2503/sbt-base)
![Docker Pulls](https://img.shields.io/docker/pulls/yangcheng2503/sbt-base)

A series of personal sbt docker images for Scala.

Based on [adoptopenjdk](https://hub.docker.com/u/adoptopenjdk) images. Support 2 kinds of base OS: Ubuntu and Alpine

Using [Label Schema](http://label-schema.org/) to provide metadata for images.

## Availiable Tags

_FYI: Please don't use sbt lower than 1.5.1 anymore! Since bintray has shutdown, previous sbt versions cannot fetch required libraries from bintray._

- **1.2.8-jdk8**: sbt version 1.2.8, with the latest Openjdk8, based on Ubuntu.
- **1.2.8-jdk8-alpine**:  sbt version 1.2.8, with the latest Openjdk8, base on Alpine.
- **1.2.8-jdk11**: sbt version 1.2.8, with the latest Openjdk11, based on Ubuntu.
- **1.2.8-jdk11-alpine**:  sbt version 1.2.8, with the latest Openjdk11, base on Alpine.
- **1.3.13-jdk8**: sbt version 1.3.13, with the latest Openjdk8, based on Ubuntu.
- **1.3.13-jdk8-alpine**:  sbt version 1.3.13, with the latest Openjdk8, base on Alpine.
- **1.3.13-jdk11**: sbt version 1.3.13, with the latest Openjdk11, based on Ubuntu.
- **1.3.13-jdk11-alpine**:  sbt version 1.3.13, with the latest Openjdk11, base on Alpine.
- **1.4.9-jdk8**: sbt version 1.4.9, with the latest Openjdk8, based on Ubuntu.
- **1.4.9-jdk8-alpine**:  sbt version 1.4.9, with the latest Openjdk8, base on Alpine.
- **1.4.9-jdk11**: sbt version 1.4.9, with the latest Openjdk11, based on Ubuntu.
- **1.4.9-jdk11-alpine**:  sbt version 1.4.9, with the latest Openjdk11, base on Alpine.
- **1.5.2-jdk8**: sbt version 1.5.2, with the latest Openjdk8, based on Ubuntu.
- **1.5.2-jdk8-alpine**:  sbt version 1.5.2, with the latest Openjdk8, base on Alpine.
- **1.5.2-jdk11**: sbt version 1.5.2, with the latest Openjdk11, based on Ubuntu.
- **1.5.2-jdk11-alpine**:  sbt version 1.5.2, with the latest Openjdk11, base on Alpine.

## Auto Build

This repo has been linked with Docker Hub, so will be built if any changes commit.

Using hooks to give some dynamic parameters when building. Like `org.label-schema.build-date` and `org.label-schema.vcs-ref`.

## Local Build

#### Requirement

- Docker has been installed.

#### Build command:

_FYI: You can ignore the `--build-arg` if you don't care about labels._

For Ubuntu image:

```shell
    $> docker build --build-arg VCS_REF=<COMMIT_HASH> --build-arg BUILD_DATE=<RFC3339_TIME> ./ubuntu
```

For Alpine image:

```shell
    $> docker build --build-arg VCS_REF=<COMMIT_HASH> --build-arg BUILD_DATE=<RFC3339_TIME> ./alpine
```
