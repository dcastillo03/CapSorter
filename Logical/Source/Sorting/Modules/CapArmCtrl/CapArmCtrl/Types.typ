
TYPE
	InternalType : 	STRUCT 
		Cmd : CapArmCtrlCmdType; (*Command type for cap arm ctrl structure*)
		Status : CapArmCtrlStatusType; (*Status type for cap arm ctrl structure*)
		Par : CapArmCtrlParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
	OutputType : 	STRUCT 
		doSwitchOne : BOOL; (*Boolean extends switch one*)
		doSwitchTwo : BOOL; (*Boolean extends switch two*)
		doRetractStopper : BOOL; (*Boolean retracts the cap stopper*)
	END_STRUCT;
	IOType : 	STRUCT 
		Outputs : OutputType; (*Output types*)
		Inputs : InputType; (*Input types*)
	END_STRUCT;
	InputType : 	STRUCT 
		diLaneSensor : BOOL; (*Sensor detects if a cap passed through*)
		SwitchOneRetracted : BOOL; (*Input sensor for switch one being retracted*)
		SwitchOneExtended : BOOL; (*Input sensor for switch one being extended*)
		SwitchTwoRetracted : BOOL; (*Input sensor for switch two being retracted*)
		SwitchTwoExtended : BOOL; (*Input sensor for switch two being extended*)
	END_STRUCT;
	CapColorType : 	STRUCT 
		Metal : BOOL; (*Parameter for cap being metal*)
		Red : BOOL; (*Parameter for cap being red*)
		Black : BOOL; (*Parameter for cap being black*)
	END_STRUCT;
	DelayTimerType : 	STRUCT 
		DetectTime : TON; (*Timer FUB*)
		TIME_DELAY : TIME := T#3000ms; (*Constant time*)
		Q : BOOL; (*Timer done bool*)
	END_STRUCT;
END_TYPE
