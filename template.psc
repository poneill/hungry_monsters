# basic gene parameters for X
# transcription rates
X_activated_transcription:
	X_activated_promoter + alpha * ATP > X_activated_promoter + X_mrna
	%s * X_activated_p
X_basal_transcription:
	X_basal_promoter + alpha * ATP > X_basal_promoter + X_mrna
	%s * X_basal_p
X_repressed_transcription:
	X_repressed_promoter + alpha * ATP > X_repressed_promoter + X_mrna
	%s * X_repressed_p
# translation rates
X_translation:
	X_mrna + beta * ATP > X_mrna + X_protein
	%s * X_mrna
# degredation rates
X_mrna_deg:
	X_mrna > $pool
	%s * X_mrna
X_protein_deg:
	X_protein > $pool
	%s * X_protein
# end basic gene parameters

# interactions with other genes:
X_activates_U:
	X_protein + U_basal_promoter = U_activated_promoter
	%s * X_protein * U_basal_promoter
X_represses_U:
	X_protein + U_basal_promoter = U_repressed_promoter
	%s * X_protein * U_basal_promoter
X_activates_V:
	X_protein + V_basal_promoter = V_activated_promoter
	%s * X_protein * V_basal_promoter
X_represses_V:
	X_protein + V_basal_promoter = V_repressed_promoter
	%s * X_protein * V_basal_promoter
X_activates_X:
	X_protein + X_basal_promoter = X_activated_promoter
	%s * X_protein * X_basal_promoter
X_represses_X:
	X_protein + X_basal_promoter = X_repressed_promoter
	%s * X_protein * X_basal_promoter
X_activates_Y:
	X_protein + Y_basal_promoter = Y_activated_promoter
	%s * X_protein * Y_basal_promoter
X_represses_Y:
	X_protein + Y_basal_promoter = Y_repressed_promoter
	%s * X_protein * Y_basal_promoter
X_activates_Z:
	X_protein + Z_basal_promoter = Z_activated_promoter
	%s * X_protein * Z_basal_promoter
X_represses_Z:
	X_protein + Z_basal_promoter = Z_repressed_promoter
	%s * X_protein * Z_basal_promoter
# end interactions with other genes

# basic gene parameters for Y
# transcription rates
Y_activated_transcription:
	Y_activated_promoter + alpha * ATP > Y_activated_promoter + Y_mrna
	%s * Y_activated_p
Y_basal_transcription:
	Y_basal_promoter + alpha * ATP > Y_basal_promoter + Y_mrna
	%s * Y_basal_p
Y_repressed_transcription:
	Y_repressed_promoter + alpha * ATP > Y_repressed_promoter + Y_mrna
	%s * Y_repressed_p
# translation rates
Y_translation:
	Y_mrna + beta * ATP > Y_mrna + Y_protein
	%s * Y_mrna
# degredation rates
Y_mrna_deg:
	Y_mrna > $pool
	%s * Y_mrna
Y_protein_deg:
	Y_protein > $pool
	%s * Y_protein
# end basic gene parameters

# interactions with other genes:
Y_activates_U:
	Y_protein + U_basal_promoter = U_activated_promoter
	%s * Y_protein * U_basal_promoter
Y_represses_U:
	Y_protein + U_basal_promoter = U_repressed_promoter
	%s * Y_protein * U_basal_promoter
Y_activates_V:
	Y_protein + V_basal_promoter = V_activated_promoter
	%s * Y_protein * V_basal_promoter
Y_represses_V:
	Y_protein + V_basal_promoter = V_repressed_promoter
	%s * Y_protein * V_basal_promoter
Y_activates_X:
	Y_protein + X_basal_promoter = X_activated_promoter
	%s * Y_protein * X_basal_promoter
Y_represses_Y:
	Y_protein + Y_basal_promoter = Y_repressed_promoter
	%s * Y_protein * Y_basal_promoter
