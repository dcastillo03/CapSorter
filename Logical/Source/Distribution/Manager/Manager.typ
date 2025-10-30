
TYPE
	AutoInterfaceTyp : 	STRUCT 
		Cmd : AutoCmdTyp;
		Status : AutoStatusTyp;
		State : AutoStateTyp;
	END_STRUCT;
	AutoCmdTyp : 	STRUCT 
		EnableModules : BOOL;
		EnableAutoMode : BOOL;
		EnableManualMode : BOOL;
		Start : BOOL;
		Stop : BOOL;
		Home : BOOL;
		Clear : BOOL;
		CapsCleared : BOOL;
	END_STRUCT;
	AutoStatusTyp : 	STRUCT 
		ModulesEnabled : BOOL := TRUE;
		HomeStarted : BOOL;
		HomeDone : BOOL;
		ConveyorHomed : BOOL;
		DistBayHomed : BOOL;
		SwivelArmHomed : BOOL;
		AutoStartTime : TIME;
		AutoCurrentTime : TIME;
		TimeInAuto_ms : TIME;
		TimeInAuto_s : UDINT;
		CapsDistributed : UDINT;
	END_STRUCT;
	AutoStateTyp : 	STRUCT 
		CapEjected : BOOL;
		CapGripped : BOOL;
		CapAtDropOff : BOOL;
		CapDroppedOff : BOOL;
		CapSent : BOOL;
		CapSorted : BOOL;
	END_STRUCT;
END_TYPE
