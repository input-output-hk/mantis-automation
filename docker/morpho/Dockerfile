FROM chrisatiohk/base

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update
RUN nix-env -iA nixpkgs.nixFlakes
RUN nix-env -iA nixpkgs.git
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

RUN echo "substituters = https://hydra.mantis.ist https://cache.nixos.org/" >> /etc/nix/nix.conf
RUN echo "trusted-substituters = https://hydra.mantis.ist https://cache.nixos.org/" >> /etc/nix/nix.conf
RUN echo "trusted-public-keys = hydra.mantis.ist-1:4LTe7Q+5pm8+HawKxvmn2Hx0E3NbkYjtf1oWv+eAmTo= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" >> /etc/nix/nix.conf

ARG USER_HOME="/root"
ARG MORPHO="ECIP-Checkpointing"
ARG MORPHO_GIT_URL="https://github.com/input-output-hk/ECIP-Checkpointing.git"

WORKDIR ${USER_HOME}
RUN git clone ${MORPHO_GIT_URL}
WORKDIR ${USER_HOME}/${MORPHO}
RUN git checkout rpc
RUN nix-build
