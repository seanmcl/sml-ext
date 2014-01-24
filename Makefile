# -*- Mode: Makefile -*-

default: nj

ROOT_DIR=~/save/projects/sml-ext

PATH_MAP := $(ROOT_DIR)/build/sml-ext.map

MLB_PATH_MAP = -mlb-path-map $(PATH_MAP)

VERBOSE := -verbose 1

DEFAULTS := \
-default-ann 'allowFFI true' \
-default-ann 'nonexhaustiveMatch error' \
-default-ann 'nonexhaustiveExnMatch default' \
-default-ann 'redundantMatch error' \
-default-ann 'sequenceNonUnit error' \
-default-ann 'warnUnused true' \
# -default-ann 'forceUsed'

MLTON_OPTS = $(VERBOSE) $(PROFILE) $(DEF_USE) $(MLB_PATH_MAP) $(DEFAULTS) 

MLTON = mlton $(MLTON_OPTS) 

mlton:
	$(MLTON) -stop tc $(ROOT_DIR)/build/sml-ext.mlb

nj:
	sml sources.cm

# ------------------------------------------------------------------------------
#  Edit the following to suit your FFI requirements 
# ------------------------------------------------------------------------------

# CFSQP

USE_CFSQP := false
CFSQP_INCLUDE_DIR := /usr/local/cfsqp
CFSQP_LIB_DIR := /usr/local/cfsqp

# KNITRO

USE_KNITRO := false
KNITRO_INCLUDE_DIR := /usr/local/knitro/include
KNITRO_LIB_DIR := /usr/local/knitro/lib
ZIENA_LICENSE := /home/sean/save/versioned/program-data/knitro/mac

# CPLEX

USE_CPLEX := true
CPLEX_INCLUDE_DIR := 
CPLEX_LIB_DIR := 

# GLPK

USE_GLPK := false
GLPK_INCLUDE_DIR := /sw/include
GLPK_LIB_DIR := /sw/lib

# MPFR

USE_MPFR := false
MPFR_INCLUDE_DIR := /usr/local/include
MPFR_LIB_DIR := /usr/local/lib

# MPFI

USE_MPFI := false
MPFI_INCLUDE_DIR := /usr/local/include
MPFI_LIB_DIR := /usr/local/lib

clean:
	-find . -name ".cm" -exec rm -rf {} \; 
