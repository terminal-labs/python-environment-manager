FROM circleci/buildpack-deps:18.04

COPY ./scripts/* /scripts/

USER root

RUN apt update
RUN bash /scripts/install_apt_dependencies.sh

USER circleci
