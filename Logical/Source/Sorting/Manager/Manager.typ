
TYPE
	ManagerCmdType : 	STRUCT 
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
		JogFwd : BOOL; (*Jog foward command*)
		JogBkwd : BOOL; (*Jog backward command*)
		MoveFrontSwitch : BOOL; (*Command for moving front arm switch*)
		MoveBackSwitch : BOOL; (*Command for moving back arm switch*)
		DoRetractStopper : BOOL; (*Command for actuating stopper*)
		ManualCapDetect : BOOL; (*Command for manually detecting cap*)
		UpdateConveyorPars : BOOL; (*Command for updating conveyor pars*)
		PowerOn : BOOL; (*Command for powering on motor*)
		Auto : BOOL; (*Command for going to auto mode*)
		Manual : BOOL; (*Command for going to manual mode*)
		Clear : BOOL; (*Command for clearing*)
		ErrorReset : BOOL; (*COmmand foe error reset*)
	END_STRUCT;
	ManagerErrorEnum : 
		(
		mgERROR_NONE := 0, (*No error*)
		mgERROR_MODULE_NOT_OK := -1000 (*X67 drive is not properly detected*)
		);
	ManagerParType : 	STRUCT 
		JogVel : REAL; (*Parameter for jogging velocity*)
		JogAccel : REAL; (*Parameter for jogging accel*)
		JogDecel : REAL; (*Paremeter for jogging decel*)
		Vel : REAL; (*Paremeter for velocity*)
		Accel : REAL; (*Paremeter for accel*)
		Decel : REAL; (*Paremeter for decel*)
	END_STRUCT;
	ManagerStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
		TooFull : BOOL; (*Status for a lane being too full*)
		ProductAvailable : BOOL; (*Status for product available*)
		SwitchTwoExtended : BOOL; (*Status for switch two being extended*)
		SwitchOneExtended : BOOL; (*Status for switch one  being extended*)
		RedCount : UDINT; (*Red count status*)
		MetalCount : UDINT; (*Metal count status*)
		BlackCount : UDINT; (*Black count status*)
		CapColorID : UDINT; (*ID number for cap color*)
		CapColor : CapColorEnum; (*Status  for cap color (ENUM)*)
		ErrorID : ManagerErrorEnum; (*ErrorID status*)
	END_STRUCT;
	ManagerType : 	STRUCT 
		Cmd : ManagerCmdType; (*Command type for cap arm ctrl structure*)
		Status : ManagerStatusType; (*Status type for cap arm ctrl structure*)
		Par : ManagerParType; (*Parameter type for cap arm ctrl structure*)
	END_STRUCT;
END_TYPE
