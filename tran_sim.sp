.title TRAN SIMULATION OF OPAMP
.LIB '.\sm046005-1j.hspice' typical
.include '.\opamp.sp'
.global vdd gnd
V_1		vdd		gnd		3.3v
V_2		gnd		0		0v
V_cm	vin2	0		1.65v

Vin_pos vin1 0 pulse 1.15 2.15 1u 1f 1f 1u 2u

X_1 vin1 vin2 vout1 vout2 vdd gnd opamp
X_2 vsin n1 vout3 vout4 vdd gnd opamp

R_1		n1		vin2	1meg
R_2		n1		vout3	9meg

V_sin vsin 0 sin (1.65 0.11 1meg)

.tran 0.1n 10u 
.measure tran sr_r deriv v(vout1,vout2) when v(vout1,vout2)=0 rise=1
.measure tran sr_f deriv v(vout1,vout2) when v(vout1,vout2)=0 fall=1
.probe tran vin=v(vin1,vin2)
.probe tran vout=v(vout1,vout2)
.probe tran voutr=vout3
.option node list post
.op
.end
