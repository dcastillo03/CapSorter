
TYPE
	DistCommunicationTyp : 	STRUCT 
		Cmd : DistCmdTyp;
		Par : DistParTyp;
		Status : DistStatusTyp;
	END_STRUCT;
	DistCmdTyp : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		Clear : BOOL;
	END_STRUCT;
	DistParTyp : 	STRUCT 
		SortAutoStart : BOOL;
		DistAutoStart : BOOL;
	END_STRUCT;
	DistStatusTyp : 	STRUCT 
		TotalCapCount : UDINT;
		RedCapCount : UDINT;
		BlackCapCount : UDINT;
		MetalCapCount : UDINT;
		Error : BOOL;
		CapSorted : BOOL;
		Ready : BOOL;
		Connected : BOOL;
	END_STRUCT;
	DistIOTyp : 	STRUCT 
		Input : DistCommunicationTyp;
		Output : DistCommunicationTyp;
	END_STRUCT;
	DistCommsInternalTyp : 	STRUCT 
		State : DistCommsStateEnum;
		Error : BOOL;
		ErrorID : DistCommsErrorEnum;
	END_STRUCT;
	DistCommsStateEnum : 
		(
		distIDLE,
		distMANUAL,
		distAUTO_SORT,
		distAUTO_DIST,
		distERROR
		);
	DistCommsErrorEnum : 
		(
		errCOMM_NONE,
		errCOMM_CONNECTION_LOST,
		errCOMM_SORT_ERROR
		);
END_TYPE
