FROM cirss/repro-builder-base:latest

ENV REPROS_DEV_BRANCH 'https://raw.githubusercontent.com/repros-dev/${1}/${2}/exports'
ENV REPROS_DEV_RELEASE 'https://github.com/repros-dev/${1}/releases/download/v${2}/'
ENV CIRSS_BRANCH 'https://raw.githubusercontent.com/cirss/${1}/${2}/exports'
ENV CIRSS_RELEASE 'https://github.com/cirss/${1}/releases/download/v${2}/'

ENV REPRO_RELEASE https://raw.githubusercontent.com/repros-dev/repro/master/exports
ADD ${REPRO_RELEASE}/setup-boot /repro/release/
RUN bash /repro/release/setup-boot ${REPRO_RELEASE}

USER repro

RUN repro.require repro master ${REPROS_DEV_BRANCH}

CMD  /bin/bash -il
