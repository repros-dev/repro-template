FROM cirss/repros-base:latest

COPY .repro .repro
ENV REPROS_BUILDER_RELEASE https://raw.githubusercontent.com/repros-dev/repros-builder/master/.repro/exported
ADD ${REPROS_BUILDER_RELEASE}/bootstrap .repro/
RUN bash .repro/bootstrap ${REPROS_BUILDER_RELEASE}

USER repro

CMD  /bin/bash -il
