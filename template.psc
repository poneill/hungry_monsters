# basic gene parameters for X
# transcription rates
X_activated_transcription:
    X_activated_promoter + {alpha} ATP > X_activated_promoter + X_mrna
    activated_transcription_rate * X_activated_promoter
X_basal_transcription:
    X_basal_promoter + {alpha} ATP > X_basal_promoter + X_mrna
    basal_transcription_rate * X_basal_promoter
X_repressed_transcription:
    X_repressed_promoter + {alpha} ATP > X_repressed_promoter + X_mrna
    repressed_transcription_rate * X_repressed_promoter
# translation rates
X_translation:
    X_mrna + {beta} ATP > X_mrna + X_protein
    translation_rate * X_mrna
# degredation rates
X_mrna_deg:
    X_mrna > $pool
    mRNA_degradation_rate * X_mrna
X_protein_deg:
    X_protein > $pool
    protein_degradation_rate * X_protein
# end basic gene parameters

# interactions with other genes:
X_activates_P:
    X_protein + P_basal_promoter > P_activated_promoter
    %s * X_protein * P_basal_promoter
X_unactivates_P:
    P_activated_promoter > X_protein + P_basal_promoter
    1 * P_activated_promoter
X_represses_P:
    X_protein + P_basal_promoter > P_repressed_promoter
    %s * X_protein * P_basal_promoter
X_unrepresses_P:
    P_repressed_promoter > X_protein + P_basal_promoter
    1 * P_repressed_promoter
X_activates_T:
    X_protein + T_basal_promoter > T_activated_promoter
    %s * X_protein * T_basal_promoter
X_unactivates_T:
    T_activated_promoter > X_protein + T_basal_promoter
    1 * T_activated_promoter
X_represses_T:
    X_protein + T_basal_promoter > T_repressed_promoter
    %s * X_protein * T_basal_promoter
X_unrepresses_T:
    T_repressed_promoter > X_protein + T_basal_promoter
    1 * T_repressed_promoter
X_activates_U:
    X_protein + U_basal_promoter > U_activated_promoter
    %s * X_protein * U_basal_promoter
X_unactivates_U:
    U_activated_promoter > X_protein + U_basal_promoter
    1 * U_activated_promoter
X_represses_U:
    X_protein + U_basal_promoter > U_repressed_promoter
    %s * X_protein * U_basal_promoter
X_unrepresses_U:
    U_repressed_promoter > X_protein + U_basal_promoter
    1 * U_repressed_promoter
X_activates_V:
    X_protein + V_basal_promoter > V_activated_promoter
    %s * X_protein * V_basal_promoter
X_unactivates_V:
    V_activated_promoter > X_protein + V_basal_promoter
    1 * V_activated_promoter
X_represses_V:
    X_protein + V_basal_promoter > V_repressed_promoter
    %s * X_protein * V_basal_promoter
X_unrepresses_V:
    V_repressed_promoter > X_protein + V_basal_promoter
    1 * V_repressed_promoter
X_activates_X:
    X_protein + X_basal_promoter > X_activated_promoter
    %s * X_protein * X_basal_promoter
X_unactivates_X:
    X_activated_promoter > X_protein + X_basal_promoter
    1 * X_activated_promoter
X_represses_X:
    X_protein + X_basal_promoter > X_repressed_promoter
    %s * X_protein * X_basal_promoter
X_unrepresses_X:
    X_repressed_promoter > X_protein + X_basal_promoter
    1 * X_repressed_promoter
X_activates_Y:
    X_protein + Y_basal_promoter > Y_activated_promoter
    %s * X_protein * Y_basal_promoter
X_unactivates_Y:
    Y_activated_promoter > X_protein + Y_basal_promoter
    1 * Y_activated_promoter
X_represses_Y:
    X_protein + Y_basal_promoter > Y_repressed_promoter
    %s * X_protein * Y_basal_promoter
X_unrepresses_Y:
    Y_repressed_promoter > X_protein + Y_basal_promoter
    1 * Y_repressed_promoter
X_activates_Z:
    X_protein + Z_basal_promoter > Z_activated_promoter
    %s * X_protein * Z_basal_promoter
X_unactivates_Z:
    Z_activated_promoter > X_protein + Z_basal_promoter
    1 * Z_activated_promoter
