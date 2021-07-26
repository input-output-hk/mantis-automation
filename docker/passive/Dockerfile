FROM java11:local

ARG USER_HOME="/root"
ARG MANTIS="mantis"
ARG MANTIS_GIT_URL="https://github.com/input-output-hk/mantis.git"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}
RUN git clone ${MANTIS_GIT_URL}
WORKDIR ${USER_HOME}/${MANTIS}
RUN git checkout origin/develop
RUN git submodule update --recursive --init
RUN sbt dist

WORKDIR ${USER_HOME}/${MANTIS}/target/universal
RUN unzip mantis-*.zip
RUN rm mantis-*.zip
RUN mv mantis* ${USER_HOME}/${MANTIS_DIST}

ADD provisioning/prometheus /etc/prometheus
