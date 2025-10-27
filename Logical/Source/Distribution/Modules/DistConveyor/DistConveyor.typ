
TYPE
	DistConveyorInterfaceTyp : 	STRUCT 
		Cmd : DistConveyorCmdTyp;
		Par : DistConveyorParTyp;
		Status : DistConveyorStatusTyp;
	END_STRUCT;
	DistConveyorCmdTyp : 	STRUCT 
		Enable : BOOL;
		JogFwd : BOOL;
		JogBwd : BOOL;
		MoveFwd : BOOL;
		Power : BOOL;
		UpdatePar : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	DistConveyorParTyp : 	STRUCT 
		SetSpeed_mms : REAL;
		JogSpeed_mms : REAL;
		MoveAcceleration_mmss : REAL;
		JogAcceleration_mmss : REAL;
	END_STRUCT;
	DistConveyorStatusTyp : 	STRUCT 
		Active : BOOL;
		PowerOn : BOOL;
		Moving : BOOL;
		Velocity_mms : REAL;
		CapAtDropOff : BOOL;
		CapInTransit : BOOL;
		CapAtExit : BOOL;
		ModuleOK : BOOL;
		Error : BOOL;
		ErrorID : DistConveyorErrorIDEnum;
		AxisError : BOOL;
		AxisStatusID : DINT;
	END_STRUCT;
	DistConveyorErrorIDEnum : 
		(
		errCONV_NONE,
		errCONV_CAP_LOST,
		errCONV_CAP_OFF_BACK,
		errCONV_MODULE_NOT_OK
		);
END_TYPE
