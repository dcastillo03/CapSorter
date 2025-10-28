<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="6.0"?>
<Project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xhtml="http://www.w3.org/1999/xhtml" schemaVersion="1.0" xmlns="www.iec.ch/public/TC65SC65BWG7TF10">
  <FileHeader companyName="B&amp;R Industrial Automation GmbH" productName="Automation Studio" productVersion="6.0" />
  <ContentHeader name="" creationDateTime="0001-01-01T00:00:00">
    <CoordinateInfo />
    <AddData>
      <Data name="BR_EditorMode" handleUnknown="implementation">
        <EditorMode value="Default" />
      </Data>
      <Data name="BR_AlignRightPowerRails" handleUnknown="implementation">
        <AlignRightPowerRails value="true" />
      </Data>
    </AddData>
  </ContentHeader>
  <Types>
    <GlobalNamespace>
      <Program name="">
        <AddData>
          <Data name="BR_EntryPoint" handleUnknown="implementation">
            <EntryPoint entryPointType="_CYCLIC" />
          </Data>
        </AddData>
        <MainBody>
          <AddData>
            <Data name="BR_CodeInformation" handleUnknown="implementation">
              <CodeInformation><![CDATA[CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_BEGIN
PROGRAM _CYCLIC

VAR
	zz$$$$_0_gDistConveyorInterface_ : BOOL;
	zz$$$$_1_f_trig_gArmInterface_St : f_trig;
	zz$$$$_2_AutoInterface_Cmd_Enabl : BOOL;
	zz$$$$_3_r_trig_AutoInterface_Cm : r_trig;
	zz$$$$_4_AutoInterface_Cmd_Home_ : BOOL;
	zz$$$$_5_AutoInterface_Status_Ho : BOOL;
	zz$$$$_6_gBayInterface_Status_Ca : BOOL;
	zz$$$$_7_AutoInterface_Status_Ho : BOOL;
	zz$$$$_8_gArmInterface_Status_Ar : BOOL;
	zz$$$$_9_AutoInterface_Status_Ho : BOOL;
	zz$$$$_10_AutoInterface_Cmd_Caps : BOOL;
	zz$$$$_11_AutoInterface_Cmd_Stop : BOOL;
	zz$$$$_12_AutoInterface_State_Ca : BOOL;
	zz$$$$_13_gBayInterface_Status_C : BOOL;
	zz$$$$_14_AutoInterface_State_Ca : BOOL;
	zz$$$$_15_gArmInterface_Status_C : BOOL;
	zz$$$$_16_AutoInterface_State_Ca : BOOL;
	zz$$$$_17_gArmInterface_Status_A : BOOL;
	zz$$$$_18_AutoInterface_State_Ca : BOOL;
	zz$$$$_19_TON : TON;
	zz$$$$_20_Q_TON_ : ANY;
	zz$$$$_21_f_trig_gDistConveyorIn : f_trig;
	zz$$$$_22_r_trig_AutoInterface_S : r_trig;
	zz$$$$_23_AutoInterface_State_Ca : BOOL;
END_VAR


{NetworkNumber := 1}
CapAtDropOff:
LD	gDistConveyorInterface.Status.CapAtDropOff {CheckDataType := BOOL}
ST	zz$$$$_0_gDistConveyorInterface_
LDN	zz$$$$_0_gDistConveyorInterface_
ST	gArmInterface.Par.CanMoveFwd {CheckDataType := BOOL}
LD	zz$$$$_0_gDistConveyorInterface_
ST	gArmInterface.Par.CanRelease {CheckDataType := BOOL}

{NetworkNumber := 2}
CapGripOK:
LD	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
AND	gArmInterface.Status.ArmAtPickup {CheckDataType := BOOL}
ST	gArmInterface.Par.CanGrip {CheckDataType := BOOL}

{NetworkNumber := 3}
EjectOK:
LD	gArmInterface.Status.ArmAtPickup {CheckDataType := BOOL}
ST	zz$$$$_1_f_trig_gArmInterface_St.CLK
CAL	zz$$$$_1_f_trig_gArmInterface_St
LD	gArmInterface.Status.CapGripped {CheckDataType := BOOL}
AND	zz$$$$_1_f_trig_gArmInterface_St.Q
ST	gBayInterface.Cmd.CapTaken {CheckDataType := BOOL}

{NetworkNumber := 4}
EnableSubmodules:
LD	AutoInterface.Cmd.EnableModules {CheckDataType := BOOL}
ST	zz$$$$_2_AutoInterface_Cmd_Enabl
ST	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
ST	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
AND	gBayInterface.Status.Active {CheckDataType := BOOL}
AND	gArmInterface.Status.Active {CheckDataType := BOOL}
AND	gDistConveyorInterface.Status.Active {CheckDataType := BOOL}
ST	AutoInterface.Status.ModulesEnabled {CheckDataType := BOOL}

{NetworkNumber := 5}
AutoHomeStart:
LD	AutoInterface.Cmd.Home {CheckDataType := BOOL}
ST	zz$$$$_3_r_trig_AutoInterface_Cm.CLK
CAL	zz$$$$_3_r_trig_AutoInterface_Cm
LD	zz$$$$_3_r_trig_AutoInterface_Cm.Q
ST	zz$$$$_4_AutoInterface_Cmd_Home_
S	AutoInterface.Status.HomeStarted {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
S	gDistConveyorInterface.Cmd.Power {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
S	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
S	gArmInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
S	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.Status.DistBayHomed {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.Status.HomeDone {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_4_AutoInterface_Cmd_Home_
R	AutoInterface.State.CapSent {CheckDataType := BOOL}

{NetworkNumber := 6}
HomeDistBay:
LD	AutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ST	zz$$$$_5_AutoInterface_Status_Ho
R	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_5_AutoInterface_Status_Ho
S	gBayInterface.Cmd.CapTaken {CheckDataType := BOOL}
LD	zz$$$$_5_AutoInterface_Status_Ho
ANDN	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
ANDN	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_6_gBayInterface_Status_Ca
R	gBayInterface.Cmd.CapTaken {CheckDataType := BOOL}
LD	zz$$$$_6_gBayInterface_Status_Ca
S	AutoInterface.Status.DistBayHomed {CheckDataType := BOOL}

{NetworkNumber := 7}
HomeSwivelArm:
LD	AutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ANDN	AutoInterface.Status.HomeDone {CheckDataType := BOOL}
ST	zz$$$$_7_AutoInterface_Status_Ho
S	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_7_AutoInterface_Status_Ho
R	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_7_AutoInterface_Status_Ho
R	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
LD	zz$$$$_7_AutoInterface_Status_Ho
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_8_gArmInterface_Status_Ar
R	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_8_gArmInterface_Status_Ar
S	AutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}

{NetworkNumber := 8}
HomeDistConveyor:
LD	AutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ST	zz$$$$_9_AutoInterface_Status_Ho
R	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_9_AutoInterface_Status_Ho
ANDN	gDistConveyorInterface.Status.Moving {CheckDataType := BOOL}
S	AutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}

{NetworkNumber := 9}
CheckHome:
LD	AutoInterface.Status.DistBayHomed {CheckDataType := BOOL}
AND	AutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}
AND	AutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}
AND	AutoInterface.Cmd.CapsCleared {CheckDataType := BOOL}
ST	zz$$$$_10_AutoInterface_Cmd_Caps
S	AutoInterface.Status.HomeDone {CheckDataType := BOOL}
LD	zz$$$$_10_AutoInterface_Cmd_Caps
R	AutoInterface.Status.HomeStarted {CheckDataType := BOOL}
LD	zz$$$$_10_AutoInterface_Cmd_Caps
R	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_10_AutoInterface_Cmd_Caps
R	gArmInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_10_AutoInterface_Cmd_Caps
R	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}

{NetworkNumber := 10}
StopCmd:
LD	AutoInterface.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_11_AutoInterface_Cmd_Stop
R	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_11_AutoInterface_Cmd_Stop
R	AutoInterface.Status.HomeDone {CheckDataType := BOOL}

{NetworkNumber := 11}
AutoModeCheck:
LDN	AutoInterface.Cmd.EnableAutoMode {CheckDataType := BOOL}
OR(	AutoInterface.Cmd.Stop {CheckDataType := BOOL}
	ANDN	AutoInterface.State.CapEjected {CheckDataType := BOOL}
)
RETC

{NetworkNumber := 12}
AutoConveyor:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.Status.HomeDone {CheckDataType := BOOL}
ANDN	AutoInterface.Cmd.Stop {CheckDataType := BOOL}
S	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 13}
AutoDistBay:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gDistConveyorInterface.Status.Moving {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_12_AutoInterface_State_Ca
S	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_12_AutoInterface_State_Ca
AND	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_13_gBayInterface_Status_C
S	AutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_13_gBayInterface_Status_C
R	gBayInterface.Cmd.Eject {CheckDataType := BOOL}

{NetworkNumber := 14}
AutoGetCap:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapEjected {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_14_AutoInterface_State_Ca
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_14_AutoInterface_State_Ca
AND	gArmInterface.Status.ArmAtPickup {CheckDataType := BOOL}
S	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_14_AutoInterface_State_Ca
AND	gArmInterface.Status.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_15_gArmInterface_Status_C
S	AutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_15_gArmInterface_Status_C
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}

{NetworkNumber := 15}
AutoCapToDropOff:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapGripped {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
ST	zz$$$$_16_AutoInterface_State_Ca
S	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_16_AutoInterface_State_Ca
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_17_gArmInterface_Status_A
R	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
S	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
S	AutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
R	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 16}
AutoDropOffCap:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
ST	zz$$$$_18_AutoInterface_State_Ca
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_18_AutoInterface_State_Ca
ANDN	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_19_TON.IN
LD	ARM_BACKOFF_TIME
ST	zz$$$$_19_TON.PT
CAL	zz$$$$_19_TON
LD	zz$$$$_19_TON.Q
ST	zz$$$$_20_Q_TON_
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_20_Q_TON_
S	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_20_Q_TON_
R	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}

