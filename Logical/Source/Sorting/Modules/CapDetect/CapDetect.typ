
TYPE
	CapDetectCmdType : 	STRUCT 
		Enable : BOOL; (*Enable command*)
		Start : BOOL; (*Start command*)
		Stop : BOOL; (*Stop command*)
	END_STRUCT;
	CapDetectStatusType : 	STRUCT 
		Active : BOOL; (*Task is active status*)
		Done : BOOL; (*Task done status*)
		Error : BOOL; (*Task errored status*)
		ModuleOk : BOOL; (*DI IO slice ModuleOk status*)
		Stopped : BOOL; (*Task stopped status*)
		ErrorID : cdErrorEnum; (*ErrorID status*)
	END_STRUCT;
	CapDetectType : 	STRUCT 
		Cmd : CapDetectCmdType; (*CommandType for cap detect structure*)
		Status : CapDetectStatusType; (*StatusStype for cap detect structure*)
		Par : CapDetectParType; (*ParType for cap detect structure*)
	END_STRUCT;
	CapDetectParType : 	STRUCT 
		ProductAvailable : BOOL; (*Parameter for if cap is present*)
		CapColor : CapColorEnum; (*Parameter for cap color (ENUM)*)
	END_STRUCT;
	cdErrorEnum : 
		(
		cdERROR_NONE := 0, (*No errors*)
		cdERROR_MODULE_NOT_OK := -1000 (*DI Module not detected*)
		);
	CapColorEnum : 
		(
		cdCAP_NONE := 0, (*No cap present*)
		cdCAP_BLACK := 1, (*Cap is color black*)
		cdCAP_RED := 2, (*Cap is color red*)
		cdCAP_METAL := 3 (*Cap is color metallic*)
		);
END_TYPE
