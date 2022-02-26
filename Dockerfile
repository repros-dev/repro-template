FROM ubuntu:22.04

ENV REPRO_NAME  repro-template

COPY .repro .repro
RUN bash .repro/bootstrap

USER repro

CMD  /bin/bash -il
