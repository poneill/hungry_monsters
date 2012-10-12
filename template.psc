# basic gene parameters for X
# transcription rates
X_activated_transcription:
	X_activated_promoter > X_activated_promoter + X_mrna
	%s * X_activated_p
X_basal_transcription:
	X_basal_promoter > X_basal_promoter + X_mrna
	%s * X_basal_p
X_repressed_transcription:
	X_repressed_promoter > X_repressed_promoter + X_mrna
	%s * X_repressed_p
# translation rates
X_translation:
	X_mrna > X_mrna + X_protein
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
	Y_activated_promoter > Y_activated_promoter + Y_mrna
	%s * Y_activated_p
Y_basal_transcription:
	Y_basal_promoter > Y_basal_promoter + Y_mrna
	%s * Y_basal_p
Y_repressed_transcription:
	Y_repressed_promoter > Y_repressed_promoter + Y_mrna
	%s * Y_repressed_p
# translation rates
Y_translation:
	Y_mrna > Y_mrna + Y_protein
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

#
# 3 more sets of reactions of U,V,Z
#


# reactions for sensor gene T
# basic gene parameters for T
# transcription rates
T_activated_transcription:
	T_activated_promoter > T_activated_promoter + T_mrna
	%s * T_activated_p
T_basal_transcription:
	T_basal_promoter > T_basal_promoter + T_mrna
	%s * T_basal_p
T_repressed_transcription:
	T_repressed_promoter > T_repressed_promoter + T_mrna
	%s * T_repressed_p
# translation rates
T_translation:
	T_mrna > T_mrna + T_protein
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
