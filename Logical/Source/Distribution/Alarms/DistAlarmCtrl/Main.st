
PROGRAM _INIT
	
	// MpLink Assignments
	gAlarm.Core.MpLink := ADR(gDistAlarmXCore);
	gAlarm.ListUI.MpLink := ADR(gDistAlarmXCore);
	gAlarm.History.MpLink := ADR(gDistAlarmXCore);
	
END_PROGRAM

PROGRAM _CYCLIC
	
	// FUB Setup
	gAlarm.ListUI.Enable := TRUE;
	gAlarm.ListUI.UISetup := gAlarm.ListUISetup;
	gAlarm.ListUI.UIConnect := ADR(gAlarm.ListUIConnect);
	
	gAlarm.Core.Enable := TRUE;
	
	gAlarm.History.Enable := TRUE;
	gAlarm.History.DeviceName := ADR('AlarmHistory');
	gAlarm.History.FileName := ADR(gAlarm.HistoryName);
	
	// Call FUBs
	gAlarm.Core();
	gAlarm.ListUI();
	gAlarm.History();
	 
END_PROGRAM

PROGRAM _EXIT
	
	
	 
END_PROGRAM

