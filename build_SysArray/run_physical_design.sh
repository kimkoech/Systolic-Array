#!/bin/bash

for i in {41..43}
do
    make clean
    cp ~/cs148/hls/lab3/SysArray/Catapult/SysArray.v1/concat_rtl.v ~/cs148/physical_design/lab4/build_SysArray/scripts/rtl_src/SysArray.v
    python iterate.py $i # change parameters
    make compile
    make design_planning
    make place_opt
    make clock_opt
    make route_opt

    # save results
    NOW="$(date)"
    mkdir ~/cs148/results/"$NOW"
    cp -r reports/layout/* ~/cs148/results/"$NOW"
    mv ~/cs148/physical_design/lab4/build_SysArray/scripts/parameters.txt ~/cs148/results/"$NOW"

done