
TYPE
	AxisTyp : 	STRUCT 
		Basic : MpAxisBasic; (*Axis function block*)
		Parameters : MpAxisBasicParType; (*Parameters for axis function block*)
	END_STRUCT;
	IOInputTyp : 	STRUCT 
		CapAtDropOff : BOOL; (*Cap is sensed at drop off point*)
		CapAtExit : BOOL; (*Cap is sensed at exit point*)
		ModuleOK : BOOL; (*Hardware modules are OK*)
	END_STRUCT;
END_TYPE
