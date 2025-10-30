
TYPE
	MoveCapCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		JogFwd : BOOL; (*Command for jogging conveyor fwd*)
		JogBkwd : BOOL; (*Command for jogging conveyor bkwd*)
		MoveFwd : BOOL; (*Command for moving conveyor fwd*)
		UpdatePars : BOOL; (*Command for updating jogging pars*)
		PowerOn : BOOL; (*Command for powering on conveyor*)
	END_STRUCT;
	MoveCapErrorEnum : 
		(
		mcERROR_NONE := 0, (*No error*)
		mcERROR_MODULE_NOT_OK := -1000 (*X67 drive is not properly detected*)
		);
	MoveCapParType : 	STRUCT 
		JogVel : REAL; (*Parameter for jogging vel*)
		JogAccel : REAL; (*Parameter for jogging accel*)
		JogDecel : REAL; (*Parameter for jogging decel*)
		Vel : REAL; (*Parameter for velocity*)
		Accel : REAL; (*Parameter for accel*)
		Decel : REAL; (*Paremeter for decel*)
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
