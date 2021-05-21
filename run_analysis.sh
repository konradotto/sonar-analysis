#!/bin/bash

# Change dir to the repository that should be analysed
cd ${1}
source ../select_tag.sh
source ../set_sonar_params.sh
source ./build_script.sh