# basic gene parameters
# transcription rates
X_activated_transcription:
	X_activated_p > X_activated_p + X_mrna
	%s * X_activated_p
X_basal_transcription:
	X_basal_p > X_basal_p + X_mrna
	%s * X_basal_p
X_repressed_transcription:
	X_repressed_p > X_repressed_p + X_mrna
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