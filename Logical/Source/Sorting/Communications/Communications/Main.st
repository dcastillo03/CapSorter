
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	CASE Internal.State OF
		
		sortIDLE:
			IF NOT IO.Inputs.Status.Connected THEN
				IO.Outputs.Status.Error := TRUE;
			ELSE
				IF IO.Outputs.Par.SortAutoStart THEN
					Internal.State := sortAUTO_SORT;
				ELSIF IO.Outputs.Cmd.DoManual THEN
					Internal.State := sortMANUAL;
				ELSIF IO.Inputs.Par.DistAutoStart THEN
					Internal.State := sortAUTO_DIST;
				END_IF
			END_IF
			
		sortAUTO_DIST:
			
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			gSortingManager.Cmd.Start := IO.Outputs.Cmd.Start;
			gSortingManager.Cmd.Stop := IO.Outputs.Cmd.Stop;
			
		sortAUTO_SORT:
			
			IF NOT IO.Inputs.Status.Connected THEN
				Internal.State := sortIDLE;
			END_IF
			
			IO.Outputs.Cmd.Start := IO.Inputs.Cmd.Start;
			IO.Outputs.Cmd.Stop := IO.Inputs.Cmd.Stop;
			
		sortMANUAL:
		
	END_CASE
	
	IO.Outputs.Par.SortAutoStart := IO.Outputs.Cmd.Start;
	IO.Outputs.Status.CapSorted := gSortingManager.Status.Done;
	
	IO.Outputs.Status.BlackCapCount := gSortingManager.Status.BlackCount;
	IO.Outputs.Status.RedCapCount := gSortingManager.Status.RedCount;
	IO.Outputs.Status.MetalCapCount := gSortingManager.Status.MetalCount;
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

