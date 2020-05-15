# This Catapult LB script has been generated to expand the characterization range(es)
# of components of the Catapult base library(ies) to fit the current design
# 
# Running this script is optional but using the updated library should result in improved correlation.
# 
# Run this script in Catapult LB with the base library loaded or uncomment the "library load" command(s)
#library load /cad/tools/mentor/catapult/Catapult_Synthesis_10.4b-841621/Mgc_home/pkgs/siflibs/designcompiler/mgc_sample-065nm-dw_beh_dc.lib
library set /LIBS/mgc_sample-065nm-dw_beh_dc/MODS/mgc_mul_pipe/PARAMETERS/n_inreg -- -CHAR_RANGE {0 to 0, 2}
library set /LIBS/mgc_sample-065nm-dw_beh_dc/MODS/mgc_mux1hot/PARAMETERS/ctrlw -- -CHAR_RANGE {1, 2 to 2, 4 to 32}
# The "library characterize" command below requires that: 
#   1. characterization directory set in the library exists and write accessible;
#   2. paths to technology libraries are set to correct locations;
#   3. the downstream tool used to characterize the library is available;
library characterize
