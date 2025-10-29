
TYPE
	CapArmCtrlCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		MoveSwitch : BOOL; (*Command for moving switches*)
		DoRetractStopper : BOOL; (*Command for retracting stopper*)
		MoveFrontSwitch : BOOL; (*Command for enabling front switch*)
		MoveBackSwitch : BOOL; (*Command for enabling rear switch*)
	END_STRUCT;
	CapArmCtrlParType : 	STRUCT 
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
		ProductAvailable : BOOL; (*Parameter for if a cap is available*)
	END_STRUCT;
	CapArmCtrlStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
		LaneIsFull : BOOL; (*Status for a lane being too full*)
		CapIsSorted : BOOL; (*Parameter for if the cap has been sorted*)
		CapIdentified : BOOL; (*Parameter for cap being identified*)
		ErrorID : CapArmCtrlErrorEnum; (*ErrorID status*)
	END_STRUCT;
	CapArmCtrlType : 	STRUCT 
		Cmd : CapArmCtrlCmdType; (*Command type for cap arm ctrl structure*)
		Status : CapArmCtrlStatusType; (*Status type for cap arm ctrl structure*)
		Par : CapArmCtrlParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
	CapArmCtrlErrorEnum : 
		(
		cacERROR_NONE := 0, (*No error*)
		cacERROR_MODULE_NOT_OK := -1000 (*DO9322 is not seated correctly or not detecting*)
		);
END_TYPE
