
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE IO.Inputs.Status.Connected OF
		
		sortDISCONNECTED:
			
		sortCONNECTED:
		
			IF IO.Outputs.Par.DistAutoStart THEN
				gSortingManager.Cmd.Start = TRUE;
			ELSIF IO.Outputs.Cmd.Start THEN
				gSortingManager.Cmd.Start = TRUE;
			END_IF
	
			IF IO.Outputs.Cmd.Stop THEN
				gSortingManager.Cmd.Stop = TRUE;
			END_IF
		
	END_CASE
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