X_represses_Z:
    X_protein + Z_basal_promoter > Z_repressed_promoter
    %s * X_protein * Z_basal_promoter
X_unrepresses_Z:
    Z_repressed_promoter > X_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for Y
# transcription rates
Y_activated_transcription:
    Y_activated_promoter + {alpha} ATP > Y_activated_promoter + Y_mrna
    activated_transcription_rate * Y_activated_promoter
Y_basal_transcription:
    Y_basal_promoter + {alpha} ATP > Y_basal_promoter + Y_mrna
    basal_transcription_rate * Y_basal_promoter
Y_repressed_transcription:
    Y_repressed_promoter + {alpha} ATP > Y_repressed_promoter + Y_mrna
    repressed_transcription_rate * Y_repressed_promoter
# translation rates
Y_translation:
    Y_mrna + {beta} ATP > Y_mrna + Y_protein
    translation_rate * Y_mrna
# degredation rates
Y_mrna_deg:
    Y_mrna > $pool
    mRNA_degradation_rate * Y_mrna
Y_protein_deg:
    Y_protein > $pool
    protein_degradation_rate * Y_protein
# end basic gene parameters

# interactions with other genes:
Y_activates_P:
    Y_protein + P_basal_promoter > P_activated_promoter
    %s * Y_protein * P_basal_promoter
Y_unactivates_P:
    P_activated_promoter > Y_protein + P_basal_promoter
    1 * P_activated_promoter
Y_represses_P:
    Y_protein + P_basal_promoter > P_repressed_promoter
    %s * Y_protein * P_basal_promoter
Y_unrepresses_P:
    P_repressed_promoter > Y_protein + P_basal_promoter
    1 * P_repressed_promoter
Y_activates_T:
    Y_protein + T_basal_promoter > T_activated_promoter
    %s * Y_protein * T_basal_promoter
Y_unactivates_T:
    T_activated_promoter > Y_protein + T_basal_promoter
    1 * T_activated_promoter
Y_represses_T:
    Y_protein + T_basal_promoter > T_repressed_promoter
    %s * Y_protein * T_basal_promoter
Y_unrepresses_T:
    T_repressed_promoter > Y_protein + T_basal_promoter
    1 * T_repressed_promoter
Y_activates_U:
    Y_protein + U_basal_promoter > U_activated_promoter
    %s * Y_protein * U_basal_promoter
Y_unactivates_U:
    U_activated_promoter > Y_protein + U_basal_promoter
    1 * U_activated_promoter
Y_represses_U:
    Y_protein + U_basal_promoter > U_repressed_promoter
    %s * Y_protein * U_basal_promoter
Y_unrepresses_U:
    U_repressed_promoter > Y_protein + U_basal_promoter
    1 * U_repressed_promoter
Y_activates_V:
    Y_protein + V_basal_promoter > V_activated_promoter
    %s * Y_protein * V_basal_promoter
Y_unactivates_V:
    V_activated_promoter > Y_protein + V_basal_promoter
    1 * V_activated_promoter
Y_represses_V:
    Y_protein + V_basal_promoter > V_repressed_promoter
    %s * Y_protein * V_basal_promoter
Y_unrepresses_V:
    V_repressed_promoter > Y_protein + V_basal_promoter
    1 * V_repressed_promoter
Y_activates_X:
    Y_protein + X_basal_promoter > X_activated_promoter
    %s * Y_protein * X_basal_promoter
Y_unactivates_X:
    X_activated_promoter > Y_protein + X_basal_promoter
    1 * X_activated_promoter
Y_represses_X:
    Y_protein + X_basal_promoter > X_repressed_promoter
    %s * Y_protein * X_basal_promoter
Y_unrepresses_X:
    X_repressed_promoter > Y_protein + X_basal_promoter
    1 * X_repressed_promoter
Y_activates_Y:
    Y_protein + Y_basal_promoter > Y_activated_promoter
    %s * Y_protein * Y_basal_promoter
Y_unactivates_Y:
    Y_activated_promoter > Y_protein + Y_basal_promoter
    1 * Y_activated_promoter
Y_represses_Y:
    Y_protein + Y_basal_promoter > Y_repressed_promoter
    %s * Y_protein * Y_basal_promoter
