
PROGRAM _INIT
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE Internal.State OF
		
		sortIDLE:
			// Checks if dist station is connected
			IF NOT IO.Inputs.Status.Connected THEN
				IO.Outputs.Status.Error := TRUE;
				IO.Outputs.Status.ErrorID := commsCONNECTION_LOST;
				Internal.State := sortERROR;
			ELSE
				IO.Outputs.Status.Error := FALSE;
				IO.Outputs.Status.ErrorID := commsERROR_NONE;
				IF gSortingManager.Cmd.Auto THEN
					Internal.State := sortAUTO_SORT;
				ELSIF gSortingManager.Cmd.Manual THEN
					Internal.State := sortMANUAL;
				ELSIF IO.Inputs.Par.DistAutoStart THEN
					Internal.State := sortAUTO_DIST;
				END_IF
				
			END_IF
			
			// If Dist station sent my station to auto mode
		sortAUTO_DIST:
			
			// Checks for errors
			IF IO.Outputs.Status.Error THEN
				Internal.State := sortERROR;
			END_IF
			
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			// Command manager to power on 
			gSortingManager.Cmd.Auto := IO.Inputs.Par.DistAutoStart;
			gSortingManager.Cmd.PowerOn := TRUE;
			
			IF gSortingManager.Cmd.PowerOn THEN
				IO.Outputs.Status.Ready := TRUE;
			END_IF
			
			// Commands manager to start, stop, clear, on command from other station
			gSortingManager.Cmd.Start := IO.Inputs.Cmd.Start;
			gSortingManager.Cmd.Stop := IO.Inputs.Cmd.Stop;
			gSortingManager.Cmd.Clear := IO.Inputs.Cmd.Clear;
			
			// Return to idle when no longer in auto mode
			IF NOT IO.Inputs.Par.DistAutoStart THEN
				Internal.State := sortIDLE;
			END_IF
			
			// Sends error info if manager encounters error
			IF gAlarm.Core.ActiveAlarms > 0 THEN
				IO.Outputs.Status.Error := TRUE;
			END_IF
			
			// Throw error if other station encounters error
			IF IO.Inputs.Status.Error THEN
				IO.Outputs.Status.ErrorID := commsDISTRIBUTION_ERROR;
			END_IF
			
			
		sortAUTO_SORT:
			
			// Checks for error
			IF IO.Outputs.Status.Error THEN
				Internal.State := sortERROR;
			END_IF
			
			// Checks for connection status
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			// Informs other station of auto mode
			IO.Outputs.Par.SortAutoStart := gSortingManager.Cmd.Auto;
			
			// If motor is powered on, ready is true and sent
			IF gSortingManager.Cmd.PowerOn THEN
				IO.Outputs.Status.Ready := TRUE;
			END_IF
		
			// If other station is ready, we can issue a start command
			IF IO.Inputs.Status.Ready THEN
				gSortingManager.Cmd.Start := IO.Outputs.Cmd.Start;
			END_IF
			
			// Issues stop and clear commands as needed
			gSortingManager.Cmd.Stop := IO.Outputs.Cmd.Stop;
			gSortingManager.Cmd.Clear := IO.Outputs.Cmd.Clear;
			
			// If manager encounter error, inform other station
			IF gAlarm.Core.ActiveAlarms > 0 THEN
				IO.Outputs.Status.Error := TRUE;
			END_IF
			
			// Return to idle if not in auto mode
			IF NOT gSortingManager.Cmd.Auto THEN
				Internal.State := sortIDLE;
			END_IF
			
			
		sortMANUAL:
		
			// Return to idle if not in manual
			IF NOT gSortingManager.Cmd.Manual THEN
				Internal.State := sortIDLE;
			END_IF
		
		sortERROR:
			
			IF IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
		
			IF NOT gSortingManager.Status.Error THEN
				Internal.State := sortIDLE;
			END_IF
		
	END_CASE
	
	// Assignments/Sending station other information
	IO.Outputs.Status.CapSorted := gSortingManager.Status.Done;
	
	IO.Outputs.Status.BlackCapCount := gSortingManager.Status.BlackCount;
	IO.Outputs.Status.RedCapCount := gSortingManager.Status.RedCount;
	IO.Outputs.Status.MetalCapCount := gSortingManager.Status.MetalCount;
	IO.Outputs.Status.TotalCapCount := gSortingManager.Status.BlackCount + gSortingManager.Status.RedCount + gSortingManager.Status.MetalCount;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

