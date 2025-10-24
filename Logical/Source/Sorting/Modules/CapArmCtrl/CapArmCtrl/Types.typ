
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
	END_STRUCT;
END_TYPE
