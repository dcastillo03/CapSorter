
TYPE
	ManagerCmdType : 	STRUCT 
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		JogFwd : BOOL; (*Jog foward command*)
		JogBkwd : BOOL; (*Jog backward command*)
		MoveFrontSwitch : BOOL; (*Command for moving front arm switch*)
		MoveBackSwitch : BOOL; (*Command for moving back arm switch*)
		DoRetractStopper : BOOL; (*Command for actuating stopper*)
	END_STRUCT;
	ManagerErrorEnum : 
		(
		mgERROR_NONE := 0, (*No error*)
		mgERROR_MODULE_NOT_OK := -1000 (*X67 drive is not properly detected*)
		);
	ManagerParType : 	STRUCT 
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
		ProductAvailable : BOOL; (*Parameter for if a cap is available*)
		CapIdentified : BOOL; (*Parameter for cap being identified*)
		ArmsDone : BOOL; (*Parameter for the appropriate arms being fully actuated*)
	END_STRUCT;
	ManagerStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
		TooFull : BOOL; (*Status for a lane being too full*)
		ErrorID : ManagerErrorEnum; (*ErrorID status*)
	END_STRUCT;
	ManagerType : 	STRUCT 
		Cmd : ManagerCmdType; (*Command type for cap arm ctrl structure*)
		Status : ManagerStatusType; (*Status type for cap arm ctrl structure*)
		Par : ManagerParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
END_TYPE
