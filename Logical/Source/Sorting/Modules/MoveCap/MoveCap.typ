
TYPE
	MoveCapCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		JogFwd : BOOL;
		JogBkwd : BOOL;
		MoveFwd : BOOL;
	END_STRUCT;
	MoveCapErrorEnum : 
		(
		mcERROR_NONE := 0, (*No error*)
		mcERROR_MODULE_NOT_OK := -1000 (*X67 drive is not properly detected*)
		);
	MoveCapParType : 	STRUCT 
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
		ProductAvailable : BOOL; (*Parameter for if a cap is available*)
		CapIdentified : BOOL; (*Parameter for cap being identified*)
		ArmsDone : BOOL; (*Parameter for the appropriate arms being fully actuated*)
	END_STRUCT;
	MoveCapStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*X67 ModuleOK status*)
		Stopped : BOOL; (*Task stopped status*)
		ErrorID : MoveCapErrorEnum; (*ErrorID status*)
	END_STRUCT;
	MoveCapType : 	STRUCT 
		Cmd : MoveCapCmdType; (*Command type for cap arm ctrl structure*)
		Status : MoveCapStatusType; (*Status type for cap arm ctrl structure*)
		Par : MoveCapParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
END_TYPE
