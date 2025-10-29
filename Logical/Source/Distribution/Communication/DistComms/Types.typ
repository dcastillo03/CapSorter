
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
END_TYPE
