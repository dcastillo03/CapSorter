
TYPE
	SortCommsType : 	STRUCT  (*Comms type*)
		Status : SortStatusType; (*Status*)
		Cmd : SortCmdType; (*Cmd*)
		Par : SortParType; (*Par*)
	END_STRUCT;
	SortStatusType : 	STRUCT 
		RedCapCount : UDINT; (*Red cap count*)
		BlackCapCount : UDINT; (*BLack cap count*)
		MetalCapCount : UDINT; (*Metak cap count*)
		CapsDistributed : UDINT; (*Caps distributed count*)
		TimeInAuto_s : UDINT; (*Runetime counter*)
		TotalCapCount : UDINT; (*Total cap count*)
		CapSorted : BOOL; (*Cap sorted bool*)
		Error : BOOL; (*Error bool*)
		Ready : BOOL; (*Ready bool*)
		Connected : BOOL; (*Connected boom*)
		ErrorID : CommsErrorEnum; (*Error enum*)
	END_STRUCT;
	SortCmdType : 	STRUCT 
		Start : BOOL; (*Start cmd*)
		Stop : BOOL; (*Stop cmd*)
		Clear : BOOL; (*Clear cmd*)
		DoManual : BOOL; (*Go to manual cmd*)
	END_STRUCT;
	SortParType : 	STRUCT 
		SortAutoStart : BOOL; (*Sorting auto mode par*)
		DistAutoStart : BOOL; (*Dist auto mode par*)
	END_STRUCT;
	SortIOType : 	STRUCT 
		Inputs : SortCommsType; (*IO structure being received from other station*)
		Outputs : SortCommsType; (*IO structure being sent to other station*)
	END_STRUCT;
	SortConnectedEnum : 
		(
		sortIDLE, (*Idle state*)
		sortAUTO_SORT, (*Auto sorting state*)
		sortAUTO_DIST, (*Auto distribution state*)
		sortMANUAL, (*Manual state*)
		sortERROR (*Error state*)
		);
	InternalType : 	STRUCT 
		State : SortConnectedEnum;
		Cmd : InternalCmdType;
	END_STRUCT;
	CommsErrorEnum : 
		(
		commsERROR_NONE, (*No error*)
		commsCONNECTION_LOST := -4000, (*Lost comms to other station*)
		commsDISTRIBUTION_ERROR := -5000 (*Other station had an error*)
		);
	InternalCmdType : 	STRUCT 
		ErrorReset : BOOL; (*Command for error reset*)
	END_STRUCT;
END_TYPE