Y_activates_Y:
	Y_protein + Y_basal_promoter = Y_activated_promoter
	%s * Y_protein * Y_basal_promoter
Y_represses_Y:
	Y_protein + Y_basal_promoter = Y_repressed_promoter
	%s * Y_protein * Y_basal_promoter
Y_activates_Z:
	Y_protein + Z_basal_promoter = Z_activated_promoter
	%s * Y_protein * Z_basal_promoter
Y_represses_Z:
	Y_protein + Z_basal_promoter = Z_repressed_promoter
	%s * Y_protein * Z_basal_promoter
# end interactions with other genes

# basic gene parameters for U
# transcription rates
U_activated_transcription:
	U_activated_promoter + alpha * ATP > U_activated_promoter + U_mrna
	%s * U_activated_p
U_basal_transcription:
	U_basal_promoter + alpha * ATP > U_activated_promoter + U_mrna
	%s * U_basal_p
U_repressed_transcription:
	U_repressed_promoter + alpha * ATP > U_repressed_promoter + U_mrna
	%s * U_repressed_p
#translation rates
U_translation:
	U_mrna + beta * ATP > U_mrna + U_protein
	%s * U_mrna
#degredation rates
U_mrna_deg:
	U_mrna > $pool
	%s * U_protein
#end basic gene parameters

#interactions with other genes:
U_activates_U:
	U_protein + U_basal_promoter = U_activated_promoter
	%s * U_protein * U_basal_promoter
U_represses_U:
	U_protein + U_basal_promoter = U_repressed_promoter
	%s * U_protein * U_basal_promoter
U_activates_V:
	U_protein + V_basal_promoter = V_activated_promoter
	%s * U_protein * V_basal_promoter
U_represses_V:
	U_protein + V_basal_promoter = V_repressed_promoter
	%s * U_protein * V_basal_promoter
U_activates_X:
	U_protein + X_basal_promoter = X_activated_promoter
	%s * U_protein * X_basal_promoter
U_represses_X:
	U_protein + X_basal_promoter = X_repressed_promoter
	%s * U_protein * X_basal_promoter
U_activates_Y:
	U_protein + Y_basal_promoter = Y_activated_promoter
	%s * U_protein * Y_basal_promoter
U_represses_Y:
	U_protein + Y_basal_promoter = Y_repressed_promoter
	%s * U_protein * Y_basal_promoter
U_activates_Z:
	U_protein + Z_basal_promoter = Z_activated_promoter
	%s * U_protein * Z_basal_promoter
U_represses_Z:
	U_protein + Z_basal_promoter = Z_repressed_promoter
	%s * U_protein * Z_basal_promoter
#end interactions with other genes

# basic gene parameters for V
# transcription rates
V_activated_transcription:
	V_activated_promoter + alpha * ATP > V_activated_promoter + V_mrna
	%s * V_activated_p
V_basal_transcription:
	V_basal_promoter + alpha * ATP > V_basal_promoter + V_mrna
	%s * V_basal_p
V_repressed_transcription:
	V_repressed_promoter + alpha * ATP > V_repressed_promoter + V_mrna
	%s * V_repressed_p
# translation rates
V_translation:
	V_mrna + beta * ATP > V_mrna + V_protein
	%s * V_mrna
# degredation rates
V_mrna_deg:
	V_mrna > $pool
	%s * V_mrna
V_protein_deg:
	V_protein > $pool
	%s * V_protein
# end basic gene parameters

# interactions with other genes:
V_activates_U:
	V_protein + U_basal_promoter = U_activated_promoter
	%s * V_protein * U_basal_promoter
V_represses_U:
	V_protein + U_basal_promoter = U_repressed_promoter
	%s * V_protein * U_basal_promoter
V_activates_V:
	V_protein + V_basal_promoter = V_activated_promoter
	%s * V_protein * V_basal_promoter
V_represses_V:
	V_protein + V_basal_promoter = V_repressed_promoter
	%s * V_protein * V_basal_promoter
