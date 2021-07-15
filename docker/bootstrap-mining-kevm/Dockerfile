FROM passive:local

ADD node.key /root/.mantis/pottery/node.key
ADD full-R23-0000000000000000 /root/.ethash/full-R23-0000000000000000
ADD kevm-vm /bin/kevm-vm

ARG USER_HOME="/root"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}/${MANTIS_DIST}/conf
RUN sed -i "s/mining-enabled = false/mining-enabled = true/g" pottery.conf
RUN sed -i 's/mode = "internal"/mode = "external"/g' pottery.conf
RUN sed -i 's/vm-type = "mantis"/vm-type = "kevm"/g' pottery.conf
RUN sed -i 's|executable-path = "./bin/manits-vm"|executable-path = "/bin/kevm-vm"|g' pottery.conf
RUN sed -i 's|@bootstrap-|@bootstrap-mining-kevm-|g' chains/pottery-chain.conf

