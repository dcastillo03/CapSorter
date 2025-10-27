
TYPE
	DistConveyorInterfaceTyp : 	STRUCT  (*Interface to pass cmds, pars, and statuses to/from the task*)
		Cmd : DistConveyorCmdTyp; (*Commands*)
		Par : DistConveyorParTyp; (*Parameters*)
		Status : DistConveyorStatusTyp; (*Statuses*)
	END_STRUCT;
	DistConveyorCmdTyp : 	STRUCT 
		Enable : BOOL; (*Enable module*)
		JogFwd : BOOL; (*Jog the conveyor forward at set jog speed*)
		JogBwd : BOOL; (*Jog the conveyor backward at set jog speed*)
		MoveFwd : BOOL; (*Move the conveyor forward at set speed*)
		Power : BOOL; (*Power the axis on*)
		UpdatePar : BOOL; (*Update parameters*)
		ErrorReset : BOOL; (*Reset error state*)
	END_STRUCT;
	DistConveyorParTyp : 	STRUCT 
		SetSpeed_mms : REAL; (*Set movement speed (mm/s)*)
		JogSpeed_mms : REAL; (*Set jog speed (mm/s)*)
		MoveAcceleration_mmss : REAL; (*Set move acceleration/deceleration (mm/s^2)*)
		JogAcceleration_mmss : REAL; (*Set jog acceleration/deceleration (mm/s^2)*)
	END_STRUCT;
	DistConveyorStatusTyp : 	STRUCT 
		Active : BOOL; (*Module is active*)
		PowerOn : BOOL; (*Axis is powered on*)
		Moving : BOOL; (*Conveyor is actively moving*)
		Velocity_mms : REAL; (*Current velocity of conveyor (mm/s)*)
		CapAtDropOff : BOOL; (*Cap is sensed at drop off point*)
		CapInTransit : BOOL; (*Cap is between drop off and exit*)
		CapAtExit : BOOL; (*Cap is sensed at exit point*)
		ModuleOK : BOOL; (*Hardware module is OK*)
		Error : BOOL; (*Module is in an error state*)
		ErrorID : DistConveyorErrorIDEnum; (*ID of current error state*)
		AxisError : BOOL; (*Axis is in an error state*)
		AxisStatusID : DINT; (*ID of current axis status*)
	END_STRUCT;
	DistConveyorErrorIDEnum : 
		(
		errCONV_NONE, (*No error reported*)
		errCONV_CAP_LOST, (*The cap did not make it from drop off to the exit*)
		errCONV_CAP_OFF_BACK, (*The cap fell off the back of the conveyor*)
		errCONV_MODULE_NOT_OK (*Hardware module(s) not OK*)
		);
END_TYPE
