
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
		CapDetected : BOOL;
	END_STRUCT;
	CapDetectParType : 	STRUCT 
		diSensor : BOOL;
	END_STRUCT;
	CapDetectType : 	STRUCT 
		Cmd : CapDetectCmdType;
		Status : CapDetectStatusType;
		Par : CapDetectParType;
	END_STRUCT;
END_TYPE
