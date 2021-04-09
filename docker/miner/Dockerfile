FROM passive:local

ARG USER_HOME="/root"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}/${MANTIS_DIST}/conf
RUN sed -i "s/mining-enabled = false/mining-enabled = true/g" pottery.conf
