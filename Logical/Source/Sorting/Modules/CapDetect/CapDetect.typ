
TYPE
	CapDetectCmdType : 	STRUCT 
		Enable : BOOL;
		Start : BOOL;
		Stop : BOOL;
		ErrorReset : BOOL;
	END_STRUCT;
	CapDetectStatusType : 	STRUCT 
		Active : BOOL;
		Done : BOOL;
		Error : BOOL;
		ModuleOk : BOOL;
		Stopped : BOOL;
	END_STRUCT;
	CapDetectType : 	STRUCT 
		Cmd : CapDetectCmdType;
		Status : CapDetectStatusType;
		Par : CapDetectParType;
	END_STRUCT;
	IOType : 	STRUCT 
		Inputs : InputsType;
	END_STRUCT;
	InputsType : 	STRUCT 
		diProductAvailable : BOOL;
	END_STRUCT;
	CapDetectParType : 	STRUCT 
		ProductAvailable : BOOL;
	END_STRUCT;
END_TYPE
