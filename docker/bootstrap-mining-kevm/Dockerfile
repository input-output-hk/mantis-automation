FROM passive-kevm:local

ADD node.key /root/.mantis/pottery/node.key
ADD full-R23-0000000000000000 /root/.ethash/full-R23-0000000000000000

ARG USER_HOME="/root"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}/${MANTIS_DIST}/conf
RUN sed -i "s/mining-enabled = false/mining-enabled = true/g" pottery.conf
RUN sed -i "s/restricted-pow/pow/g" pottery.conf
RUN sed -i 's/mode = "internal"/mode = "external"/g' pottery.conf
RUN sed -i 's/vm-type = "mantis"/vm-type = "kevm"/g' pottery.conf
RUN sed -i 's|executable-path = "./bin/mantis-vm"|executable-path = "/usr/bin/kevm-vm"|g' pottery.conf
RUN sed -i 's|8888|8889|g' pottery.conf
RUN sed -i 's|@bootstrap-|@bootstrap-mining-kevm-|g' chains/pottery-chain.conf

