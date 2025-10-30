
PROGRAM _INIT
	
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	// Send to error state if not connected
	IF NOT IO.Input.Status.Connected AND ((Internal.State = distAUTO_DIST) OR (Internal.State = distAUTO_SORT)) THEN
		Internal.Error := TRUE;
		Internal.ErrorID := errCOMM_CONNECTION_LOST;
		Internal.State := distERROR;
	END_IF
	
	IO.Output.Status.TimeInAuto_s := gAutoInterface.Status.TimeInAuto_s;
	
	Internal.AutoButtonsEnable := (NOT IO.Input.Par.SortAutoStart) AND IO.Output.Par.DistAutoStart;
	Internal.ModeSwitchEnable := NOT IO.Input.Par.SortAutoStart;
	
	// Report ready if distribution station is homed
	IO.Output.Status.Ready := gAutoInterface.Status.HomeDone;
	
	CASE Internal.State OF
		distIDLE: //Wait for operation mode cmd
			
			IF IO.Input.Par.SortAutoStart AND IO.Output.Status.Ready THEN
				gAutoInterface.Cmd.EnableManualMode := FALSE;
				Internal.State := distAUTO_SORT;;
			ELSIF IO.Output.Par.DistAutoStart AND IO.Input.Status.Ready THEN
				gAutoInterface.Cmd.EnableManualMode := FALSE;
				Internal.State := distAUTO_DIST;
			ELSIF gAutoInterface.Cmd.EnableManualMode THEN
				Internal.State := distMANUAL;
			END_IF
			
		distAUTO_DIST:
			
			gAutoInterface.Cmd.Start := IO.Output.Cmd.Start;
			gAutoInterface.Cmd.Stop := IO.Output.Cmd.Stop;
			gAutoInterface.Cmd.Clear := IO.Output.Cmd.Clear;
			IO.Output.Status.CapsDistributed := gAutoInterface.Status.CapsDistributed;
			gAutoInterface.Cmd.EnableAutoMode := TRUE;
			
			IF IO.Input.Status.CapSorted AND NOT IOOld.Input.Status.CapSorted THEN
				gAutoInterface.State.CapSorted := TRUE;
			END_IF
			
			IF NOT IO.Output.Par.DistAutoStart THEN
				gAutoInterface.Cmd.Start := FALSE;
				gAutoInterface.Cmd.Stop := TRUE;
				gAutoInterface.Cmd.EnableAutoMode;
				Internal.State := distIDLE;
			END_IF
			
		distAUTO_SORT:
			
			gAutoInterface.Cmd.Start := IO.Input.Cmd.Start;
			gAutoInterface.Cmd.Stop := IO.Input.Cmd.Stop;
			gAutoInterface.Cmd.Clear := IO.Input.Cmd.Clear;
			IO.Output.Status.CapsDistributed := gAutoInterface.Status.CapsDistributed;
			gAutoInterface.Cmd.EnableAutoMode := TRUE;
			IF IO.Input.Status.CapSorted AND NOT IOOld.Input.Status.CapSorted THEN
				gAutoInterface.State.CapSorted := TRUE;
			END_IF
			
			IF NOT IO.Input.Par.SortAutoStart THEN
				gAutoInterface.Cmd.Start := FALSE;
				gAutoInterface.Cmd.Stop := TRUE;
				gAutoInterface.Cmd.EnableAutoMode;
				Internal.State := distIDLE;
			END_IF
			
		distMANUAL:
			
			gAutoInterface.Cmd.EnableAutoMode := FALSE;
			gDistConveyorInterface.Cmd.MoveFwd := FALSE;
			IF IO.Output.Par.DistAutoStart OR IO.Input.Par.SortAutoStart THEN
				Internal.State := distIDLE;
			END_IF
			
			IF NOT gAutoInterface.Cmd.EnableManualMode THEN
				Internal.State := distIDLE;
			END_IF
			
		distERROR:
			
			IF IO.Input.Status.Connected AND Internal.ErrorID = errCOMM_CONNECTION_LOST THEN
				Internal.Error := FALSE;
				Internal.ErrorID := errCOMM_NONE;
				Internal.ErrorReset := FALSE;
				Internal.State := distIDLE;
			ELSIF NOT IO.Input.Status.Error AND Internal.ErrorID = errCOMM_SORT_ERROR THEN
				Internal.Error := FALSE;
				Internal.ErrorID := errCOMM_NONE;
				Internal.ErrorReset := FALSE;
				Internal.State := distIDLE;
			END_IF
			
		ELSE
	END_CASE
	
	IOOld := IO;
	 
END_PROGRAM

PROGRAM _EXIT
	
	
	 
END_PROGRAM

