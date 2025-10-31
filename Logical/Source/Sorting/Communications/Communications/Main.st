
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
			
		sortAUTO_DIST:
			
			IF IO.Outputs.Status.Error THEN
				Internal.State := sortERROR;
			END_IF
			
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			gSortingManager.Cmd.Auto := IO.Inputs.Par.DistAutoStart;
			gSortingManager.Cmd.PowerOn := TRUE;
			
			IF gSortingManager.Cmd.PowerOn THEN
				IO.Outputs.Status.Ready := TRUE;
			END_IF
			
			gSortingManager.Cmd.Start := IO.Inputs.Cmd.Start;
			gSortingManager.Cmd.Stop := IO.Inputs.Cmd.Stop;
			gSortingManager.Cmd.Clear := IO.Inputs.Cmd.Clear;
			
			IF NOT IO.Inputs.Par.DistAutoStart THEN
				Internal.State := sortIDLE;
			END_IF
			
			IF IO.Inputs.Status.Error THEN
				IO.Outputs.Status.ErrorID := commsDISTRIBUTION_ERROR;
			END_IF
			
			
		sortAUTO_SORT:
			
			IF IO.Outputs.Status.Error THEN
				Internal.State := sortERROR;
			END_IF
			
			
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			IF IO.Inputs.Status.Ready THEN
				
				IO.Outputs.Par.SortAutoStart := gSortingManager.Cmd.Auto;
				
				gSortingManager.Cmd.Start := IO.Outputs.Cmd.Start;
				gSortingManager.Cmd.Stop := IO.Outputs.Cmd.Stop;
				gSortingManager.Cmd.Clear := IO.Outputs.Cmd.Clear;
				
			END_IF
			
			IF gAlarm.Core.ActiveAlarms > 0 THEN
				IO.Outputs.Status.Error := TRUE;
			END_IF
			
			
			IF NOT gSortingManager.Cmd.Auto THEN
				Internal.State := sortIDLE;
			END_IF
			
			
		sortMANUAL:
		
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
	
	IO.Outputs.Status.CapSorted := gSortingManager.Status.Done;
	
	IO.Outputs.Status.BlackCapCount := gSortingManager.Status.BlackCount;
	IO.Outputs.Status.RedCapCount := gSortingManager.Status.RedCount;
	IO.Outputs.Status.MetalCapCount := gSortingManager.Status.MetalCount;
	IO.Outputs.Status.TotalCapCount := gSortingManager.Status.BlackCount + gSortingManager.Status.RedCount + gSortingManager.Status.MetalCount;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

