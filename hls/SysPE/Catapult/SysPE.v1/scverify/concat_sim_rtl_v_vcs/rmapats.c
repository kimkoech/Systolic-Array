// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I1104, EBLK  * I1105, U  I654);
void  hsG_0 (struct dummyq_struct * I1104, EBLK  * I1105, U  I654)
{
    U  I1348;
    U  I1349;
    U  I1350;
    struct futq * I1351;
    I1348 = ((U )vcs_clocks) + I654;
    I1350 = I1348 & ((1 << fHashTableSize) - 1);
    I1105->I700 = (EBLK  *)(-1);
    I1105->I704 = I1348;
    if (I1348 < (U )vcs_clocks) {
        I1349 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1104, I1105, I1349 + 1, I1348);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I654 == 1)) {
        I1105->I705 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I700 = I1105;
        peblkFutQ1Tail = I1105;
    }
    else if ((I1351 = I1104->I1063[I1350].I717)) {
        I1105->I705 = (struct eblk *)I1351->I716;
        I1351->I716->I700 = (RP )I1105;
        I1351->I716 = (RmaEblk  *)I1105;
    }
    else {
        sched_hsopt(I1104, I1105, I1348);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
