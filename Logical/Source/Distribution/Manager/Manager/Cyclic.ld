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
	zz$$$$_11_AutoInterface_State_Ca : BOOL;
	zz$$$$_12_AutoInterface_State_Ca : BOOL;
	zz$$$$_13_gArmInterface_Status_C : BOOL;
	zz$$$$_14_AutoInterface_State_Ca : BOOL;
	zz$$$$_15_r_trig_gArmInterface_C : r_trig;
	zz$$$$_16_gArmInterface_Status_A : BOOL;
	zz$$$$_17_gArmInterface_Status_C : BOOL;
	zz$$$$_18_gArmInterface_Status_A : BOOL;
	zz$$$$_19_f_trig_gDistConveyorIn : f_trig;
	zz$$$$_20_r_trig_AutoInterface_S : r_trig;
	zz$$$$_21_AutoInterface_State_Ca : BOOL;
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
AutoConveyor:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.Status.HomeDone {CheckDataType := BOOL}
S	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 11}
AutoDistBay:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gDistConveyorInterface.Status.Moving {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_11_AutoInterface_State_Ca
S	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_11_AutoInterface_State_Ca
AND	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
S	AutoInterface.State.CapEjected {CheckDataType := BOOL}

{NetworkNumber := 12}
AutoGetCap:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapEjected {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_12_AutoInterface_State_Ca
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_12_AutoInterface_State_Ca
AND	gArmInterface.Status.ArmAtPickup {CheckDataType := BOOL}
S	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_12_AutoInterface_State_Ca
AND	gArmInterface.Status.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_13_gArmInterface_Status_C
S	AutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_13_gArmInterface_Status_C
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}

{NetworkNumber := 13}
AutoDropOffCap:
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapGripped {CheckDataType := BOOL}
ANDN	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
ST	zz$$$$_14_AutoInterface_State_Ca
ST	zz$$$$_15_r_trig_gArmInterface_C.CLK
CAL	zz$$$$_15_r_trig_gArmInterface_C
LD	zz$$$$_15_r_trig_gArmInterface_C.Q
ST	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_14_AutoInterface_State_Ca
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_16_gArmInterface_Status_A
R	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_16_gArmInterface_Status_A
S	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
LD	zz$$$$_14_AutoInterface_State_Ca
ANDN	gArmInterface.Status.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_17_gArmInterface_Status_C
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_C
ANDN	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_18_gArmInterface_Status_A
S	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_18_gArmInterface_Status_A
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}

{NetworkNumber := 14}
AutoSendCap:
LD	gDistConveyorInterface.Status.CapAtExit {CheckDataType := BOOL}
ST	zz$$$$_19_f_trig_gDistConveyorIn.CLK
CAL	zz$$$$_19_f_trig_gDistConveyorIn
LD	AutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
AND	zz$$$$_19_f_trig_gDistConveyorIn.Q
S	AutoInterface.State.CapSent {CheckDataType := BOOL}

