
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
		diMetalCap : BOOL;
		diCapIsShiny : BOOL;
	END_STRUCT;
	CapDetectParType : 	STRUCT 
		ProductAvailable : BOOL;
		CapColor : CapColorEnum;
	END_STRUCT;
	CapColorEnum : 
		(
		cdCAP_NONE := 0,
		cdCAP_BLACK := 1,
		cdCAP_RED := 2,
		cdCAP_METAL := 3
		);
END_TYPE