Y_unrepresses_Y:
    Y_repressed_promoter > Y_protein + Y_basal_promoter
    1 * Y_repressed_promoter
Y_activates_Z:
    Y_protein + Z_basal_promoter > Z_activated_promoter
    %s * Y_protein * Z_basal_promoter
Y_unactivates_Z:
    Z_activated_promoter > Y_protein + Z_basal_promoter
    1 * Z_activated_promoter
Y_represses_Z:
    Y_protein + Z_basal_promoter > Z_repressed_promoter
    %s * Y_protein * Z_basal_promoter
Y_unrepresses_Z:
    Z_repressed_promoter > Y_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for U
# transcription rates
U_activated_transcription:
    U_activated_promoter + {alpha} ATP > U_activated_promoter + U_mrna
    activated_transcription_rate * U_activated_promoter
U_basal_transcription:
    U_basal_promoter + {alpha} ATP > U_activated_promoter + U_mrna
    basal_transcription_rate * U_basal_promoter
U_repressed_transcription:
    U_repressed_promoter + {alpha} ATP > U_repressed_promoter + U_mrna
    repressed_transcription_rate * U_repressed_promoter
#translation rates
U_translation:
    U_mrna + {beta} ATP > U_mrna + U_protein
    translation_rate * U_mrna
#degredation rates
U_mrna_deg:
    U_mrna > $pool
    mRNA_degradation_rate * U_mrna
#end basic gene parameters

# interactions with other genes:
U_activates_P:
    U_protein + P_basal_promoter > P_activated_promoter
    %s * U_protein * P_basal_promoter
U_unactivates_P:
    P_activated_promoter > U_protein + P_basal_promoter
    1 * P_activated_promoter
U_represses_P:
    U_protein + P_basal_promoter > P_repressed_promoter
    %s * U_protein * P_basal_promoter
U_unrepresses_P:
    P_repressed_promoter > U_protein + P_basal_promoter
    1 * P_repressed_promoter
U_activates_T:
    U_protein + T_basal_promoter > T_activated_promoter
    %s * U_protein * T_basal_promoter
U_unactivates_T:
    T_activated_promoter > U_protein + T_basal_promoter
    1 * T_activated_promoter
U_represses_T:
    U_protein + T_basal_promoter > T_repressed_promoter
    %s * U_protein * T_basal_promoter
U_unrepresses_T:
    T_repressed_promoter > U_protein + T_basal_promoter
    1 * T_repressed_promoter
U_activates_U:
    U_protein + U_basal_promoter > U_activated_promoter
    %s * U_protein * U_basal_promoter
U_unactivates_U:
    U_activated_promoter > U_protein + U_basal_promoter
    1 * U_activated_promoter
U_represses_U:
    U_protein + U_basal_promoter > U_repressed_promoter
    %s * U_protein * U_basal_promoter
U_unrepresses_U:
    U_repressed_promoter > U_protein + U_basal_promoter
    1 * U_repressed_promoter
U_activates_V:
    U_protein + V_basal_promoter > V_activated_promoter
    %s * U_protein * V_basal_promoter
U_unactivates_V:
    V_activated_promoter > U_protein + V_basal_promoter
    1 * V_activated_promoter
U_represses_V:
    U_protein + V_basal_promoter > V_repressed_promoter
    %s * U_protein * V_basal_promoter
U_unrepresses_V:
    V_repressed_promoter > U_protein + V_basal_promoter
    1 * V_repressed_promoter
U_activates_X:
    U_protein + X_basal_promoter > X_activated_promoter
    %s * U_protein * X_basal_promoter
U_unactivates_X:
    X_activated_promoter > U_protein + X_basal_promoter
    1 * X_activated_promoter
U_represses_X:
    U_protein + X_basal_promoter > X_repressed_promoter
    %s * U_protein * X_basal_promoter
U_unrepresses_X:
    X_repressed_promoter > U_protein + X_basal_promoter
    1 * X_repressed_promoter
U_activates_Y:
    U_protein + Y_basal_promoter > Y_activated_promoter
    %s * U_protein * Y_basal_promoter
U_unactivates_Y:
    Y_activated_promoter > U_protein + Y_basal_promoter
    1 * Y_activated_promoter
U_represses_Y:
    U_protein + Y_basal_promoter > Y_repressed_promoter
    %s * U_protein * Y_basal_promoter
