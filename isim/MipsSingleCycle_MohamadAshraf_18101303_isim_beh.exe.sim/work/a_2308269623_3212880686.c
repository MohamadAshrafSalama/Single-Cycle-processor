/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/mhama/Desktop/Mohmad Ashraf/MohamadAshra_18101303_2021/ALU_MohamadAshraf_18101303.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2308269623_3212880686_p_0(char *t0)
{
    char t21[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    int t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    int t20;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t5 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 3656);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6344);
    t11 = xsi_mem_cmp(t1, t2, 4U);
    if (t11 == 1)
        goto LAB6;

LAB13:    t4 = (t0 + 6348);
    t12 = xsi_mem_cmp(t4, t2, 4U);
    if (t12 == 1)
        goto LAB7;

LAB14:    t7 = (t0 + 6352);
    t13 = xsi_mem_cmp(t7, t2, 4U);
    if (t13 == 1)
        goto LAB8;

LAB15:    t9 = (t0 + 6356);
    t14 = xsi_mem_cmp(t9, t2, 4U);
    if (t14 == 1)
        goto LAB9;

LAB16:    t15 = (t0 + 6360);
    t17 = xsi_mem_cmp(t15, t2, 4U);
    if (t17 == 1)
        goto LAB10;

LAB17:    t18 = (t0 + 6364);
    t20 = xsi_mem_cmp(t18, t2, 4U);
    if (t20 == 1)
        goto LAB11;

LAB18:
LAB12:    xsi_set_current_line(66, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 3720);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_fast(t3);

LAB5:    t1 = (t0 + 3560);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(49, ng0);
    t6 = (t0 + 3656);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB6:    xsi_set_current_line(55, ng0);
    t22 = (t0 + 1032U);
    t23 = *((char **)t22);
    t22 = (t0 + 6156U);
    t24 = (t0 + 1192U);
    t25 = *((char **)t24);
    t24 = (t0 + 6172U);
    t26 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t21, t23, t22, t25, t24);
    t27 = (t21 + 12U);
    t28 = *((unsigned int *)t27);
    t29 = (1U * t28);
    t5 = (32U != t29);
    if (t5 == 1)
        goto LAB20;

LAB21:    t30 = (t0 + 3720);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t26, 32U);
    xsi_driver_first_trans_fast(t30);
    goto LAB5;

LAB7:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t21, t2, t1, t4, t3);
    t7 = (t21 + 12U);
    t28 = *((unsigned int *)t7);
    t29 = (1U * t28);
    t5 = (32U != t29);
    if (t5 == 1)
        goto LAB22;

LAB23:    t8 = (t0 + 3720);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB5;

LAB8:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t6 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t21, t2, t1, t4, t3);
    t7 = (t21 + 12U);
    t28 = *((unsigned int *)t7);
    t29 = (1U * t28);
    t5 = (32U != t29);
    if (t5 == 1)
        goto LAB24;

LAB25:    t8 = (t0 + 3720);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB5;

LAB9:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t21, t2, t1, t4, t3);
    t7 = (t21 + 12U);
    t28 = *((unsigned int *)t7);
    t29 = (1U * t28);
    t5 = (32U != t29);
    if (t5 == 1)
        goto LAB26;

LAB27:    t8 = (t0 + 3720);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB5;

LAB10:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t5 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(63, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 3720);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_fast(t3);

LAB29:    goto LAB5;

LAB11:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6156U);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 6172U);
    t6 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t21, t2, t1, t4, t3);
    t7 = (t21 + 12U);
    t28 = *((unsigned int *)t7);
    t29 = (1U * t28);
    t5 = (32U != t29);
    if (t5 == 1)
        goto LAB31;

LAB32:    t8 = (t0 + 3720);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB5;

LAB19:;
LAB20:    xsi_size_not_matching(32U, t29, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(32U, t29, 0);
    goto LAB23;

LAB24:    xsi_size_not_matching(32U, t29, 0);
    goto LAB25;

LAB26:    xsi_size_not_matching(32U, t29, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(61, ng0);
    t6 = xsi_get_transient_memory(32U);
    memset(t6, 0, 32U);
    t7 = t6;
    memset(t7, (unsigned char)3, 32U);
    t8 = (t0 + 3720);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t15 = (t10 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t6, 32U);
    xsi_driver_first_trans_fast(t8);
    goto LAB29;

LAB31:    xsi_size_not_matching(32U, t29, 0);
    goto LAB32;

}

static void work_a_2308269623_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(70, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3784);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3576);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2308269623_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2308269623_3212880686_p_0,(void *)work_a_2308269623_3212880686_p_1};
	xsi_register_didat("work_a_2308269623_3212880686", "isim/MipsSingleCycle_MohamadAshraf_18101303_isim_beh.exe.sim/work/a_2308269623_3212880686.didat");
	xsi_register_executes(pe);
}
