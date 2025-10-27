
TYPE
	InternalType : 	STRUCT 
		Cmd : CapDetectCmdType; (*Command type for cap detection*)
		Status : CapDetectStatusType; (*Status type for cap detection*)
		Par : CapDetectParType; (*Parameter type for cap detection*)
	END_STRUCT;
	IOType : 	STRUCT 
		Inputs : InputsType; (*IO InputsType*)
	END_STRUCT;
	InputsType : 	STRUCT 
		diProductAvailable : BOOL; (*DI mapped to hardware for if a cap is present*)
		diMetalCap : BOOL; (*DI mapped to hardware for if a cap is metallic*)
		diCapIsShiny : BOOL; (*DI mapped to hardware for if a cap is shiny (red or metallic)*)
	END_STRUCT;
	DelayTimerType : 	STRUCT 
		DetectTime : TON;
		TIME_DELAY : TIME := T#250ms;
	END_STRUCT;
END_TYPE