U_unrepresses_Y:
    Y_repressed_promoter > U_protein + Y_basal_promoter
    1 * Y_repressed_promoter
U_activates_Z:
    U_protein + Z_basal_promoter > Z_activated_promoter
    %s * U_protein * Z_basal_promoter
U_unactivates_Z:
    Z_activated_promoter > U_protein + Z_basal_promoter
    1 * Z_activated_promoter
U_represses_Z:
    U_protein + Z_basal_promoter > Z_repressed_promoter
    %s * U_protein * Z_basal_promoter
U_unrepresses_Z:
    Z_repressed_promoter > U_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for V
# transcription rates
V_activated_transcription:
    V_activated_promoter + {alpha} ATP > V_activated_promoter + V_mrna
    activated_transcription_rate * V_activated_promoter
V_basal_transcription:
    V_basal_promoter + {alpha} ATP > V_basal_promoter + V_mrna
    basal_transcription_rate * V_basal_promoter
V_repressed_transcription:
    V_repressed_promoter + {alpha} ATP > V_repressed_promoter + V_mrna
    repressed_transcription_rate * V_repressed_promoter
# translation rates
V_translation:
    V_mrna + {beta} ATP > V_mrna + V_protein
    translation_rate * V_mrna
# degredation rates
V_mrna_deg:
    V_mrna > $pool
    mRNA_degradation_rate * V_mrna
V_protein_deg:
    V_protein > $pool
    protein_degradation_rate * V_protein
# end basic gene parameters

# interactions with other genes:
V_activates_P:
    V_protein + P_basal_promoter > P_activated_promoter
    %s * V_protein * P_basal_promoter
V_unactivates_P:
    P_activated_promoter > V_protein + P_basal_promoter
    1 * P_activated_promoter
V_represses_P:
    V_protein + P_basal_promoter > P_repressed_promoter
    %s * V_protein * P_basal_promoter
V_unrepresses_P:
    P_repressed_promoter > V_protein + P_basal_promoter
    1 * P_repressed_promoter
V_activates_T:
    V_protein + T_basal_promoter > T_activated_promoter
    %s * V_protein * T_basal_promoter
V_unactivates_T:
    T_activated_promoter > V_protein + T_basal_promoter
    1 * T_activated_promoter
V_represses_T:
    V_protein + T_basal_promoter > T_repressed_promoter
    %s * V_protein * T_basal_promoter
V_unrepresses_T:
    T_repressed_promoter > V_protein + T_basal_promoter
    1 * T_repressed_promoter
V_activates_U:
    V_protein + U_basal_promoter > U_activated_promoter
    %s * V_protein * U_basal_promoter
V_unactivates_U:
    U_activated_promoter > V_protein + U_basal_promoter
    1 * U_activated_promoter
V_represses_U:
    V_protein + U_basal_promoter > U_repressed_promoter
    %s * V_protein * U_basal_promoter
V_unrepresses_U:
    U_repressed_promoter > V_protein + U_basal_promoter
    1 * U_repressed_promoter
V_activates_V:
    V_protein + V_basal_promoter > V_activated_promoter
    %s * V_protein * V_basal_promoter
V_unactivates_V:
    V_activated_promoter > V_protein + V_basal_promoter
    1 * V_activated_promoter
V_represses_V:
    V_protein + V_basal_promoter > V_repressed_promoter
    %s * V_protein * V_basal_promoter
V_unrepresses_V:
    V_repressed_promoter > V_protein + V_basal_promoter
    1 * V_repressed_promoter
V_activates_X:
    X_protein + X_basal_promoter > X_activated_promoter
    %s * X_protein * X_basal_promoter
V_unactivates_X:
    X_activated_promoter > X_protein + X_basal_promoter
    1 * X_activated_promoter
V_represses_X:
    X_protein + X_basal_promoter > X_repressed_promoter
    %s * X_protein * X_basal_promoter
V_unrepresses_X:
    X_repressed_promoter > X_protein + X_basal_promoter
    1 * X_repressed_promoter
V_activates_Y:
    V_protein + Y_basal_promoter > Y_activated_promoter
    %s * V_protein * Y_basal_promoter
