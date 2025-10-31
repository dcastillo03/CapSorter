
PROGRAM _INIT
	
	// MpLink Assignments
	Alarm.Core.MpLink := ADR(gAlarmXCore);
	Alarm.ListUI.MpLink := ADR(gAlarmXCore);
	Alarm.History.MpLink := ADR(gAlarmXCore);
	
END_PROGRAM

PROGRAM _CYCLIC
	
	gAlarm := Alarm;
	
	// FUB Setup
	Alarm.ListUI.Enable := TRUE;
	Alarm.ListUI.UISetup := Alarm.ListUISetup;
	Alarm.ListUI.UIConnect := ADR(Alarm.ListUIConnect);
	
	Alarm.Core.Enable := TRUE;
	
	Alarm.History.Enable := TRUE;
	Alarm.History.DeviceName := ADR('AlarmHistory');
	Alarm.History.FileName := ADR(Alarm.HistoryName);
	
	// Call FUBs
	Alarm.Core();
	Alarm.ListUI();
	Alarm.History();
	
END_PROGRAM

PROGRAM _EXIT
	
	
	
END_PROGRAM

