
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	IF IO.Inputs.Status.Connected THEN
		IO.Outputs.Par.DistAutoStart = IO.Inputs.Par.DistAutoStart;
		IO.Outputs.Status = IO.Inputs.Status;
	END_IF
	
	IF IO.Outputs.Par.DistAutoStart THEN
		gSortingManager.Cmd.Start = TRUE;
	END_IF
	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

