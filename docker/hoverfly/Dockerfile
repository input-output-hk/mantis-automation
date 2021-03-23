FROM chrisatiohk/base
WORKDIR /root
RUN mkdir hoverfly
ADD hoverfly_bundle_linux_amd64.zip /root/hoverfly
ADD start_hoverfly.sh /root/hovefly/
WORKDIR /root/hoverfly
RUN unzip hoverfly_bundle_linux_amd64.zip
