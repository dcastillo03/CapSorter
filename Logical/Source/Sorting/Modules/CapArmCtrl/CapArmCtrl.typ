
TYPE
	CapArmCtrlCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		MoveSwitchOne : BOOL; (*Command for moving switch one*)
		MoveSwitchTwo : BOOL; (*Command for moving switch two*)
		DoRetractStopper : BOOL; (*Command for retracting stopper*)
	END_STRUCT;
	CapArmCtrlParType : 	STRUCT 
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
		ProductAvailable : BOOL; (*Parameter for if a cap is available*)
		CapIsMetal : BOOL;
		CapIsRed : BOOL;
		CapIsBlack : BOOL;
	END_STRUCT;
	CapArmCtrlStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
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
