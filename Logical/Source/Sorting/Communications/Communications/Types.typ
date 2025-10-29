
TYPE
	SortCommsType : 	STRUCT 
		Status : SortStatusType;
		Cmd : SortCmdType;
		Par : SortParType;
	END_STRUCT;
	SortStatusType : 	STRUCT 
		RedCapCount : UDINT;
		BlackCapCount : UDINT;
		MetalCapCount : UDINT;
		TotalCapCount : UDINT;
		CapSorted : BOOL;
		Error : BOOL;
		Ready : BOOL;
		Connected : BOOL;
	END_STRUCT;
	SortCmdType : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		Clear : BOOL;
	END_STRUCT;
	SortParType : 	STRUCT 
		SortAutoStart : BOOL;
		DistAutoStart : BOOL;
	END_STRUCT;
	SortIOType : 	STRUCT 
		Inputs : SortCommsType;
		Outputs : SortCommsType;
	END_STRUCT;
END_TYPE
