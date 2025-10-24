
TYPE
	CapArmCtrlCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
	END_STRUCT;
	CapArmCtrlParType : 	STRUCT 
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
	END_STRUCT;
	CapArmCtrlStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
		ErrorID : cdErrorEnum; (*ErrorID status*)
	END_STRUCT;
	CapArmCtrlType : 	STRUCT 
		Cmd : CapArmCtrlCmdType; (*Command type for cap arm ctrl structure*)
		Status : CapArmCtrlStatusType; (*Status type for cap arm ctrl structure*)
		Par : CapArmCtrlParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
END_TYPE