V_activates_X:
	V_protein + X_basal_promoter = X_activated_promoter
	%s * V_protein * X_basal_promoter
V_represses_X:
	V_protein + X_basal_promoter = X_repressed_promoter
	%s * V_protein * X_basal_promoter
V_activates_Y:
	V_protein + Y_basal_promoter = Y_activated_promoter
	%s * V_protein * Y_basal_promoter
V_represses_Y:
	V_protein + Y_basal_promoter = Y_repressed_promoter
	%s * V_protein * Y_basal_promoter
V_activates_Z:
	V_protein + Z_basal_promoter = Z_activated_promoter
	%s * X_protein * Z_basal_promoter
V_represses_Z:
	V_protein + Z_basal_promoter = Z_repressed_promoter
	%s * V_protein * Z_basal_promoter
# end interactions with other genes

# basic gene parameters for Z
# transcription rates
Z_activated_transcription:
	Z_activated_promoter + alpha * ATP > Z_activated_promoter + Z_mrna
	%s * Z_activated_p
Z_basal_transcription:
	Z_basal_promoter + alpha * ATP > Z_basal_promoter + Z_mrna
	%s * Z_basal_p
Z_repressed_transcription:
	Z_repressed_promoter + alpha * ATP > Z_repressed_promoter + Z_mrna
	%s * Z_repressed_p
# translation rates
Z_translation:
	Z_mrna + beta * ATP > Z_mrna + Z_protein
	%s * V_mrna
# degredation rates
Z_mrna_deg:
	Z_mrna > $pool
	%s * Z_mrna
Z_protein_deg:
	Z_protein > $pool
	%s * Z_protein
# end basic gene parameters

# interactions with other genes:
Z_activates_U:
	Z_protein + U_basal_promoter = U_activated_promoter
	%s * Z_protein * U_basal_promoter
Z_represses_U:
	Z_protein + U_basal_promoter = U_repressed_promoter
	%s * Z_protein * U_basal_promoter
Z_activates_V:
	Z_protein + V_basal_promoter = V_activated_promoter
	%s * Z_protein * V_basal_promoter
Z_represses_V:
	Z_protein + V_basal_promoter = V_repressed_promoter
	%s * Z_protein * V_basal_promoter
Z_activates_X:
	Z_protein + X_basal_promoter = X_activated_promoter
	%s * Z_protein * X_basal_promoter
Z_represses_X:
	Z_protein + X_basal_promoter = X_repressed_promoter
	%s * Z_protein * X_basal_promoter
Z_activates_Y:
	Z_protein + Y_basal_promoter = Y_activated_promoter
	%s * Z_protein * Y_basal_promoter
Z_represses_Y:
	Z_protein + Y_basal_promoter = Y_repressed_promoter
	%s * Z_protein * Y_basal_promoter
Z_activates_Z:
	Z_protein + Z_basal_promoter = Z_activated_promoter
	%s * X_protein * Z_basal_promoter
Z_represses_Z:
	Z_protein + Z_basal_promoter = Z_repressed_promoter
	%s * Z_protein * Z_basal_promoter
# end interactions with other genes

# reactions for sensor gene T
# basic gene parameters for T
# transcription rates
T_activated_transcription:
	T_activated_promoter + alpha * ATP > T_activated_promoter + T_mrna
	%s * T_activated_p
T_basal_transcription:
	T_basal_promoter + alpha * ATP > T_basal_promoter + T_mrna
	%s * T_basal_p
T_repressed_transcription:
	T_repressed_promoter + alpha * ATP > T_repressed_promoter + T_mrna
	%s * T_repressed_p
# translation rates
T_translation:
	T_mrna + beta * ATP > T_mrna + T_protein
	%s * T_mrna
# degredation rates
T_mrna_deg:
	T_mrna > $pool
	%s * T_mrna
T_protein_deg:
	T_protein > $pool
	%s * T_protein
Tstar_protein_deg:
	Tstar_protein > $pool
	%s * Tstar_protein
