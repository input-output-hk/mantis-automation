FROM passive:local

RUN runuser -l ubuntu -c ". .nix-profile/etc/profile.d/nix.sh && nix build 'github:input-output-hk/mantis?rev=a2ddacb63b2ace46c1800bdae95ae10e54921ab0#kevm' --experimental-features 'flakes nix-command' --substituters https://hydra.mantis.ist --trusted-public-keys 'hydra.mantis.ist-1:4LTe7Q+5pm8+HawKxvmn2Hx0E3NbkYjtf1oWv+eAmTo='"
RUN mv /home/ubuntu/result/bin/kevm-vm /usr/bin/kevm-vm

ARG USER_HOME="/root"
ARG MANTIS_DIST="mantis-dist"

WORKDIR ${USER_HOME}/${MANTIS_DIST}/conf
RUN sed -i "s/mining-enabled = true/mining-enabled = false/g" pottery.conf
RUN sed -i "s/restricted-pow/pow/g" pottery.conf
RUN sed -i 's/mode = "internal"/mode = "external"/g' pottery.conf
RUN sed -i 's/vm-type = "mantis"/vm-type = "kevm"/g' pottery.conf
RUN sed -i 's|executable-path = "./bin/mantis-vm"|executable-path = "/usr/bin/kevm-vm"|g' pottery.conf
RUN sed -i 's|8888|8889|g' pottery.conf
RUN sed -i 's|@bootstrap-|@bootstrap-mining-kevm-|g' chains/pottery-chain.conf
RUN sed -i 's|"gasLimit": "0x7A1200"|"gasLimit": "0x1E84800"|g' chains/pottery-genesis.json

