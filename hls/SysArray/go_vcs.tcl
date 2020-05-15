# Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#source ../nvhls_exec.tcl

source Catapult.ccs

echo "***RUN VCS ON CONCAT SIM ONLY***"
flow run /SCVerify/launch_make ./scverify/Verify_concat_sim_rtl_v_vcs.mk SIMTOOL=vcs sim INVOKE_ARGS= CCS_VCD_FILE=./default.fsdb CCS_VCD_TIMES=0,ns,end,ns USE_FSDB=true
exit
