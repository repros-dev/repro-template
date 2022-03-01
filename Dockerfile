FROM ubuntu:22.04

COPY .repro .repro
ADD https://github.com/CIRSS/repro-builder/releases/download/v0.1.0/builder .repro/
RUN bash .repro/builder

USER repro

CMD  /bin/bash -il
