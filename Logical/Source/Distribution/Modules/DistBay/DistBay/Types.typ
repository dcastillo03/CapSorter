
TYPE
	BayInternalTyp : 	STRUCT  (*Internal structure for old cmds and new statuses*)
		Cmd : BayCmdTyp;
		Status : BayStatusTyp;
	END_STRUCT;
	BayIOTyp : 	STRUCT  (*IO to be passed to/from the task*)
		Input : BayInputTyp;
		Output : BayOutputTyp;
	END_STRUCT;
	BayInputTyp : 	STRUCT 
		diMagazineEmpty : BOOL; (*True = Out of caps*)
		diEjectorRetracted : BOOL; (*Ejector rod is fully retracted*)
		diEjectorExtended : BOOL; (*Ejector rod is fully extended*)
		InputModuleOK : BOOL; (*X20DI9371 Module is OK*)
		OutputModuleOK : BOOL; (*X20DO9322 Module is OK*)
	END_STRUCT;
	BayOutputTyp : 	STRUCT 
		doEjectCap : BOOL; (*Extend ejector rod*)
	END_STRUCT;
END_TYPE
