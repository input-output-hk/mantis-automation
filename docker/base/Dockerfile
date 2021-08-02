FROM ubuntu:groovy

RUN apt update --fix-missing
RUN apt install -y net-tools fish iputils-ping tcpdump sudo telnet git curl wget vim unzip gnupg
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt-get update
RUN apt-get install sbt
RUN adduser --quiet --gecos "" --disabled-password ubuntu
RUN echo "ubuntu     ALL=(ALL) NOPASSWD:ALL" | EDITOR='tee -a' visudo
RUN runuser -l ubuntu -c 'wget https://github.com/numtide/nix-flakes-installer/releases/download/nix-3.0pre20200804_ed52cf6/install'
RUN runuser -l ubuntu -c 'sh < install'