Tstar_protein_inactivates:
	Tstar_protein > T
	%s * Tstar_protein
# end basic gene parameters

# interactions with other genes:
T_senses_S:
	T_protein + S > Tstar_protein + S
	%s * T * S
T_activates_U:
	Tstar_protein + U_basal_promoter = U_activated_promoter
	%s * Tstar_protein * U_basal_promoter
T_represses_U:
	Tstar_protein + U_basal_promoter = U_repressed_promoter
	%s * Tstar_protein * U_basal_promoter
T_activates_V:
	Tstar_protein + V_basal_promoter = V_activated_promoter
	%s * Tstar_protein * V_basal_promoter
T_represses_V:
	Tstar_protein + V_basal_promoter = V_repressed_promoter
	%s * Tstar_protein * V_basal_promoter
T_activates_T:
	Tstar_protein + T_basal_promoter = T_activated_promoter
	%s * Tstar_protein * T_basal_promoter
T_represses_T:
	Tstar_protein + T_basal_promoter = T_repressed_promoter
	%s * Tstar_protein * T_basal_promoter
T_activates_Y:
	Tstar_protein + Y_basal_promoter = Y_activated_promoter
	%s * Tstar_protein * Y_basal_promoter
T_represses_Y:
	Tstar_protein + Y_basal_promoter = Y_repressed_promoter
	%s * Tstar_protein * Y_basal_promoter
T_activates_Z:
	Tstar_protein + Z_basal_promoter = Z_activated_promoter
	%s * Tstar_protein * Z_basal_promoter
T_represses_Z:
	Tstar_protein + Z_basal_promoter = Z_repressed_promoter
	%s * Tstar_protein * Z_basal_promoter
# end interactions with other genes

# basic gene parameters for "eating protein" P
# transcription rates
P_activated_transcription:
	P_activated_promoter + alpha * ATP > P_activated_promoter + P_mrna
	%s * P_activated_p
P_basal_transcription:
	P_basal_promoter + alpha * ATP > P_basal_promoter + P_mrna
	%s * P_basal_p
P_repressed_transcription:
	P_repressed_promoter + alpha * ATP > P_repressed_promoter + P_mrna
	%s * P_repressed_p
# translation rates
P_translation:
	P_mrna + beta * ATP > P_mrna + P_protein
	%s * P_mrna
# degredation rates
P_mrna_deg:
	P_mrna > $pool
	%s * P_mrna
P_protein_deg:
	P_protein > $pool
	%s * P_protein
# end basic gene parameters

# interactions with other genes:
P_eats_S:
	P_protein + S > P_protein + gamma * ATP
P_activates_U:
	P_protein + U_basal_promoter = U_activated_promoter
	%s * P_protein * U_basal_promoter
P_represses_U:
	P_protein + U_basal_promoter = U_repressed_promoter
	%s * P_protein * U_basal_promoter
P_activates_V:
	P_protein + V_basal_promoter = V_activated_promoter
	%s * P_protein * V_basal_promoter
P_represses_V:
	P_protein + V_basal_promoter = V_repressed_promoter
	%s * P_protein * V_basal_promoter
P_activates_P:
	P_protein + P_basal_promoter = P_activated_promoter
	%s * P_protein * P_basal_promoter
P_represses_P:
	P_protein + P_basal_promoter = P_repressed_promoter
	%s * P_protein * P_basal_promoter
P_activates_Y:
	P_protein + Y_basal_promoter = Y_activated_promoter
	%s * P_protein * Y_basal_promoter
P_represses_Y:
	P_protein + Y_basal_promoter = Y_repressed_promoter
	%s * P_protein * Y_basal_promoter
P_activates_Z:
	P_protein + Z_basal_promoter = Z_activated_promoter
	%s * P_protein * Z_basal_promoter
P_represses_Z:
	P_protein + Z_basal_promoter = Z_repressed_promoter
	%s * P_protein * Z_basal_promoter
# end interactions with other genes