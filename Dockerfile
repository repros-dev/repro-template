FROM cirss/repros-base:latest

ENV REPROS_DEV_BRANCH 'https://raw.githubusercontent.com/repros-dev/${1}/${2}/.repro/exported'
ENV REPROS_DEV_RELEASE 'https://github.com/repros-dev/${1}/releases/download/v${2}/'
ENV CIRSS_BRANCH 'https://raw.githubusercontent.com/cirss/${1}/${2}/.repro/exported'
ENV CIRSS_RELEASE 'https://github.com/cirss/${1}/releases/download/v${2}/'

COPY .repro .repro
ENV REPROS_BUILDER_RELEASE https://raw.githubusercontent.com/repros-dev/repros-builder/master/.repro/exported
ADD ${REPROS_BUILDER_RELEASE}/bootstrap .repro/
RUN bash .repro/bootstrap ${REPROS_BUILDER_RELEASE}

USER repro

CMD  /bin/bash -il