V_unactivates_Y:
    Y_activated_promoter > V_protein + Y_basal_promoter
    1 * Y_activated_promoter
V_represses_Y:
    V_protein + Y_basal_promoter > Y_repressed_promoter
    %s * V_protein * Y_basal_promoter
V_unrepresses_Y:
    Y_repressed_promoter > V_protein + Y_basal_promoter
    1 * Y_repressed_promoter
V_activates_Z:
    V_protein + Z_basal_promoter > Z_activated_promoter
    %s * V_protein * Z_basal_promoter
V_unactivates_Z:
    Z_activated_promoter > V_protein + Z_basal_promoter
    1 * Z_activated_promoter
V_represses_Z:
    V_protein + Z_basal_promoter > Z_repressed_promoter
    %s * V_protein * Z_basal_promoter
V_unrepresses_Z:
    Z_repressed_promoter > V_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for Z
# transcription rates
Z_activated_transcription:
    Z_activated_promoter + {alpha} ATP > Z_activated_promoter + Z_mrna
    activated_transcription_rate * Z_activated_promoter
Z_basal_transcription:
    Z_basal_promoter + {alpha} ATP > Z_basal_promoter + Z_mrna
    basal_transcription_rate * Z_basal_promoter
Z_repressed_transcription:
    Z_repressed_promoter + {alpha} ATP > Z_repressed_promoter + Z_mrna
    repressed_transcription_rate * Z_repressed_promoter
# translation rates
Z_translation:
    Z_mrna + {beta} ATP > Z_mrna + Z_protein
    translation_rate * V_mrna
# degredation rates
Z_mrna_deg:
    Z_mrna > $pool
    mRNA_degradation_rate * Z_mrna
Z_protein_deg:
    Z_protein > $pool
    protein_degradation_rate * Z_protein
# end basic gene parameters

# interactions with other genes:
Z_activates_P:
    Z_protein + P_basal_promoter > P_activated_promoter
    %s * Z_protein * P_basal_promoter
Z_unactivates_P:
    P_activated_promoter > Z_protein + P_basal_promoter
    1 * P_activated_promoter
Z_represses_P:
    Z_protein + P_basal_promoter > P_repressed_promoter
    %s * Z_protein * P_basal_promoter
Z_unrepresses_P:
    P_repressed_promoter > Z_protein + P_basal_promoter
    1 * P_repressed_promoter
Z_activates_T:
    Z_protein + T_basal_promoter > T_activated_promoter
    %s * Z_protein * T_basal_promoter
Z_unactivates_T:
    T_activated_promoter > Z_protein + T_basal_promoter
    1 * T_activated_promoter
Z_represses_T:
    Z_protein + T_basal_promoter > T_repressed_promoter
    %s * Z_protein * T_basal_promoter
Z_unrepresses_T:
    T_repressed_promoter > Z_protein + T_basal_promoter
    1 * T_repressed_promoter
Z_activates_U:
    Z_protein + U_basal_promoter > U_activated_promoter
    %s * Z_protein * U_basal_promoter
Z_unactivates_U:
    U_activated_promoter > Z_protein + U_basal_promoter
    1 * U_activated_promoter
Z_represses_U:
    Z_protein + U_basal_promoter > U_repressed_promoter
    %s * Z_protein * U_basal_promoter
Z_unrepresses_U:
    U_repressed_promoter > Z_protein + U_basal_promoter
    1 * U_repressed_promoter
Z_activates_V:
    Z_protein + V_basal_promoter > V_activated_promoter
    %s * Z_protein * V_basal_promoter
Z_unactivates_V:
    V_activated_promoter > Z_protein + V_basal_promoter
    1 * V_activated_promoter
Z_represses_V:
    Z_protein + V_basal_promoter > V_repressed_promoter
    %s * Z_protein * V_basal_promoter
Z_unrepresses_V:
    V_repressed_promoter > Z_protein + V_basal_promoter
    1 * V_repressed_promoter
Z_activates_X:
    X_protein + X_basal_promoter > X_activated_promoter
    %s * X_protein * X_basal_promoter
Z_unactivates_X:
    X_activated_promoter > X_protein + X_basal_promoter
    1 * X_activated_promoter
Z_represses_X:
    X_protein + X_basal_promoter > X_repressed_promoter
    %s * X_protein * X_basal_promoter
