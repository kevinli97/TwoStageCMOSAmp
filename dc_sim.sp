.title DC SIMULATION OF OPAMP
.LIB '.\sm046005-1j.hspice' typical
.include '.\opamp.sp'
.global vdd gnd
V_1		vdd		gnd		3.3v
V_2		gnd		0		0v
V_inc	vinc	0
X_1 vinc vinc vout1 vout2 vdd gnd opamp

.dc V_inc 0 3.3 0.01
.measure DC 'max_single_output' max v(vout1)
.measure DC 'min_single_output' min v(vout1)
.probe DC output=v(vout1)
.print DC vout1
.end
