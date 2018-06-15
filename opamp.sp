.title TWO STAGE OPAMP
************************two-stage op amp 0.35um***********************
.param W0=12.09u   W1=150.7u   W2=150.7u   W3=150.7u   W4=150.7u
.param W5=64.16u   W6=64.16u   W7=64.16u   W8=64.16u   W9=29.86u
.param W10=6.03u   W11=29.86u  W12=6.03u   W13=3.02u   W14=32.08u
.param L0=0.35u
.param cc=6.14p
*************************opamp defination*****************************
.subckt opamp vin1 vin2 vout1 vout2 vdd gnd
M_0		n0		n8		gnd		gnd		nmos_3p3	L=L0	W=W0
M_1		n1		vin1	n0		gnd		nmos_3p3	L=L0	W=W1
M_2		n2		vin2	n0		gnd		nmos_3p3	L=L0	W=W2
M_3		n3		b1		n1		gnd		nmos_3p3	L=L0	W=W3
M_4		n4		b1		n2		gnd		nmos_3p3	L=L0	W=W4
M_5		n3		b2		n5		vdd		pmos_3p3	L=L0	W=W5
M_6		n4		b2		n6		vdd		pmos_3p3	L=L0	W=W6
M_7		n5		n7		vdd		vdd		pmos_3p3	L=L0	W=W7
M_8		n6		n7		vdd		vdd		pmos_3p3	L=L0	W=W8
M_9		vout1	n3		vdd		vdd		pmos_3p3	L=L0	W=W9
M_10	vout1	n8		gnd		gnd		nmos_3p3	L=L0	W=W10
M_11	vout2	n4		vdd		vdd		pmos_3p3	L=L0	W=W11
M_12	vout2	n8		gnd		gnd		nmos_3p3	L=L0	W=W12
M_13	n8		n8		gnd		gnd		nmos_3p3	L=L0	W=W13
M_14	n7		n7		vdd		vdd		pmos_3p3	L=L0	W=W14

C_1		vout1	n1		cc
C_2		vout2	n2		cc
C_l1	vout1	gnd		2p
C_l2	vout2	gnd		2p

I_bias	n7		n8		0.2m

V_b1	b1		gnd		2.225
V_b2	b2		gnd		1.287
.ends opamp
***************************end defination*****************************