#include "acc_user.h"
#include "veriuser.h"
void vcs_systemc_init();
int simv_init_misc(int user_data, int reason)
{
  if (reason == reason_endofcompile) {
    tf_rosynchronize();
  } else if (reason == reason_rosynch) {
    vcs_systemc_init();
  }
  return 0;
}

