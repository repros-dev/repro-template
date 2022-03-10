FROM cirss/repro-base:latest

COPY .repro .repro
ENV BUILDERS_RELEASE https://raw.githubusercontent.com/repros-dev/repro-builders/master/.repro/exported
ADD ${BUILDERS_RELEASE}/bootstrap .repro/
RUN bash .repro/bootstrap ${BUILDERS_RELEASE}

USER repro

CMD  /bin/bash -il
