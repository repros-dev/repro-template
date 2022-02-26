FROM ubuntu:22.04

ENV REPRO_NAME  repro-template
COPY .repro-builder .repro-builder
RUN bash .repro-builder/bootstrap
USER repro

CMD  /bin/bash -il