Z_unrepresses_X:
    X_repressed_promoter > X_protein + X_basal_promoter
    1 * X_repressed_promoter
Z_activates_Y:
    Z_protein + Y_basal_promoter > Y_activated_promoter
    %s * Z_protein * Y_basal_promoter
Z_unactivates_Y:
    Y_activated_promoter > Z_protein + Y_basal_promoter
    1 * Y_activated_promoter
Z_represses_Y:
    Z_protein + Y_basal_promoter > Y_repressed_promoter
    %s * Z_protein * Y_basal_promoter
Z_unrepresses_Y:
    Y_repressed_promoter > Z_protein + Y_basal_promoter
    1 * Y_repressed_promoter
Z_activates_Z:
    Z_protein + Z_basal_promoter > Z_activated_promoter
    %s * Z_protein * Z_basal_promoter
Z_unactivates_Z:
    Z_activated_promoter > Z_protein + Z_basal_promoter
    1 * Z_activated_promoter
Z_represses_Z:
    Z_protein + Z_basal_promoter > Z_repressed_promoter
    %s * Z_protein * Z_basal_promoter
Z_unrepresses_Z:
    Z_repressed_promoter > Z_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# reactions for sensor gene T
# basic gene parameters for T
# transcription rates
T_activated_transcription:
    T_activated_promoter + {alpha} ATP > T_activated_promoter + T_mrna
    activated_transcription_rate * T_activated_promoter
T_basal_transcription:
    T_basal_promoter + {alpha} ATP > T_basal_promoter + T_mrna
    basal_transcription_rate * T_basal_promoter
T_repressed_transcription:
    T_repressed_promoter + {alpha} ATP > T_repressed_promoter + T_mrna
    repressed_transcription_rate * T_repressed_promoter
# translation rates
T_translation:
    T_mrna + {beta} ATP > T_mrna + T_protein
    translation_rate * T_mrna
# degredation rates
T_mrna_deg:
    T_mrna > $pool
    mRNA_degradation_rate * T_mrna
T_protein_deg:
    T_protein > $pool
    protein_degradation_rate * T_protein
Tstar_protein_deg:
    Tstar_protein > $pool
    protein_degradation_rate * Tstar_protein

# T special interactions
T_protein_activates:
    T_protein + S > Tstar_protein + S
    T_activation_rate * T_protein * S
    
Tstar_protein_inactivates:
    Tstar_protein > T_protein
    T_deactivation_rate * Tstar_protein
# end basic gene parameters


# interactions with other genes:
Tstar_activates_P:
    Tstar_protein + P_basal_promoter > P_activated_promoter
    %s * Tstar_protein * P_basal_promoter
Tstar_unactivates_P:
    P_activated_promoter > Tstar_protein + P_basal_promoter
    1 * P_activated_promoter
Tstar_represses_P:
    Tstar_protein + P_basal_promoter > P_repressed_promoter
    %s * Tstar_protein * P_basal_promoter
Tstar_unrepresses_P:
    P_repressed_promoter > Tstar_protein + P_basal_promoter
    1 * P_repressed_promoter
Tstar_activates_T:
    Tstar_protein + T_basal_promoter > T_activated_promoter
    %s * Tstar_protein * T_basal_promoter
Tstar_unactivates_T:
    T_activated_promoter > Tstar_protein + T_basal_promoter
    1 * T_activated_promoter
Tstar_represses_T:
    Tstar_protein + T_basal_promoter > T_repressed_promoter
    %s * Tstar_protein * T_basal_promoter
Tstar_unrepresses_T:
    T_repressed_promoter > Tstar_protein + T_basal_promoter
    1 * T_repressed_promoter
Tstar_activates_U:
    Tstar_protein + U_basal_promoter > U_activated_promoter
    %s * Tstar_protein * U_basal_promoter
Tstar_unactivates_U:
    U_activated_promoter > Tstar_protein + U_basal_promoter
    1 * U_activated_promoter
Tstar_represses_U:
    Tstar_protein + U_basal_promoter > U_repressed_promoter
    %s * Tstar_protein * U_basal_promoter
Tstar_unrepresses_U:
    U_repressed_promoter > Tstar_protein + U_basal_promoter
    1 * U_repressed_promoter
