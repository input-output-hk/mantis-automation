FROM ubuntu:groovy

RUN apt update --fix-missing
RUN apt install -y net-tools fish iputils-ping tcpdump sudo telnet git curl wget vim unzip gnupg golang

ADD . /obft
WORKDIR /obft
RUN go build

ENTRYPOINT ["/obft/obft-simulator"]
