
PROGRAM _INIT
	
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	// Send to error state if not connected
	IF NOT IO.Input.Status.Connected THEN
		Internal.Error := TRUE;
		Internal.ErrorID := errCOMM_CONNECTION_LOST;
		Internal.State := distERROR;
	END_IF
	
	// Report ready if distribution station is homed
	IO.Output.Status.Ready := gAutoInterface.Status.HomeDone;
	
	CASE Internal.State OF
		distIDLE: //Wait for operation mode cmd
			
			IF IO.Input.Par.SortAutoStart AND IO.Output.Status.Ready THEN
				Internal.State := distAUTO_SORT;;
			ELSIF IO.Output.Par.DistAutoStart AND IO.Input.Status.Ready THEN
				Internal.State := distAUTO_DIST;
			ELSIF gAutoInterface.Cmd.EnableManualMode THEN
				Internal.State := distMANUAL;
			END_IF
			
		distAUTO_DIST:
			
			
			
		distAUTO_SORT:
			
			
			
		distMANUAL:
			
			
			
		distERROR:
			
			
			
		ELSE
	END_CASE
	 
			END_PROGRAM

PROGRAM _EXIT
	
	
	 
END_PROGRAM