Tstar_activates_V:
    Tstar_protein + V_basal_promoter > V_activated_promoter
    %s * Tstar_protein * V_basal_promoter
Tstar_unactivates_V:
    V_activated_promoter > Tstar_protein + V_basal_promoter
    1 * V_activated_promoter
Tstar_represses_V:
    Tstar_protein + V_basal_promoter > V_repressed_promoter
    %s * Tstar_protein * V_basal_promoter
Tstar_unrepresses_V:
    V_repressed_promoter > Tstar_protein + V_basal_promoter
    1 * V_repressed_promoter
Tstar_activates_X:
    Tstar_protein + X_basal_promoter > X_activated_promoter
    %s * Tstar_protein * X_basal_promoter
Tstar_unactivates_X:
    X_activated_promoter > Tstar_protein + X_basal_promoter
    1 * X_activated_promoter
Tstar_represses_X:
    Tstar_protein + X_basal_promoter > X_repressed_promoter
    %s * Tstar_protein * X_basal_promoter
Tstar_unrepresses_X:
    X_repressed_promoter > Tstar_protein + X_basal_promoter
    1 * X_repressed_promoter
Tstar_activates_Y:
    Tstar_protein + Y_basal_promoter > Y_activated_promoter
    %s * Tstar_protein * Y_basal_promoter
Tstar_unactivates_Y:
    Y_activated_promoter > Tstar_protein + Y_basal_promoter
    1 * Y_activated_promoter
Tstar_represses_Y:
    Tstar_protein + Y_basal_promoter > Y_repressed_promoter
    %s * Tstar_protein * Y_basal_promoter
Tstar_unrepresses_Y:
    Y_repressed_promoter > Tstar_protein + Y_basal_promoter
    1 * Y_repressed_promoter
Tstar_activates_Z:
    Tstar_protein + Z_basal_promoter > Z_activated_promoter
    %s * Tstar_protein * Z_basal_promoter
Tstar_unactivates_Z:
    Z_activated_promoter > Tstar_protein + Z_basal_promoter
    1 * Z_activated_promoter
Tstar_represses_Z:
    Tstar_protein + Z_basal_promoter > Z_repressed_promoter
    %s * Tstar_protein * Z_basal_promoter
Tstar_unrepresses_Z:
    Z_repressed_promoter > Tstar_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for "eating protein" P
# transcription rates
P_activated_transcription:
    P_activated_promoter + {alpha} ATP > P_activated_promoter + P_mrna
    activated_transcription_rate * P_activated_promoter
P_basal_transcription:
    P_basal_promoter + {alpha} ATP > P_basal_promoter + P_mrna
    basal_transcription_rate * P_basal_promoter
P_repressed_transcription:
    P_repressed_promoter + {alpha} ATP > P_repressed_promoter + P_mrna
    repressed_transcription_rate * P_repressed_promoter
# translation rates
P_translation:
    P_mrna + {beta} ATP > P_mrna + P_protein
    translation_rate * P_mrna
# degredation rates
P_mrna_deg:
    P_mrna > $pool
    mRNA_degradation_rate * P_mrna
P_protein_deg:
    P_protein > $pool
    protein_degradation_rate * P_protein
# end basic gene parameters
# P special interactions:

P_eats_sugar:
    P_protein + S > P_protein + {gamma} ATP
    sugar_eating_rate * P_protein * S

# interactions with other genes:
P_activates_P:
    P_protein + P_basal_promoter > P_activated_promoter
    %s * P_protein * P_basal_promoter
P_unactivates_P:
    P_activated_promoter > P_protein + P_basal_promoter
    1 * P_activated_promoter
P_represses_P:
    P_protein + P_basal_promoter > P_repressed_promoter
    %s * P_protein * P_basal_promoter
P_unrepresses_P:
    P_repressed_promoter > P_protein + P_basal_promoter
    1 * P_repressed_promoter
P_activates_T:
    P_protein + T_basal_promoter > T_activated_promoter
    %s * P_protein * T_basal_promoter
P_unactivates_T:
    T_activated_promoter > P_protein + T_basal_promoter
    1 * T_activated_promoter
P_represses_T:
    P_protein + T_basal_promoter > T_repressed_promoter
    %s * P_protein * T_basal_promoter
