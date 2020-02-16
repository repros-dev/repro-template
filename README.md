# Reproducible-In-Place Provenance Object

This repository provides a template for RIPPOs:  *Reproducible-In-Place Provenance Objects*.

## What is a RIPPO?

A RIPPO is a version-controlled code/data repository that (a) demonstrates the validity of one or more computational processes and results, (b) provides within it the means to execute the processes to yield those results on one's own computer, (c) makes it easy to check that processes and results match well-defined expectations, (d) does all of this in a transparent manner such that the processes can be confirmed to match the provided description.

## General requirements for RIPPOs:

To qualify as a RIPPO a repository must meet these requirements:

1. The code in the repo must be runnable on any computer meeting some minimal hardware and software requirements for runnings RIPPOs generally.  It must not be necessary to install any additional software specific to the RIPPO. A simple RIPPO might require that GNU Make and Docker be installed.

2. Running the RIPPO should require nothing more than cloning the repository onto the local machine, and issuing a single command from a terminal session in the top-level dirctory of the local repository.

3. The contents and operation of a RIPPO should be transparent to the computer on which it is running. The user of a RIPPO should be able to use the terminal, editors, web browsers, and other software tools installed on their computer to interact with the running RIPPO, to modify the data or code in the RIPPO, and to inspect the code and data employed in the RIPPO.



