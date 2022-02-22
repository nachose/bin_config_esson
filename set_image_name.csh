#!/bin/tcsh

source ~/bin/common_vars.csh

setenv builder_image_and_tag `grep --color=never cpp-builder: ${PCG_BASE_DIR}/up/ruleset/images.yaml | awk '{print $3}'`;
