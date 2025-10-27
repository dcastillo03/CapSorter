
TYPE
	ArmInterfaceTyp : 	STRUCT  (*Interface to pass commands, parameters, and statuses to/from module*)
		Cmd : ArmCmdTyp; (*Commands*)
		Par : ArmParTyp; (*Parameters*)
		Status : ArmStatusTyp; (*Statuses*)
	END_STRUCT;
	ArmCmdTyp : 	STRUCT 
		Enable : BOOL; (*Enable the module*)
		MoveFwd : BOOL; (*Move swivel arm fwd (to drop-off)*)
		MoveBwd : BOOL; (*Move swivel arm bwd (to pickup)*)
		GripCap : BOOL; (*Turn on gripper vacuum*)
		EjectCap : BOOL; (*Turn on gripper ejection flow*)
		ErrorReset : BOOL; (*Reset error state*)
	END_STRUCT;
	ArmParTyp : 	STRUCT 
		CanGrip : BOOL; (*Gripper vacuum can be turned on*)
		CanRelease : BOOL; (*Cap is OK to be released (only at drop-off)*)
		CanMoveFwd : BOOL; (*Swivel arm can move forward*)
	END_STRUCT;
	ArmStatusTyp : 	STRUCT 
		Active : BOOL; (*Module is active*)
		ArmAtPickup : BOOL; (*Swivel arm at pickup point*)
		ArmAtDropoff : BOOL; (*Swivel arm is at drop-off point*)
		CapGripped : BOOL; (*Gripper currently has a cap*)
		ModuleOK : BOOL; (*Hardware module(s) OK*)
		Error : BOOL; (*Module in error state*)
		ErrorID : ArmErrorIDEnum; (*ID of current error state*)
	END_STRUCT;
	ArmErrorIDEnum : 
		(
		errARM_NONE, (*No error reported*)
		errARM_CAP_LOST_IN_TRANSIT, (*Cap has been prematurely released from the gripper*)
		errARM_INPUT_MODULE_NOT_OK, (*Input module reporting not OK*)
		errARM_OUTPUT_MODULE_NOT_OK (*Output module reporting not OK*)
		);
END_TYPE
