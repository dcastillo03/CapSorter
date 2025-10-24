
TYPE
	BayInterfaceTyp : 	STRUCT  (*Interface structure to communicate with manager task*)
		Cmd : BayCmdTyp; (*Commands to be received from manager task*)
		Status : BayStatusTyp; (*Status to be reported to the manager task*)
	END_STRUCT;
	BayCmdTyp : 	STRUCT 
		Enable : BOOL; (*Cmd to enable distribution bay*)
		Eject : BOOL; (*Cmd to extend the ejector rod*)
		ErrorReset : BOOL; (*Cmd to reset error state*)
	END_STRUCT;
	BayStatusTyp : 	STRUCT 
		Active : BOOL; (*Module is active and ready to accept commands*)
		CapEjected : BOOL; (*Cap has been ejected*)
		MagazineEmpty : BOOL; (*Cap magazine is empty*)
		Error : BOOL; (*Module is in error state*)
		ErrorID : BayErrorIDEnum; (*Identifier of current error state*)
	END_STRUCT;
	BayErrorIDEnum : 
		(
		errorNONE, (*No error reported*)
		errorEJECTOR_TIMEOUT, (*Ejection rod has taken too long to extend/retract*)
		errorINPUT_MODULE_NOT_OK, (*X20DI9371 is reporting not OK*)
		errorOUTPUT_MODULE_NOT_OK (*X20DO9322 is reporting not OK*)
		);
END_TYPE