{NetworkNumber := 17}
AutoSendCap:
LD	gDistConveyorInterface.Status.CapAtExit {CheckDataType := BOOL}
ST	zz$$$$_21_f_trig_gDistConveyorIn.CLK
CAL	zz$$$$_21_f_trig_gDistConveyorIn
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
AND	zz$$$$_21_f_trig_gDistConveyorIn.Q
S	AutoInterface.State.CapSent {CheckDataType := BOOL}

{NetworkNumber := 18}
AutoWaitForSort:
LD	AutoInterface.State.CapSorted {CheckDataType := BOOL}
ST	zz$$$$_22_r_trig_AutoInterface_S.CLK
CAL	zz$$$$_22_r_trig_AutoInterface_S
LD	AutoInterface.State.CapSent {CheckDataType := BOOL}
AND	zz$$$$_22_r_trig_AutoInterface_S.Q
ST	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapSent {CheckDataType := BOOL}
LD	zz$$$$_23_AutoInterface_State_Ca
R	AutoInterface.State.CapSorted {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="23" column="1" position="Net:16, Ln:2, Col:31" />
                <LineMapInfo line="31" column="1" position="Net:1" />
                <LineMapInfo line="32" column="1" position="Net:1" />
                <LineMapInfo line="33" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:1, Col:36" />
                <LineMapInfo line="37" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="38" column="4" position="Net:1, Ln:2, Col:36" />
                <LineMapInfo line="40" column="1" position="Net:2" />
                <LineMapInfo line="41" column="1" position="Net:2" />
                <LineMapInfo line="42" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="43" column="5" position="Net:2, Ln:1, Col:7" />
                <LineMapInfo line="44" column="4" position="Net:2, Ln:1, Col:37" />
                <LineMapInfo line="46" column="1" position="Net:3" />
                <LineMapInfo line="47" column="1" position="Net:3" />
                <LineMapInfo line="48" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="50" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="52" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="53" column="4" position="Net:3, Ln:1, Col:36" />
                <LineMapInfo line="55" column="1" position="Net:4" />
                <LineMapInfo line="56" column="1" position="Net:4" />
                <LineMapInfo line="57" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="59" column="4" position="Net:4, Ln:1, Col:37" />
                <LineMapInfo line="60" column="4" position="Net:4, Ln:2, Col:37" />
                <LineMapInfo line="61" column="4" position="Net:4, Ln:3, Col:35" />
                <LineMapInfo line="62" column="5" position="Net:4, Ln:4, Col:8" />
                <LineMapInfo line="63" column="5" position="Net:4, Ln:4, Col:13" />
                <LineMapInfo line="64" column="5" position="Net:4, Ln:4, Col:18" />
                <LineMapInfo line="65" column="4" position="Net:4, Ln:4, Col:35" />
                <LineMapInfo line="67" column="1" position="Net:5" />
                <LineMapInfo line="68" column="1" position="Net:5" />
                <LineMapInfo line="69" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="70" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="71" column="5" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="72" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="74" column="3" position="Net:5, Ln:1, Col:36" />
                <LineMapInfo line="75" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="76" column="3" position="Net:5, Ln:2, Col:35" />
                <LineMapInfo line="77" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="78" column="3" position="Net:5, Ln:3, Col:36" />
                <LineMapInfo line="79" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="80" column="3" position="Net:5, Ln:4, Col:36" />
                <LineMapInfo line="81" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="82" column="3" position="Net:5, Ln:5, Col:35" />
                <LineMapInfo line="83" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="84" column="3" position="Net:5, Ln:6, Col:35" />
                <LineMapInfo line="85" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="86" column="3" position="Net:5, Ln:7, Col:35" />
                <LineMapInfo line="87" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="88" column="3" position="Net:5, Ln:8, Col:35" />
                <LineMapInfo line="89" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="90" column="3" position="Net:5, Ln:9, Col:36" />
                <LineMapInfo line="91" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="92" column="3" position="Net:5, Ln:10, Col:36" />
                <LineMapInfo line="93" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="94" column="3" position="Net:5, Ln:11, Col:36" />
                <LineMapInfo line="95" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="96" column="3" position="Net:5, Ln:12, Col:36" />
                <LineMapInfo line="97" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="98" column="3" position="Net:5, Ln:13, Col:35" />
                <LineMapInfo line="99" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="100" column="3" position="Net:5, Ln:14, Col:36" />
                <LineMapInfo line="102" column="1" position="Net:6" />
                <LineMapInfo line="103" column="1" position="Net:6" />
                <LineMapInfo line="104" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="106" column="3" position="Net:6, Ln:1, Col:37" />
                <LineMapInfo line="107" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="108" column="3" position="Net:6, Ln:2, Col:36" />
                <LineMapInfo line="109" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="110" column="6" position="Net:6, Ln:3, Col:7" />
                <LineMapInfo line="111" column="6" position="Net:6, Ln:3, Col:12" />
                <LineMapInfo line="113" column="3" position="Net:6, Ln:3, Col:36" />
                <LineMapInfo line="114" column="4" position="Net:6, Ln:3, Col:12" />
                <LineMapInfo line="115" column="3" position="Net:6, Ln:4, Col:35" />
                <LineMapInfo line="117" column="1" position="Net:7" />
                <LineMapInfo line="118" column="1" position="Net:7" />
                <LineMapInfo line="119" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="120" column="6" position="Net:7, Ln:1, Col:7" />
                <LineMapInfo line="122" column="3" position="Net:7, Ln:1, Col:36" />
                <LineMapInfo line="123" column="4" position="Net:7, Ln:1, Col:7" />
                <LineMapInfo line="124" column="3" position="Net:7, Ln:2, Col:37" />
                <LineMapInfo line="125" column="4" position="Net:7, Ln:1, Col:7" />
                <LineMapInfo line="126" column="3" position="Net:7, Ln:3, Col:36" />
                <LineMapInfo line="127" column="4" position="Net:7, Ln:1, Col:7" />
                <LineMapInfo line="128" column="5" position="Net:7, Ln:4, Col:13" />
                <LineMapInfo line="130" column="3" position="Net:7, Ln:4, Col:36" />
                <LineMapInfo line="131" column="4" position="Net:7, Ln:4, Col:13" />
                <LineMapInfo line="132" column="3" position="Net:7, Ln:5, Col:35" />
                <LineMapInfo line="134" column="1" position="Net:8" />
                <LineMapInfo line="135" column="1" position="Net:8" />
                <LineMapInfo line="136" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="138" column="3" position="Net:8, Ln:1, Col:35" />
                <LineMapInfo line="139" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="140" column="6" position="Net:8, Ln:2, Col:7" />
                <LineMapInfo line="141" column="3" position="Net:8, Ln:2, Col:35" />
                <LineMapInfo line="143" column="1" position="Net:9" />
                <LineMapInfo line="144" column="1" position="Net:9" />
                <LineMapInfo line="145" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="146" column="5" position="Net:9, Ln:1, Col:8" />
                <LineMapInfo line="147" column="5" position="Net:9, Ln:1, Col:15" />
                <LineMapInfo line="148" column="5" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="150" column="3" position="Net:9, Ln:1, Col:36" />
                <LineMapInfo line="151" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="152" column="3" position="Net:9, Ln:2, Col:36" />
                <LineMapInfo line="153" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="154" column="3" position="Net:9, Ln:3, Col:36" />
                <LineMapInfo line="155" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="156" column="3" position="Net:9, Ln:4, Col:36" />
                <LineMapInfo line="157" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="158" column="3" position="Net:9, Ln:5, Col:35" />
                <LineMapInfo line="160" column="1" position="Net:10" />
                <LineMapInfo line="161" column="1" position="Net:10" />
                <LineMapInfo line="162" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="164" column="3" position="Net:10, Ln:1, Col:35" />
                <LineMapInfo line="165" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="166" column="3" position="Net:10, Ln:2, Col:36" />
                <LineMapInfo line="168" column="1" position="Net:11" />
                <LineMapInfo line="169" column="1" position="Net:11" />
                <LineMapInfo line="170" column="5" position="Net:11, Ln:1, Col:1" />
                <LineMapInfo line="171" column="5" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="172" column="7" position="Net:11, Ln:2, Col:6" />
                <LineMapInfo line="176" column="1" position="Net:12" />
                <LineMapInfo line="177" column="1" position="Net:12" />
                <LineMapInfo line="178" column="4" position="Net:12, Ln:1, Col:1" />
                <LineMapInfo line="179" column="5" position="Net:12, Ln:1, Col:6" />
                <LineMapInfo line="180" column="6" position="Net:12, Ln:1, Col:12" />
                <LineMapInfo line="181" column="3" position="Net:12, Ln:1, Col:35" />
                <LineMapInfo line="183" column="1" position="Net:13" />
                <LineMapInfo line="184" column="1" position="Net:13" />
                <LineMapInfo line="185" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="186" column="5" position="Net:13, Ln:1, Col:6" />
                <LineMapInfo line="187" column="6" position="Net:13, Ln:1, Col:13" />
                <LineMapInfo line="189" column="3" position="Net:13, Ln:1, Col:37" />
                <LineMapInfo line="190" column="4" position="Net:13, Ln:1, Col:13" />
                <LineMapInfo line="191" column="5" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="193" column="3" position="Net:13, Ln:2, Col:36" />
                <LineMapInfo line="194" column="4" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="195" column="3" position="Net:13, Ln:3, Col:37" />
                <LineMapInfo line="197" column="1" position="Net:14" />
                <LineMapInfo line="198" column="1" position="Net:14" />
                <LineMapInfo line="199" column="4" position="Net:14, Ln:1, Col:1" />
                <LineMapInfo line="200" column="5" position="Net:14, Ln:1, Col:6" />
                <LineMapInfo line="201" column="6" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="203" column="3" position="Net:14, Ln:1, Col:36" />
                <LineMapInfo line="204" column="4" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="205" column="5" position="Net:14, Ln:2, Col:18" />
                <LineMapInfo line="206" column="3" position="Net:14, Ln:2, Col:37" />
                <LineMapInfo line="207" column="4" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="208" column="5" position="Net:14, Ln:3, Col:18" />
                <LineMapInfo line="210" column="3" position="Net:14, Ln:3, Col:36" />
                <LineMapInfo line="211" column="4" position="Net:14, Ln:3, Col:18" />
                <LineMapInfo line="212" column="3" position="Net:14, Ln:4, Col:36" />
                <LineMapInfo line="214" column="1" position="Net:15" />
                <LineMapInfo line="215" column="1" position="Net:15" />
                <LineMapInfo line="216" column="4" position="Net:15, Ln:1, Col:1" />
                <LineMapInfo line="217" column="5" position="Net:15, Ln:1, Col:6" />
                <LineMapInfo line="218" column="6" position="Net:15, Ln:1, Col:12" />
                <LineMapInfo line="220" column="3" position="Net:15, Ln:1, Col:36" />
                <LineMapInfo line="221" column="4" position="Net:15, Ln:1, Col:12" />
                <LineMapInfo line="222" column="5" position="Net:15, Ln:2, Col:18" />
                <LineMapInfo line="224" column="3" position="Net:15, Ln:2, Col:37" />
                <LineMapInfo line="225" column="4" position="Net:15, Ln:2, Col:18" />
                <LineMapInfo line="226" column="3" position="Net:15, Ln:3, Col:36" />
                <LineMapInfo line="227" column="4" position="Net:15, Ln:2, Col:18" />
                <LineMapInfo line="228" column="3" position="Net:15, Ln:4, Col:36" />
                <LineMapInfo line="229" column="4" position="Net:15, Ln:2, Col:18" />
                <LineMapInfo line="230" column="3" position="Net:15, Ln:5, Col:36" />
                <LineMapInfo line="232" column="1" position="Net:16" />
                <LineMapInfo line="233" column="1" position="Net:16" />
                <LineMapInfo line="234" column="4" position="Net:16, Ln:1, Col:1" />
                <LineMapInfo line="235" column="5" position="Net:16, Ln:1, Col:6" />
                <LineMapInfo line="236" column="6" position="Net:16, Ln:1, Col:12" />
                <LineMapInfo line="238" column="5" position="Net:16, Ln:1, Col:19" />
                <LineMapInfo line="239" column="3" position="Net:16, Ln:1, Col:36" />
                <LineMapInfo line="240" column="4" position="Net:16, Ln:1, Col:12" />
                <LineMapInfo line="241" column="6" position="Net:16, Ln:3, Col:19" />
                <LineMapInfo line="242" column="4" position="Net:16, Ln:2, Col:31 [Block input IN]" />
                <LineMapInfo line="243" column="4" position="Net:16, Ln:4, Col:26" />
                <LineMapInfo line="244" column="4" position="Net:16, Ln:2, Col:31 [Block input PT]" />
                <LineMapInfo line="245" column="5" position="Net:16, Ln:2, Col:31" />
                <LineMapInfo line="246" column="4" position="Net:16, Ln:2, Col:31 [Block output Q]" />
                <LineMapInfo line="248" column="3" position="Net:16, Ln:3, Col:36" />
                <LineMapInfo line="249" column="4" position="Net:16, Ln:2, Col:31 [Block output Q]" />
                <LineMapInfo line="250" column="3" position="Net:16, Ln:4, Col:35" />
                <LineMapInfo line="251" column="4" position="Net:16, Ln:2, Col:31 [Block output Q]" />
                <LineMapInfo line="252" column="3" position="Net:16, Ln:5, Col:36" />
                <LineMapInfo line="254" column="1" position="Net:17" />
                <LineMapInfo line="255" column="1" position="Net:17" />
                <LineMapInfo line="256" column="4" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="257" column="4" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="258" column="5" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="259" column="4" position="Net:17, Ln:1, Col:1" />
                <LineMapInfo line="260" column="5" position="Net:17, Ln:1, Col:6" />
                <LineMapInfo line="261" column="5" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="262" column="3" position="Net:17, Ln:1, Col:36" />
                <LineMapInfo line="264" column="1" position="Net:18" />
                <LineMapInfo line="265" column="1" position="Net:18" />
                <LineMapInfo line="266" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="267" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="268" column="5" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="269" column="4" position="Net:18, Ln:1, Col:1" />
                <LineMapInfo line="270" column="5" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="272" column="3" position="Net:18, Ln:1, Col:36" />
                <LineMapInfo line="273" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="274" column="3" position="Net:18, Ln:2, Col:36" />
                <LineMapInfo line="275" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="276" column="3" position="Net:18, Ln:3, Col:36" />
                <LineMapInfo line="277" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="278" column="3" position="Net:18, Ln:4, Col:35" />
                <LineMapInfo line="279" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="280" column="3" position="Net:18, Ln:5, Col:36" />
                <LineMapInfo line="281" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="282" column="3" position="Net:18, Ln:6, Col:36" />
                <LineMapInfo line="284" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="8C718D99" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="CapAtDropOff">
              <Documentation xsi:type="SimpleText"><![CDATA[If cap is at drop off, don't let arm move forward and allow gripper to release]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.CapAtDropOff" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Par.CanMoveFwd" negated="true" edge="none" latch="none">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Par.CanRelease" edge="none" latch="none">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="2" label="CapGripOK">
              <Documentation xsi:type="SimpleText"><![CDATA[If cap is ejected and arm is at pickup, allow gripper to turn on vacuum]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Status.CapEjected" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtPickup" edge="none">
                <RelPosition x="183" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Par.CanGrip" edge="none" latch="none">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="EjectOK">
              <Documentation xsi:type="SimpleText"><![CDATA[If cap has been taken from distribution bay, send cmd to allow another cap to be ejected]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.CapGripped" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtPickup" edge="falling">
                <RelPosition x="183" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.CapTaken" edge="none" latch="none">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="EnableSubmodules">
              <Documentation xsi:type="SimpleText"><![CDATA[Enable all submodules and check if they are active]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.EnableModules" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Status.Active" edge="none">
                <RelPosition x="213" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.Active" edge="none">
                <RelPosition x="363" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.Active" edge="none">
                <RelPosition x="513" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="1023" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.ModulesEnabled" edge="none" latch="none">
                <RelPosition x="1023" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="AutoHomeStart">
              <Documentation xsi:type="SimpleText"><![CDATA[Home all stations on home cmd]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="532" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="218" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="256" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="294" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="332" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="370" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="408" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="446" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="484" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="522" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Home" edge="rising">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.Power" edge="none" latch="set">
                <RelPosition x="1023" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="1023" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.DistBayHomed" edge="none" latch="reset">
                <RelPosition x="1023" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.SwivelArmHomed" edge="none" latch="reset">
                <RelPosition x="1023" y="246" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.ConveyorHomed" edge="none" latch="reset">
                <RelPosition x="1023" y="284" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapDroppedOff" edge="none" latch="reset">
                <RelPosition x="1023" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeStarted" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeDone" edge="none" latch="reset">
                <RelPosition x="1053" y="322" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapEjected" edge="none" latch="reset">
                <RelPosition x="1053" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapGripped" edge="none" latch="reset">
                <RelPosition x="1053" y="398" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapAtDropOff" edge="none" latch="reset">
                <RelPosition x="1053" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSent" edge="none" latch="reset">
                <RelPosition x="1053" y="512" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="532" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="HomeDistBay">
              <Documentation xsi:type="SimpleText"><![CDATA[Home Distribution bay]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.HomeStarted" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Eject" negated="true" edge="none">
                <RelPosition x="183" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Status.CapEjected" negated="true" edge="none">
                <RelPosition x="333" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.DistBayHomed" edge="none" latch="set">
                <RelPosition x="1023" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.CapTaken" edge="none" latch="set">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.CapTaken" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.Eject" edge="none" latch="reset">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="HomeSwivelArm">
              <Documentation xsi:type="SimpleText"><![CDATA[Home Swivel Arm]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.HomeStarted" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.HomeDone" negated="true" edge="none">
                <RelPosition x="183" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" edge="none">
                <RelPosition x="363" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.SwivelArmHomed" edge="none" latch="set">
                <RelPosition x="1023" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.GripCap" edge="none" latch="reset">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="HomeDistConveyor">
              <Documentation xsi:type="SimpleText"><![CDATA[Home Distribution Conveyor]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.HomeStarted" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.Moving" negated="true" edge="none">
                <RelPosition x="183" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="1023" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.ConveyorHomed" edge="none" latch="set">
                <RelPosition x="1023" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="9" label="CheckHome">
              <Documentation xsi:type="SimpleText"><![CDATA[Set home done and reset home started when all homing is done and all caps are cleared]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.DistBayHomed" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.SwivelArmHomed" edge="none">
                <RelPosition x="213" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.ConveyorHomed" edge="none">
                <RelPosition x="423" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.CapsCleared" edge="none">
                <RelPosition x="633" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="reset">
                <RelPosition x="1023" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeDone" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeStarted" edge="none" latch="reset">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.ErrorReset" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.ErrorReset" edge="none" latch="reset">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="10" label="StopCmd">
              <Documentation xsi:type="SimpleText"><![CDATA[Stop conveyor and reset HomeDone status on stop cmd]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Stop" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="1023" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeDone" edge="none" latch="reset">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="11" label="AutoModeCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Skip auto mode logic if not in auto mode or if cap is sorted and stop cmd is issued]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.EnableAutoMode" negated="true" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Stop" edge="none">
                <RelPosition x="3" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapEjected" negated="true" edge="none">
                <RelPosition x="153" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="1143" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="12" label="AutoConveyor">
              <Documentation xsi:type="SimpleText"><![CDATA[Start auto mode with conveyor]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Status.HomeDone" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="333" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="1023" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="13" label="AutoDistBay">
              <Documentation xsi:type="SimpleText"><![CDATA[Eject cap once conveyor is moving, wait until cap is sorted to do another]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.Moving" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapEjected" negated="true" edge="none">
                <RelPosition x="363" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Status.CapEjected" edge="none">
                <RelPosition x="543" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapEjected" edge="none" latch="set">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.Eject" edge="none" latch="set">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.Eject" edge="none" latch="reset">
                <RelPosition x="1083" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="14" label="AutoGetCap">
              <Documentation xsi:type="SimpleText"><![CDATA[Move swivel arm to distribution bay and grip cap]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapEjected" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapGripped" negated="true" edge="none">
                <RelPosition x="333" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtPickup" edge="none">
                <RelPosition x="513" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.CapGripped" edge="none">
                <RelPosition x="513" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapGripped" edge="none" latch="set">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="reset">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.GripCap" edge="none" latch="set">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="15" label="AutoCapToDropOff">
              <Documentation xsi:type="SimpleText"><![CDATA[Bring cap to drop-off point and release it]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapGripped" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapAtDropOff" negated="true" edge="none">
                <RelPosition x="333" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" edge="none">
                <RelPosition x="513" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="set">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapAtDropOff" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="1053" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.GripCap" edge="none" latch="reset">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="16" label="AutoDropOffCap">
              <Documentation xsi:type="SimpleText"><![CDATA[Once released, back the arm off of the drop-off point]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapAtDropOff" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapDroppedOff" negated="true" edge="none">
                <RelPosition x="333" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" edge="none">
                <RelPosition x="543" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" negated="true" edge="none">
                <RelPosition x="543" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="ARM_BACKOFF_TIME">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="753" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="903" y="76" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="6" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="7" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="ET">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapDroppedOff" edge="none" latch="set">
                <RelPosition x="1023" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="reset">
                <RelPosition x="1053" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="17" label="AutoSendCap">
              <Documentation xsi:type="SimpleText"><![CDATA[Send cap to sorting station]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.Cmd.Start" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapDroppedOff" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.CapAtExit" edge="falling">
                <RelPosition x="363" y="18" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSent" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="18" label="AutoWaitForSort">
              <Documentation xsi:type="SimpleText"><![CDATA[Wait for confirmation that cap has been sorted]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="218" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapSent" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="AutoInterface.State.CapSorted" edge="rising">
                <RelPosition x="183" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapDroppedOff" edge="none" latch="reset">
                <RelPosition x="1023" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapEjected" edge="none" latch="reset">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapGripped" edge="none" latch="reset">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapAtDropOff" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSent" edge="none" latch="reset">
                <RelPosition x="1053" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSorted" edge="none" latch="reset">
                <RelPosition x="1053" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>