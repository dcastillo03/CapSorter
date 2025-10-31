
TYPE
	AlarmType : 	STRUCT  (*Alarm type*)
		ListUI : MpAlarmXListUI; (*AlarmXListUI FUB*)
		ListUISetup : MpAlarmXListUISetupType; (*AlarmXListUISetupType FUB*)
		ListUIConnect : MpAlarmXListUIConnectType; (*MpAlarmXListUIConnect FUB*)
		Core : MpAlarmXCore; (*MpAlarmXCore FUB*)
		History : MpAlarmXHistory; (*MpAlarmXHistory FUB*)
		HistoryName : STRING[50]; (*Name for history file*)
	END_STRUCT;
	ErrorType : 	STRUCT 
		CapDetect : cdErrorEnum; (*Enum for cap detect*)
		CapArmCtrl : CapArmCtrlErrorEnum; (*Enum for cap arm ctrl*)
		MoveCap : MoveCapErrorEnum; (*Enum for move cap task*)
	END_STRUCT;
END_TYPE
