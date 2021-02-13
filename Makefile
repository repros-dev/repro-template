# This is the top-level Makefile for this REPRO.
# Type 'make help' to list the available targets.

# set the default Make target
default_target: help

# include required task-specific Makefile targets
include .repro/000_Makefile.repro
include .repro/010_Makefile.help
include .repro/020_Makefile.examples
include .repro/030_Makefile.reports
include .repro/040_Makefile.analyses
include .repro/050_Makefile.data
include .repro/060_Makefile.services
include .repro/070_Makefile.code
include .repro/080_Makefile.image
include .repro/090_Makefile.aliases
