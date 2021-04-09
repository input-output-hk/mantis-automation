FROM ubuntu:groovy

RUN apt update --fix-missing
RUN apt install -y net-tools fish iputils-ping tcpdump nix-bin telnet git curl wget vim unzip gnupg
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt update
RUN apt install sbt
