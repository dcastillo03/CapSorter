
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
		CapsDistributed : UDINT;
		TimeInAuto_s : UDINT;
		TotalCapCount : UDINT;
		CapSorted : BOOL;
		Error : BOOL;
		Ready : BOOL;
		Connected : BOOL;
		ErrorID : CommsErrorEnum;
	END_STRUCT;
	SortCmdType : 	STRUCT 
		Start : BOOL;
		Stop : BOOL;
		Clear : BOOL;
		DoManual : BOOL;
	END_STRUCT;
	SortParType : 	STRUCT 
		SortAutoStart : BOOL;
		DistAutoStart : BOOL;
	END_STRUCT;
	SortIOType : 	STRUCT 
		Inputs : SortCommsType;
		Outputs : SortCommsType;
	END_STRUCT;
	SortConnectedEnum : 
		(
		sortIDLE,
		sortAUTO_SORT,
		sortAUTO_DIST,
		sortMANUAL,
		sortERROR
		);
	InternalType : 	STRUCT 
		State : SortConnectedEnum;
		Cmd : InternalCmdType;
	END_STRUCT;
	CommsErrorEnum : 
		(
		commsERROR_NONE,
		commsCONNECTION_LOST := -4000,
		commsDISTRIBUTION_ERROR := -5000
		);
	InternalCmdType : 	STRUCT 
		ErrorReset : BOOL; (*command for error reset*)
	END_STRUCT;
END_TYPE