{NetworkNumber := 15}
AutoWaitForSort:
LD	AutoInterface.State.CapSorted {CheckDataType := BOOL}
ST	zz$$$$_20_r_trig_AutoInterface_S.CLK
CAL	zz$$$$_20_r_trig_AutoInterface_S
LD	AutoInterface.State.CapSent {CheckDataType := BOOL}
AND	zz$$$$_20_r_trig_AutoInterface_S.Q
ST	zz$$$$_21_AutoInterface_State_Ca
R	AutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_21_AutoInterface_State_Ca
R	AutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_21_AutoInterface_State_Ca
R	AutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_21_AutoInterface_State_Ca
R	AutoInterface.State.CapSent {CheckDataType := BOOL}
LD	zz$$$$_21_AutoInterface_State_Ca
R	AutoInterface.State.CapSorted {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="29" column="1" position="Net:1" />
                <LineMapInfo line="30" column="1" position="Net:1" />
                <LineMapInfo line="31" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="34" column="4" position="Net:1, Ln:1, Col:33" />
                <LineMapInfo line="35" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:2, Col:33" />
                <LineMapInfo line="38" column="1" position="Net:2" />
                <LineMapInfo line="39" column="1" position="Net:2" />
                <LineMapInfo line="40" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="41" column="5" position="Net:2, Ln:1, Col:7" />
                <LineMapInfo line="42" column="4" position="Net:2, Ln:1, Col:34" />
                <LineMapInfo line="44" column="1" position="Net:3" />
                <LineMapInfo line="45" column="1" position="Net:3" />
                <LineMapInfo line="46" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="47" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="48" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="50" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:1, Col:33" />
                <LineMapInfo line="53" column="1" position="Net:4" />
                <LineMapInfo line="54" column="1" position="Net:4" />
                <LineMapInfo line="55" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="57" column="4" position="Net:4, Ln:1, Col:34" />
                <LineMapInfo line="58" column="4" position="Net:4, Ln:2, Col:34" />
                <LineMapInfo line="59" column="4" position="Net:4, Ln:3, Col:32" />
                <LineMapInfo line="60" column="5" position="Net:4, Ln:4, Col:8" />
                <LineMapInfo line="61" column="5" position="Net:4, Ln:4, Col:13" />
                <LineMapInfo line="62" column="5" position="Net:4, Ln:4, Col:18" />
                <LineMapInfo line="63" column="4" position="Net:4, Ln:4, Col:32" />
                <LineMapInfo line="65" column="1" position="Net:5" />
                <LineMapInfo line="66" column="1" position="Net:5" />
                <LineMapInfo line="67" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="68" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="69" column="5" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="70" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="72" column="3" position="Net:5, Ln:1, Col:33" />
                <LineMapInfo line="73" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="74" column="3" position="Net:5, Ln:2, Col:32" />
                <LineMapInfo line="75" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="76" column="3" position="Net:5, Ln:3, Col:33" />
                <LineMapInfo line="77" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="78" column="3" position="Net:5, Ln:4, Col:33" />
                <LineMapInfo line="79" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="80" column="3" position="Net:5, Ln:5, Col:32" />
                <LineMapInfo line="81" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="82" column="3" position="Net:5, Ln:6, Col:32" />
                <LineMapInfo line="83" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="84" column="3" position="Net:5, Ln:7, Col:32" />
                <LineMapInfo line="85" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="86" column="3" position="Net:5, Ln:8, Col:32" />
                <LineMapInfo line="87" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="88" column="3" position="Net:5, Ln:9, Col:33" />
                <LineMapInfo line="90" column="1" position="Net:6" />
                <LineMapInfo line="91" column="1" position="Net:6" />
                <LineMapInfo line="92" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="94" column="3" position="Net:6, Ln:1, Col:34" />
                <LineMapInfo line="95" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="96" column="3" position="Net:6, Ln:2, Col:33" />
                <LineMapInfo line="97" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="98" column="6" position="Net:6, Ln:3, Col:7" />
                <LineMapInfo line="99" column="6" position="Net:6, Ln:3, Col:12" />
                <LineMapInfo line="101" column="3" position="Net:6, Ln:3, Col:33" />
                <LineMapInfo line="102" column="4" position="Net:6, Ln:3, Col:12" />
                <LineMapInfo line="103" column="3" position="Net:6, Ln:4, Col:32" />
                <LineMapInfo line="105" column="1" position="Net:7" />
                <LineMapInfo line="106" column="1" position="Net:7" />
                <LineMapInfo line="107" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="109" column="3" position="Net:7, Ln:1, Col:33" />
                <LineMapInfo line="110" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="111" column="3" position="Net:7, Ln:2, Col:34" />
                <LineMapInfo line="112" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="113" column="3" position="Net:7, Ln:3, Col:33" />
                <LineMapInfo line="114" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="115" column="5" position="Net:7, Ln:4, Col:7" />
                <LineMapInfo line="117" column="3" position="Net:7, Ln:4, Col:33" />
                <LineMapInfo line="118" column="4" position="Net:7, Ln:4, Col:7" />
                <LineMapInfo line="119" column="3" position="Net:7, Ln:5, Col:32" />
                <LineMapInfo line="121" column="1" position="Net:8" />
                <LineMapInfo line="122" column="1" position="Net:8" />
                <LineMapInfo line="123" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="125" column="3" position="Net:8, Ln:1, Col:32" />
                <LineMapInfo line="126" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="127" column="6" position="Net:8, Ln:2, Col:7" />
                <LineMapInfo line="128" column="3" position="Net:8, Ln:2, Col:32" />
                <LineMapInfo line="130" column="1" position="Net:9" />
                <LineMapInfo line="131" column="1" position="Net:9" />
                <LineMapInfo line="132" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="133" column="5" position="Net:9, Ln:1, Col:8" />
                <LineMapInfo line="134" column="5" position="Net:9, Ln:1, Col:15" />
                <LineMapInfo line="135" column="5" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="137" column="3" position="Net:9, Ln:1, Col:33" />
                <LineMapInfo line="138" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="139" column="3" position="Net:9, Ln:2, Col:33" />
                <LineMapInfo line="140" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="141" column="3" position="Net:9, Ln:3, Col:33" />
                <LineMapInfo line="142" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="143" column="3" position="Net:9, Ln:4, Col:33" />
                <LineMapInfo line="144" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="145" column="3" position="Net:9, Ln:5, Col:32" />
                <LineMapInfo line="147" column="1" position="Net:10" />
                <LineMapInfo line="148" column="1" position="Net:10" />
                <LineMapInfo line="149" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="150" column="5" position="Net:10, Ln:1, Col:6" />
                <LineMapInfo line="151" column="3" position="Net:10, Ln:1, Col:32" />
                <LineMapInfo line="153" column="1" position="Net:11" />
                <LineMapInfo line="154" column="1" position="Net:11" />
                <LineMapInfo line="155" column="4" position="Net:11, Ln:1, Col:1" />
                <LineMapInfo line="156" column="5" position="Net:11, Ln:1, Col:6" />
                <LineMapInfo line="157" column="6" position="Net:11, Ln:1, Col:13" />
                <LineMapInfo line="159" column="3" position="Net:11, Ln:1, Col:34" />
                <LineMapInfo line="160" column="4" position="Net:11, Ln:1, Col:13" />
                <LineMapInfo line="161" column="5" position="Net:11, Ln:2, Col:19" />
                <LineMapInfo line="162" column="3" position="Net:11, Ln:2, Col:33" />
                <LineMapInfo line="164" column="1" position="Net:12" />
                <LineMapInfo line="165" column="1" position="Net:12" />
                <LineMapInfo line="166" column="4" position="Net:12, Ln:1, Col:1" />
                <LineMapInfo line="167" column="5" position="Net:12, Ln:1, Col:6" />
                <LineMapInfo line="168" column="6" position="Net:12, Ln:1, Col:12" />
                <LineMapInfo line="170" column="3" position="Net:12, Ln:1, Col:33" />
                <LineMapInfo line="171" column="4" position="Net:12, Ln:1, Col:12" />
                <LineMapInfo line="172" column="5" position="Net:12, Ln:2, Col:18" />
                <LineMapInfo line="173" column="3" position="Net:12, Ln:2, Col:34" />
                <LineMapInfo line="174" column="4" position="Net:12, Ln:1, Col:12" />
                <LineMapInfo line="175" column="5" position="Net:12, Ln:3, Col:18" />
                <LineMapInfo line="177" column="3" position="Net:12, Ln:3, Col:33" />
                <LineMapInfo line="178" column="4" position="Net:12, Ln:3, Col:18" />
                <LineMapInfo line="179" column="3" position="Net:12, Ln:4, Col:33" />
                <LineMapInfo line="181" column="1" position="Net:13" />
                <LineMapInfo line="182" column="1" position="Net:13" />
                <LineMapInfo line="183" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="184" column="5" position="Net:13, Ln:1, Col:6" />
                <LineMapInfo line="185" column="6" position="Net:13, Ln:1, Col:12" />
                <LineMapInfo line="187" column="4" position="Net:13, Ln:1, Col:33" />
                <LineMapInfo line="188" column="5" position="Net:13, Ln:1, Col:33" />
                <LineMapInfo line="189" column="4" position="Net:13, Ln:1, Col:33" />
                <LineMapInfo line="190" column="4" position="Net:13, Ln:1, Col:33" />
                <LineMapInfo line="191" column="4" position="Net:13, Ln:1, Col:12" />
                <LineMapInfo line="192" column="5" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="194" column="3" position="Net:13, Ln:2, Col:34" />
                <LineMapInfo line="195" column="4" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="196" column="3" position="Net:13, Ln:3, Col:33" />
                <LineMapInfo line="197" column="4" position="Net:13, Ln:1, Col:12" />
                <LineMapInfo line="198" column="6" position="Net:13, Ln:4, Col:19" />
                <LineMapInfo line="200" column="5" position="Net:13, Ln:4, Col:25" />
                <LineMapInfo line="201" column="3" position="Net:13, Ln:4, Col:33" />
                <LineMapInfo line="202" column="4" position="Net:13, Ln:4, Col:19" />
                <LineMapInfo line="203" column="6" position="Net:13, Ln:5, Col:25" />
                <LineMapInfo line="205" column="3" position="Net:13, Ln:5, Col:32" />
                <LineMapInfo line="206" column="4" position="Net:13, Ln:5, Col:25" />
                <LineMapInfo line="207" column="3" position="Net:13, Ln:6, Col:33" />
                <LineMapInfo line="209" column="1" position="Net:14" />
                <LineMapInfo line="210" column="1" position="Net:14" />
                <LineMapInfo line="211" column="4" position="Net:14, Ln:1, Col:13" />
                <LineMapInfo line="212" column="4" position="Net:14, Ln:1, Col:13" />
                <LineMapInfo line="213" column="5" position="Net:14, Ln:1, Col:13" />
                <LineMapInfo line="214" column="4" position="Net:14, Ln:1, Col:1" />
                <LineMapInfo line="215" column="5" position="Net:14, Ln:1, Col:6" />
                <LineMapInfo line="216" column="5" position="Net:14, Ln:1, Col:13" />
                <LineMapInfo line="217" column="3" position="Net:14, Ln:1, Col:33" />
                <LineMapInfo line="219" column="1" position="Net:15" />
                <LineMapInfo line="220" column="1" position="Net:15" />
                <LineMapInfo line="221" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="222" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="223" column="5" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="224" column="4" position="Net:15, Ln:1, Col:1" />
                <LineMapInfo line="225" column="5" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="227" column="3" position="Net:15, Ln:1, Col:33" />
                <LineMapInfo line="228" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="229" column="3" position="Net:15, Ln:2, Col:33" />
                <LineMapInfo line="230" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="231" column="3" position="Net:15, Ln:3, Col:32" />
                <LineMapInfo line="232" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="233" column="3" position="Net:15, Ln:4, Col:33" />
                <LineMapInfo line="234" column="4" position="Net:15, Ln:1, Col:7" />
                <LineMapInfo line="235" column="3" position="Net:15, Ln:5, Col:33" />
                <LineMapInfo line="237" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="60DE5DB8" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="56" />
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
                <RelPosition x="1143" y="0" />
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
                <RelPosition x="993" y="18" />
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
                <RelPosition x="1143" y="0" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="1143" y="0" />
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
                <RelPosition x="933" y="94" />
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
                <RelPosition x="933" y="132" />
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
                <RelPosition x="993" y="18" />
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
                <RelPosition x="993" y="56" />
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
                <RelPosition x="1143" y="0" />
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
                <Size x="3" y="342" />
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
                <RelPosition x="933" y="56" />
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
                <RelPosition x="933" y="170" />
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
                <RelPosition x="933" y="208" />
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
                <RelPosition x="933" y="246" />
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
                <RelPosition x="933" y="284" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeStarted" edge="none" latch="set">
                <RelPosition x="963" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="963" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="963" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.HomeDone" edge="none" latch="reset">
                <RelPosition x="963" y="322" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="342" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="3" />
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
                  <Connection refConnectionPointOutId="11" />
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
                <RelPosition x="933" y="132" />
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
                <RelPosition x="963" y="56" />
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
                <RelPosition x="963" y="94" />
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
                <RelPosition x="993" y="18" />
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
                <RelPosition x="1143" y="0" />
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" edge="none">
                <RelPosition x="183" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.Status.SwivelArmHomed" edge="none" latch="set">
                <RelPosition x="933" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="963" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="reset">
                <RelPosition x="963" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="963" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.GripCap" edge="none" latch="reset">
                <RelPosition x="993" y="56" />
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
                <RelPosition x="1143" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="4" />
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
                <RelPosition x="933" y="18" />
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
                <RelPosition x="933" y="56" />
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
                <RelPosition x="1143" y="0" />
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
                <RelPosition x="933" y="170" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="56" />
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
                <RelPosition x="963" y="94" />
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
                <RelPosition x="963" y="132" />
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
                <RelPosition x="1143" y="0" />
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
            <Rung evaluationOrder="10" label="AutoConveyor">
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
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="933" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="11" label="AutoDistBay">
              <Documentation xsi:type="SimpleText"><![CDATA[Eject cap once conveyor is moving, wait until cap is sorted to do another]]></Documentation>
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
                <RelPosition x="963" y="56" />
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
                <RelPosition x="993" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="12" label="AutoGetCap">
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="94" />
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
                <RelPosition x="963" y="132" />
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
                <RelPosition x="993" y="56" />
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
                <RelPosition x="1143" y="0" />
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
            <Rung evaluationOrder="13" label="AutoDropOffCap">
              <Documentation xsi:type="SimpleText"><![CDATA[Move cap to drop off point and release it]]></Documentation>
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
                <RelPosition x="543" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.CapGripped" negated="true" edge="none">
                <RelPosition x="543" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" edge="none">
                <RelPosition x="723" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Status.ArmAtDropoff" negated="true" edge="none">
                <RelPosition x="723" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapDroppedOff" edge="none" latch="set">
                <RelPosition x="933" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="rising" latch="none">
                <RelPosition x="963" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="set">
                <RelPosition x="963" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="set">
                <RelPosition x="963" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveBwd" edge="none" latch="reset">
                <RelPosition x="963" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.GripCap" edge="none" latch="reset">
                <RelPosition x="993" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="14" label="AutoSendCap">
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="1143" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="15" label="AutoWaitForSort">
              <Documentation xsi:type="SimpleText"><![CDATA[Wait for confirmation that cap has been sorted]]></Documentation>
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
                <RelPosition x="933" y="94" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSent" edge="none" latch="reset">
                <RelPosition x="963" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="AutoInterface.State.CapSorted" edge="none" latch="reset">
                <RelPosition x="963" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="190" />
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
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="8" />
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