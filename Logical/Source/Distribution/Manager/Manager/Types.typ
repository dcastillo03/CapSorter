
TYPE
	AutoInterfaceTyp : 	STRUCT 
		Cmd : AutoCmdTyp;
		Status : AutoStatusTyp;
		State : AutoStateTyp;
	END_STRUCT;
	AutoCmdTyp : 	STRUCT 
		EnableModules : BOOL;
		Start : BOOL;
		Stop : BOOL;
		Home : BOOL;
		CapsCleared : BOOL;
	END_STRUCT;
	AutoStatusTyp : 	STRUCT 
		ModulesEnabled : BOOL;
		HomeStarted : BOOL;
		HomeDone : BOOL;
		ConveyorHomed : BOOL;
		DistBayHomed : BOOL;
		SwivelArmHomed : BOOL;
	END_STRUCT;
	AutoStateTyp : 	STRUCT 
		CapEjected : BOOL;
		CapGripped : BOOL;
		CapDroppedOff : BOOL;
		CapSent : BOOL;
		CapSorted : BOOL;
	END_STRUCT;
END_TYPE
