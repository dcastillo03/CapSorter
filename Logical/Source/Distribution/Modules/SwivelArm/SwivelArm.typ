
TYPE
	ArmInterfaceTyp : 	STRUCT 
		Cmd : ArmCmdTyp;
		Par : ArmParTyp;
		Status : ArmStatusTyp;
	END_STRUCT;
	ArmCmdTyp : 	STRUCT 
		Enable : BOOL;
		MoveFwd : BOOL;
		MoveBwd : BOOL;
		GripCap : BOOL;
		EjectCap : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	ArmParTyp : 	STRUCT 
		CanGrip : BOOL;
		CanRelease : BOOL;
	END_STRUCT;
	ArmStatusTyp : 	STRUCT 
		Active : BOOL;
		ArmAtPickup : BOOL;
		ArmAtDropoff : BOOL;
		CapGripped : BOOL;
		ModuleOK : BOOL;
		Error : BOOL;
		ErrorID : ArmErrorIDEnum;
	END_STRUCT;
	ArmErrorIDEnum : 
		(
		errorarmNONE,
		errorarmCAP_LOST_IN_TRANSIT,
		errorarmINPUT_MODULE_NOT_OK,
		errorarmOUTPUT_MODULE_NOT_OK
		);
END_TYPE
