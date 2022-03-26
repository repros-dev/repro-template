FROM cirss/repro-builder-base:latest

ENV REPROS_DEV_BRANCH 'https://raw.githubusercontent.com/repros-dev/${1}/${2}/.repro/exported'
ENV REPROS_DEV_RELEASE 'https://github.com/repros-dev/${1}/releases/download/v${2}/'
ENV CIRSS_BRANCH 'https://raw.githubusercontent.com/cirss/${1}/${2}/.repro/exported'
ENV CIRSS_RELEASE 'https://github.com/cirss/${1}/releases/download/v${2}/'

ENV REPRO_BUILDER_RELEASE https://raw.githubusercontent.com/repros-dev/repro-builder/master/.repro/exported
ADD ${REPRO_BUILDER_RELEASE}/bootstrap .repro/
RUN bash .repro/bootstrap ${REPRO_BUILDER_RELEASE}

USER repro

RUN repro.require repro-builder master ${REPROS_DEV_BRANCH}

CMD  /bin/bash -il
