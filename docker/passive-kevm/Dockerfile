FROM passive:local

ADD kevm-vm /usr/bin/kevm-vm

ARG USER_HOME="/root"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}/${MANTIS_DIST}/conf
RUN sed -i "s/mining-enabled = true/mining-enabled = false/g" pottery.conf
RUN sed -i "s/restricted-pow/pow/g" pottery.conf
RUN sed -i 's/mode = "internal"/mode = "external"/g' pottery.conf
RUN sed -i 's/vm-type = "mantis"/vm-type = "kevm"/g' pottery.conf
RUN sed -i 's|executable-path = "./bin/manits-vm"|executable-path = "/usr/bin/kevm-vm"|g' pottery.conf
RUN sed -i 's|8888|8889|g' pottery.conf
RUN sed -i 's|@bootstrap-|@bootstrap-mining-kevm-|g' chains/pottery-chain.conf

