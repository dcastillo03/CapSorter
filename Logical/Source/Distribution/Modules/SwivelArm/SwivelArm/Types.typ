
TYPE
	ArmInternalTyp : 	STRUCT 
		Cmd : ArmCmdTyp;
		Par : ArmParTyp;
		Status : ArmStatusTyp;
	END_STRUCT;
	ArmIOTyp : 	STRUCT 
		Input : ArmInputTyp;
		Output : ArmOutputTyp;
	END_STRUCT;
	ArmInputTyp : 	STRUCT 
		diSwivelArmAtDropoff : BOOL;
		diSwivelArmAtPickup : BOOL;
		diCapGripperVacuum : BOOL;
		InputModuleOK : BOOL;
		OutputModuleOK : BOOL;
	END_STRUCT;
	ArmOutputTyp : 	STRUCT 
		doSwivelArmFwd : BOOL;
		doSwivelArmBwd : BOOL;
		doCapGripperPick : BOOL;
		doCapGripperEject : BOOL;
	END_STRUCT;
END_TYPE
