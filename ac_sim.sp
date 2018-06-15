.title AC SIMULATION OF OPAMP
.LIB '.\sm046005-1j.hspice' typical
.include '.\opamp.sp'
********************subcircuit opamp x_1 x_2********************
X_1 vin1 vin2 vout1 vout2 vdd gnd opamp
X_2 vinc vinc vout3 vout4 vdc gnd opamp
X_3 vicm vicm vout5 vout6 vdd gnd opamp
********************subcircuit opamp x_1 x_2********************
V_1		vdd		gnd		3.3v
V_2		gnd		0		0v
V_c		vinc	0		1.65v

R_1		n1		vinc	1meg
R_2		n1		vout7	9meg

V_ip1 vin1 0 dc 1.65V ac 1mV
V_in1 vin2 0 dc 1.65V ac 0
V_icm vicm 0 dc 1.65V ac 1mV
V_dc1 vdc 0 dc 3.3v ac 1mV

.ac dec 10 1 5g
.option acout=0
.op
.measure AC 'PM' FIND par('vp(vout1,vout2)+180') WHEN par('vdb(vout1,vout2)-vdb(vin1,vin2)')=0
.measure AC 'GBW' trig at=1 targ par('vdb(vout1,vout2)-vdb(vin1,vin2)') val=0 fall=1
.measure AC 'ADM_DB' max par('vdb(vout1,vout2)-vdb(vin1,vin2)')
.measure AC 'CMRR' max par('vdb(vout1,vout2)-vdb(vin1,vin2)-vdb(vout5,vout6)+vdb(vicm)')
.measure AC 'PSRR' max par('vdb(vout1,vout2)-vdb(vin1,vin2)-vdb(vout3,vout4)+vdb(vdc)')
.probe AC GAIN_DB=par('vdb(vout1,vout2)-vdb(vin1,vin2)')
.probe AC PHASE=par('vp(vout1,vout2)-vp(vin1,vin2)')
.end
