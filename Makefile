# This is the top-level Makefile for this REPRO.
# Type 'make help' to list the available targets.

# set the default Make target
default_target: help

include repro-config
repro-config:

# identify the REPRO and associated Docker image
REPRO_IMAGE=${REPRO_DOCKER_ORG}/${REPRO_NAME}:${REPRO_IMAGE_TAG}

# provide runtime options for Docker when running this REPRO
REPRO_DOCKER_OPTIONS=
#REPRO_DOCKER_OPTIONS=-p 9999:9999

#REPRO_MOUNT_CLI=--volume $(CURDIR)/../go-cli:/mnt/go-cli
#REPRO_MOUNT_BLAZE=--volume $(CURDIR)/../blaze:/mnt/blaze

REPRO_MOUNT_OTHER_VOLUMES=
#REPRO_MOUNT_OTHER_VOLUMES=$(REPRO_MOUNT_CLI) $(REPRO_MOUNT_BLAZE)

# define mount point for REPRO directory tree in running container
REPRO_MNT=/mnt/${REPRO_NAME}

# identify important REPRO subdirectories
#REPRO_CODE_DIR=src
REPRO_EXAMPLES_DIR=examples
REPRO_SERVICE_DIR=service

# define command for running the service provided by this REPRO
REPRO_SERVICE_COMMAND=${REPRO_SERVICE_DIR}/run.sh

# define command for running the REPRO Docker image
REPRO_RUN_COMMAND=docker run -it --rm $(REPRO_DOCKER_OPTIONS)               \
                             -e REPRO_NAME="${REPRO_NAME}"                  \
                             -e REPRO_MNT="${REPRO_MNT}"                    \
                             --volume "$(CURDIR)":"$(REPRO_MNT)"            \
                             $(REPRO_MOUNT_OTHER_VOLUMES)                   \
                             $(REPRO_IMAGE)

# detect if in a running REPRO container
ifdef IN_RUNNING_REPRO
RUN_IN_REPRO=bash -ic
else
RUN_IN_REPRO=$(REPRO_RUN_COMMAND) bash -ilc
endif

# detect if running in a Windows environment
ifeq ('$(OS)', 'Windows_NT')
PWSH=powershell -noprofile -command
endif


#include .repro/010_Makefile.help
## 
## # Targets for learning about this REPRO and Makefile
## 

help:                   ## Show this help.
ifdef PWSH
	@${PWSH} "Get-ChildItem .repro | Select-String -Pattern '#\# ' | % {$$_.Line.replace('##','')}"
else
	@sed -ne '/@sed/!s/#\# //p' $(MAKEFILE_LIST)
endif

#include .repro/020_Makefile.examples
## 
## # Targets for running the examples in this REPRO.

## run-demo:           Run the demo.
run-demo: 
	$(RUN_IN_REPRO) 'repro.run_target run-demo'

clean-demo:         ## Delete all products the demo.
	$(RUN_IN_REPRO) 'repro.run_target clean-demo'


# include .repro/030_Makefile.reports
## 
## # Targets for creating the reports in this REPRO.
## 

create-reports:          ## Run all of the examples.

clean-reports:           ## Delete all reports.


# include .repro/040_Makefile.analyses
## 
## # Targets for performing the analyses in this REPRO.
## 

create-analyses:         ## Run all of the examples.

clean-analyses:          ## Delete all reports.


#include .repro/040_Makefile.data
clean-database:       ## Delete the database logs.
	$(RUN_IN_REPRO) 'repro.run_target clean-database'
	
drop-database:        ## Delete the database storage files.
	$(RUN_IN_REPRO) 'repro.run_target drop-database'

purge-database:       ## Delete all artifacts associated with the database instance.
	$(RUN_IN_REPRO) 'repro.run_target purge-database'


#include .repro/050_Makefile.service
## 
## # Targets for running the service provided by this REPRO locally

# Define target aliases available only outside a running REPRO
ifndef IN_RUNNING_REPRO

start-service:          ## Run the service provided by this REPRO locally
	$(RUN_IN_REPRO)  'make -C ${REPRO_SERVICE_DIR} run'
	
else

start-service:
	@echo
	@echo "Error: The start-service target is not available in a running REPRO."
	@echo

endif

#include .repro/070_Makefile.code
##
## # Targets for building and testing custom code in this REPRO.

clean-code:             ## Delete artifacts from previous builds.
	$(RUN_IN_REPRO) 'repro.run_target clean-code'

purge-code:             ## Delete all downloaded, cached, and built artifacts.
	$(RUN_IN_REPRO) 'repro.run_target purge-code'

build-code:             ## Build custom code.
	$(RUN_IN_REPRO) 'repro.run_target build-code'

test-code:              ## Run tests on custom code.
	$(RUN_IN_REPRO) 'repro.run_target test-code'

install-code:           ## Install built artifacts in REPRO.
	$(RUN_IN_REPRO) 'repro.run_target install-code'

package-code:           # Package custom artifacts for distribution.
	$(RUN_IN_REPRO) 'repro.run_target package-code'


#include .repro/080_Makefile.image
## 
## # Targets for managing the Docker image for this REPRO.
## 

ifndef IN_RUNNING_REPRO

start-image:            ## Start the REPRO using the Docker image.
	$(REPRO_RUN_COMMAND)

build-image:            ## Build the Docker image used to run this REPRO.
	docker build -t ${REPRO_IMAGE} .

rebuild-image:          ## Force rebuild of the Docker image used to run this REPRO.
	docker build --no-cache -t ${REPRO_IMAGE} .

pull-image:             ## Pull the Docker image from Docker Hub.
	docker pull ${REPRO_IMAGE}

push-image:             ## Push the Docker image to Docker Hub.
	docker push ${REPRO_IMAGE}

endif


#include .repro/085_Makefile.base
## 
## # Targets for building the base image.
## 

ifndef IN_RUNNING_REPRO

base-image:             ## Build the Docker base image.
	docker build -f Dockerfile-base -t ${REPRO_DOCKER_ORG}/repro-base:${REPRO_IMAGE_TAG} .

endif

#include .repro/090_Makefile.aliases
## 
## # Aliases for targets in this Makefile.
## 

# Define target aliases available both inside and outside a running REPRO

# Define target aliases available only outside a running REPRO
ifndef IN_RUNNING_REPRO
image:    build-image   ## Build the Docker image used to run this REPRO.
start:    start-image   ## Start the REPRO using the Docker image.
endif

## 
reset-makefile:         ## Replace local Makefile with latest version from repo
	curl -L https://raw.githubusercontent.com/repros-dev/repro-template/master/Makefile -o Makefile
