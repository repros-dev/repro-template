# Reproducible-In-Place Provenance Objects (RIPPOs)

This repository provides a description and template for RIPPOs: *Reproducible-In-Place Provenance Objects*.

## What is a RIPPO?

A RIPPO is a version-controlled code/data repository that (a) demonstrates the validity of one or more computational processes and associated results; (b) provides within it the means to execute the processes to yield those results on one's own computer; (c) makes it easy to check that these processes and results match well-defined expectations; (d) does all of this in a transparent manner such that the computations performed can be confirmed to match the provided description.

## General requirements for RIPPOs

To qualify as a RIPPO a repository must meet these requirements:

1. The code in the repo must be runnable on any computer meeting some minimal hardware and software requirements for running RIPPOs generally. A RIPPO must not require that a particular operating system be used, no must it require installing additional software specific to the RIPPO. Simple RIPPOs that use this repo as a template require only that `Git`, `Docker`, and `GNU Make` be installed on the user's computer and will run on Linux, macOS, and Windows-based systems, among others.

2. Running the RIPPO should require nothing more than cloning the repository onto the local machine, and issuing a single command from a terminal session in the top-level directory of the cloned repository.

3. The contents and operation of a RIPPO should be transparent with respect to the computer on which it is running. The user of a RIPPO should be able to use the terminal, editors, web browsers, and other software tools already installed on the computer to interact with the running RIPPO, to modify the data or code in the RIPPO, and to inspect the code and data employed in the RIPPO.

## *Git-Docker-Make* RIPPOs

This repository provides a template for simple RIPPOs that require only that `Git`, `Docker`, and `GNU Make` be installed on a user's machine.  The essential components of a *Make-Docker RIPPO* are:

* A `Git` repository that provides any essential components of the RIPPO including code and data.

* A `Dockerfile` in the top-level directory of the repo that defines the computing environment required to run the code in the RIPPO.

* A `Makefile` in the top-level directory of the repo that provides targets for building and starting the RIPPO, for running the computations represented by the RIPPO, and for comparing the results of those computations against the expected results.

## What makes a RIPPO more than a Git repo and Docker image?

A key property of a *Git-Docker-Make* repo is that any `Make` target that starts the RIPPO docker container must mount the repository cloned on the user's computer at a predefined location within the running container, and must perform all of its work within the directory tree under this mount point.

The RIPPO convention is that the clone of the `<reponame>` repository on the user's computer is mounted under the `/mnt/<reponame>` directory within the container.  All products of computations performed in the container are stored under this mount point and so can be accessed from outside the container both while the container is running, and after the container is stopped.