P_unrepresses_T:
    T_repressed_promoter > P_protein + T_basal_promoter
    1 * T_repressed_promoter
P_activates_U:
    P_protein + U_basal_promoter > U_activated_promoter
    %s * P_protein * U_basal_promoter
P_unactivates_U:
    U_activated_promoter > P_protein + U_basal_promoter
    1 * U_activated_promoter
P_represses_U:
    P_protein + U_basal_promoter > U_repressed_promoter
    %s * P_protein * U_basal_promoter
P_unrepresses_U:
    U_repressed_promoter > P_protein + U_basal_promoter
    1 * U_repressed_promoter
P_activates_V:
    P_protein + V_basal_promoter > V_activated_promoter
    %s * P_protein * V_basal_promoter
P_unactivates_V:
    V_activated_promoter > P_protein + V_basal_promoter
    1 * V_activated_promoter
P_represses_V:
    P_protein + V_basal_promoter > V_repressed_promoter
    %s * P_protein * V_basal_promoter
P_unrepresses_V:
    V_repressed_promoter > P_protein + V_basal_promoter
    1 * V_repressed_promoter
P_activates_X:
    P_protein + X_basal_promoter > X_activated_promoter
    %s * P_protein * X_basal_promoter
P_unactivates_X:
    X_activated_promoter > P_protein + X_basal_promoter
    1 * X_activated_promoter
P_represses_X:
    P_protein + X_basal_promoter > X_repressed_promoter
    %s * P_protein * X_basal_promoter
P_unrepresses_X:
    X_repressed_promoter > P_protein + X_basal_promoter
    1 * X_repressed_promoter
P_activates_Y:
    P_protein + Y_basal_promoter > Y_activated_promoter
    %s * P_protein * Y_basal_promoter
P_unactivates_Y:
    Y_activated_promoter > P_protein + Y_basal_promoter
    1 * Y_activated_promoter
P_represses_Y:
    P_protein + Y_basal_promoter > Y_repressed_promoter
    %s * P_protein * Y_basal_promoter
P_unrepresses_Y:
    Y_repressed_promoter > P_protein + Y_basal_promoter
    1 * Y_repressed_promoter
P_activates_Z:
    P_protein + Z_basal_promoter > Z_activated_promoter
    %s * P_protein * Z_basal_promoter
P_unactivates_Z:
    Z_activated_promoter > P_protein + Z_basal_promoter
    1 * Z_activated_promoter
P_represses_Z:
    P_protein + Z_basal_promoter > Z_repressed_promoter
    %s * P_protein * Z_basal_promoter
P_unrepresses_Z:
    Z_repressed_promoter > P_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# Sugar interactions

Sugar_enters_system:
    $pool > S
    sugar_entering_rate

Sugar_leaves_system:
    S > $pool
    sugar_leaving_rate * S

# Global parameters
activated_transcription_rate = 10
basal_transcription_rate = 1
repressed_transcription_rate = 0.1
translation_rate = 1
protein_degradation_rate = 1
mRNA_degradation_rate = 1
sugar_entering_rate = 10
sugar_leaving_rate = 1
sugar_eating_rate = 100
#perhaps increase sugar eating rate?
T_activation_rate = 100
T_deactivation_rate = 0.1


# total variable params: 98

# Initial conditions

X_basal_promoter = 1
X_activated_promoter = 0
X_repressed_promoter = 0

Y_basal_promoter = 1
Y_activated_promoter = 0
Y_repressed_promoter = 0

Z_basal_promoter = 1
Z_activated_promoter = 0
Z_repressed_promoter = 0

U_basal_promoter = 1
U_activated_promoter = 0
U_repressed_promoter = 0

V_basal_promoter = 1
V_activated_promoter = 0
V_repressed_promoter = 0

T_basal_promoter = 1
T_activated_promoter = 0
T_repressed_promoter = 0

P_basal_promoter = 1
P_activated_promoter = 0
P_repressed_promoter = 0

X_mrna = 10
X_protein = 10

Y_mrna = 10
Y_protein = 10

Z_mrna = 10
Z_protein = 10

U_mrna = 10
U_protein = 10

V_mrna = 10
V_protein = 10

T_mrna = 10
T_protein = 10
Tstar_protein = 0

P_mrna = 0
P_protein = 0

S = 0
ATP = 100

