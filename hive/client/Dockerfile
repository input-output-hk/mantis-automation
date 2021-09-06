FROM ubuntu:groovy

RUN apt update --fix-missing
RUN apt install -y net-tools fish iputils-ping tcpdump sudo telnet git curl wget vim unzip gnupg jq
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt-get update
RUN apt-get install sbt
RUN adduser --quiet --gecos "" --disabled-password ubuntu
#RUN echo "ubuntu     ALL=(ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo
#RUN runuser -l ubuntu -c 'wget https://github.com/numtide/nix-flakes-installer/releases/download/nix-3.0pre20200804_ed52cf6/install'
#RUN runuser -l ubuntu -c 'sh < install'

RUN apt install -y openjdk-11-jdk

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

ADD mantis.sh /mantis.sh
RUN chmod +x /mantis.sh

ADD mapper.jq /mapper.jq

ADD enode.sh /enode.sh
RUN chmod +x /enode.sh

ADD genesis.json /genesis.json

EXPOSE 8545 30303 30303/udp

#Remove in production
ADD setup_env.sh /setup_env.sh
#

ENTRYPOINT ["/mantis.sh"]
