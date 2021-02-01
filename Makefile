# This is the top-level Makefile for this REPRO.
# Type 'make help' to list the available targets.

# set the default Make target
default_target: help

# include required task-specific Makefile targets
include .repro/010_Makefile.repro
include .repro/020_Makefile.help
include .repro/030_Makefile.examples
include .repro/040_Makefile.code
include .repro/050_Makefile.service
include .repro/060_Makefile.image
include .repro/070_Makefile.docker
include .repro/080_Makefile.aliases


