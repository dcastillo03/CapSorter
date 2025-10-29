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
        <Documentation xsi:type="SimpleText"><![CDATA[(*********************************************************************************
 * Copyright: B&R Industrial Automation GmbH 
 * Author:    Johnathon Cato 
 * Created:   October 28, 2025
 * Description: Distribution Station Manager task
 *********************************************************************************)]]></Documentation>
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
	zz$$$$_2_gAutoInterface_Cmd_Enab : BOOL;
	zz$$$$_3_r_trig_gAutoInterface_C : r_trig;
	zz$$$$_4_gAutoInterface_Cmd_Home : BOOL;
	zz$$$$_5_gAutoInterface_Status_H : BOOL;
	zz$$$$_6_gBayInterface_Status_Ca : BOOL;
	zz$$$$_7_gAutoInterface_Status_H : BOOL;
	zz$$$$_8_gArmInterface_Status_Ar : BOOL;
	zz$$$$_9_gAutoInterface_Status_H : BOOL;
	zz$$$$_10_gAutoInterface_Cmd_Cap : BOOL;
	zz$$$$_11_gAutoInterface_Cmd_Sto : BOOL;
	zz$$$$_12_gAutoInterface_State_C : BOOL;
	zz$$$$_13_gBayInterface_Status_C : BOOL;
	zz$$$$_14_gAutoInterface_State_C : BOOL;
	zz$$$$_15_gArmInterface_Status_C : BOOL;
	zz$$$$_16_gAutoInterface_State_C : BOOL;
	zz$$$$_17_gArmInterface_Status_A : BOOL;
	zz$$$$_18_gAutoInterface_State_C : BOOL;
	zz$$$$_19_TON : TON;
	zz$$$$_20_Q_TON_ : ANY;
	zz$$$$_21_f_trig_gDistConveyorIn : f_trig;
	zz$$$$_22_r_trig_gAutoInterface_ : r_trig;
	zz$$$$_23_gAutoInterface_State_C : BOOL;
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
LD	gAutoInterface.Cmd.EnableModules {CheckDataType := BOOL}
ST	zz$$$$_2_gAutoInterface_Cmd_Enab
ST	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
ST	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
AND	gBayInterface.Status.Active {CheckDataType := BOOL}
AND	gArmInterface.Status.Active {CheckDataType := BOOL}
AND	gDistConveyorInterface.Status.Active {CheckDataType := BOOL}
ST	gAutoInterface.Status.ModulesEnabled {CheckDataType := BOOL}

{NetworkNumber := 5}
AutoHomeStart:
LD	gAutoInterface.Cmd.Home {CheckDataType := BOOL}
ST	zz$$$$_3_r_trig_gAutoInterface_C.CLK
CAL	zz$$$$_3_r_trig_gAutoInterface_C
LD	zz$$$$_3_r_trig_gAutoInterface_C.Q
ST	zz$$$$_4_gAutoInterface_Cmd_Home
S	gAutoInterface.Status.HomeStarted {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
S	gDistConveyorInterface.Cmd.Power {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
ST	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	gArmInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
R	gAutoInterface.Status.DistBayHomed {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.Status.HomeDone {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_4_gAutoInterface_Cmd_Home
R	gAutoInterface.State.CapSent {CheckDataType := BOOL}

{NetworkNumber := 6}
HomeDistBay:
LD	gAutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ST	zz$$$$_5_gAutoInterface_Status_H
R	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_5_gAutoInterface_Status_H
S	gBayInterface.Cmd.CapTaken {CheckDataType := BOOL}
LD	zz$$$$_5_gAutoInterface_Status_H
ANDN	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
ANDN	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_6_gBayInterface_Status_Ca
R	gBayInterface.Cmd.CapTaken {CheckDataType := BOOL}
LD	zz$$$$_6_gBayInterface_Status_Ca
S	gAutoInterface.Status.DistBayHomed {CheckDataType := BOOL}

{NetworkNumber := 7}
HomeSwivelArm:
LD	gAutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ANDN	gAutoInterface.Status.HomeDone {CheckDataType := BOOL}
ST	zz$$$$_7_gAutoInterface_Status_H
S	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_7_gAutoInterface_Status_H
R	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_7_gAutoInterface_Status_H
R	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
LD	zz$$$$_7_gAutoInterface_Status_H
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_8_gArmInterface_Status_Ar
R	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_8_gArmInterface_Status_Ar
S	gAutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}

{NetworkNumber := 8}
HomeDistConveyor:
LD	gAutoInterface.Status.HomeStarted {CheckDataType := BOOL}
ST	zz$$$$_9_gAutoInterface_Status_H
R	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_9_gAutoInterface_Status_H
ANDN	gDistConveyorInterface.Status.Moving {CheckDataType := BOOL}
S	gAutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}

{NetworkNumber := 9}
CheckHome:
LD	gAutoInterface.Status.DistBayHomed {CheckDataType := BOOL}
AND	gAutoInterface.Status.SwivelArmHomed {CheckDataType := BOOL}
AND	gAutoInterface.Status.ConveyorHomed {CheckDataType := BOOL}
AND	gAutoInterface.Cmd.CapsCleared {CheckDataType := BOOL}
ST	zz$$$$_10_gAutoInterface_Cmd_Cap
S	gAutoInterface.Status.HomeDone {CheckDataType := BOOL}
LD	zz$$$$_10_gAutoInterface_Cmd_Cap
R	gAutoInterface.Status.HomeStarted {CheckDataType := BOOL}
LD	zz$$$$_10_gAutoInterface_Cmd_Cap
R	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_10_gAutoInterface_Cmd_Cap
R	gArmInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_10_gAutoInterface_Cmd_Cap
R	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}

{NetworkNumber := 10}
StopCmd:
LD	gAutoInterface.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_11_gAutoInterface_Cmd_Sto
R	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_11_gAutoInterface_Cmd_Sto
R	gAutoInterface.Status.HomeDone {CheckDataType := BOOL}

{NetworkNumber := 11}
AutoModeCheck:
LDN	gAutoInterface.Cmd.EnableAutoMode {CheckDataType := BOOL}
OR(	gAutoInterface.Cmd.Stop {CheckDataType := BOOL}
	ANDN	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
)
RETC

{NetworkNumber := 12}
AutoConveyor:
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gAutoInterface.Status.HomeDone {CheckDataType := BOOL}
ANDN	gAutoInterface.Cmd.Stop {CheckDataType := BOOL}
S	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 13}
AutoDistBay:
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gDistConveyorInterface.Status.Moving {CheckDataType := BOOL}
ANDN	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_12_gAutoInterface_State_C
S	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_12_gAutoInterface_State_C
AND	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
ST	zz$$$$_13_gBayInterface_Status_C
S	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_13_gBayInterface_Status_C
R	gBayInterface.Cmd.Eject {CheckDataType := BOOL}

{NetworkNumber := 14}
AutoGetCap:
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
ANDN	gAutoInterface.State.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_14_gAutoInterface_State_C
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_14_gAutoInterface_State_C
AND	gArmInterface.Status.ArmAtPickup {CheckDataType := BOOL}
S	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_14_gAutoInterface_State_C
AND	gArmInterface.Status.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_15_gArmInterface_Status_C
S	gAutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_15_gArmInterface_Status_C
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}

{NetworkNumber := 15}
AutoCapToDropOff:
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gAutoInterface.State.CapGripped {CheckDataType := BOOL}
ANDN	gAutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
ST	zz$$$$_16_gAutoInterface_State_C
S	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_16_gAutoInterface_State_C
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_17_gArmInterface_Status_A
R	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
S	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
S	gAutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_17_gArmInterface_Status_A
R	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 16}
AutoDropOffCap:
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gAutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
ANDN	gAutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
ST	zz$$$$_18_gAutoInterface_State_C
AND	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
S	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_18_gAutoInterface_State_C
ANDN	gArmInterface.Status.ArmAtDropoff {CheckDataType := BOOL}
ST	zz$$$$_19_TON.IN
LD	ARM_BACKOFF_TIME
ST	zz$$$$_19_TON.PT
CAL	zz$$$$_19_TON
LD	zz$$$$_19_TON.Q
ST	zz$$$$_20_Q_TON_
R	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
LD	zz$$$$_20_Q_TON_
S	gAutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_20_Q_TON_
R	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}

{NetworkNumber := 17}
AutoSendCap:
LD	gDistConveyorInterface.Status.CapAtExit {CheckDataType := BOOL}
ST	zz$$$$_21_f_trig_gDistConveyorIn.CLK
CAL	zz$$$$_21_f_trig_gDistConveyorIn
LD	gAutoInterface.Cmd.Start {CheckDataType := BOOL}
AND	gAutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
AND	zz$$$$_21_f_trig_gDistConveyorIn.Q
S	gAutoInterface.State.CapSent {CheckDataType := BOOL}

{NetworkNumber := 18}
AutoWaitForSort:
LD	gAutoInterface.State.CapSorted {CheckDataType := BOOL}
ST	zz$$$$_22_r_trig_gAutoInterface_.CLK
CAL	zz$$$$_22_r_trig_gAutoInterface_
LD	gAutoInterface.State.CapSent {CheckDataType := BOOL}
AND	zz$$$$_22_r_trig_gAutoInterface_.Q
ST	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapDroppedOff {CheckDataType := BOOL}
LD	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapSent {CheckDataType := BOOL}
LD	zz$$$$_23_gAutoInterface_State_C
R	gAutoInterface.State.CapSorted {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="23" column="1" position="Net:16, Ln:2, Col:32" />
                <LineMapInfo line="31" column="1" position="Net:1" />
                <LineMapInfo line="32" column="1" position="Net:1" />
                <LineMapInfo line="33" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:1, Col:37" />
                <LineMapInfo line="37" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="38" column="4" position="Net:1, Ln:2, Col:37" />
                <LineMapInfo line="40" column="1" position="Net:2" />
                <LineMapInfo line="41" column="1" position="Net:2" />
                <LineMapInfo line="42" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="43" column="5" position="Net:2, Ln:1, Col:7" />
                <LineMapInfo line="44" column="4" position="Net:2, Ln:1, Col:38" />
                <LineMapInfo line="46" column="1" position="Net:3" />
                <LineMapInfo line="47" column="1" position="Net:3" />
                <LineMapInfo line="48" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="50" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="52" column="5" position="Net:3, Ln:1, Col:7" />
                <LineMapInfo line="53" column="4" position="Net:3, Ln:1, Col:37" />
                <LineMapInfo line="55" column="1" position="Net:4" />
                <LineMapInfo line="56" column="1" position="Net:4" />
                <LineMapInfo line="57" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="59" column="4" position="Net:4, Ln:1, Col:38" />
                <LineMapInfo line="60" column="4" position="Net:4, Ln:2, Col:38" />
                <LineMapInfo line="61" column="4" position="Net:4, Ln:3, Col:36" />
                <LineMapInfo line="62" column="5" position="Net:4, Ln:4, Col:8" />
                <LineMapInfo line="63" column="5" position="Net:4, Ln:4, Col:13" />
                <LineMapInfo line="64" column="5" position="Net:4, Ln:4, Col:18" />
                <LineMapInfo line="65" column="4" position="Net:4, Ln:4, Col:36" />
                <LineMapInfo line="67" column="1" position="Net:5" />
                <LineMapInfo line="68" column="1" position="Net:5" />
                <LineMapInfo line="69" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="70" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="71" column="5" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="72" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="74" column="3" position="Net:5, Ln:1, Col:36" />
                <LineMapInfo line="75" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="76" column="3" position="Net:5, Ln:2, Col:36" />
                <LineMapInfo line="77" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="78" column="4" position="Net:5, Ln:3, Col:37" />
                <LineMapInfo line="79" column="4" position="Net:5, Ln:4, Col:37" />
                <LineMapInfo line="80" column="4" position="Net:5, Ln:5, Col:36" />
                <LineMapInfo line="81" column="3" position="Net:5, Ln:6, Col:36" />
                <LineMapInfo line="82" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="83" column="3" position="Net:5, Ln:7, Col:36" />
                <LineMapInfo line="84" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="85" column="3" position="Net:5, Ln:8, Col:36" />
                <LineMapInfo line="86" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="87" column="3" position="Net:5, Ln:9, Col:37" />
                <LineMapInfo line="88" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="89" column="3" position="Net:5, Ln:10, Col:37" />
                <LineMapInfo line="90" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="91" column="3" position="Net:5, Ln:11, Col:37" />
                <LineMapInfo line="92" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="93" column="3" position="Net:5, Ln:12, Col:36" />
                <LineMapInfo line="94" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="95" column="3" position="Net:5, Ln:13, Col:36" />
                <LineMapInfo line="96" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="97" column="3" position="Net:5, Ln:14, Col:37" />
                <LineMapInfo line="99" column="1" position="Net:6" />
                <LineMapInfo line="100" column="1" position="Net:6" />
                <LineMapInfo line="101" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="103" column="3" position="Net:6, Ln:1, Col:38" />
                <LineMapInfo line="104" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="105" column="3" position="Net:6, Ln:2, Col:37" />
                <LineMapInfo line="106" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="107" column="6" position="Net:6, Ln:3, Col:8" />
                <LineMapInfo line="108" column="6" position="Net:6, Ln:3, Col:13" />
                <LineMapInfo line="110" column="3" position="Net:6, Ln:3, Col:37" />
                <LineMapInfo line="111" column="4" position="Net:6, Ln:3, Col:13" />
                <LineMapInfo line="112" column="3" position="Net:6, Ln:4, Col:36" />
                <LineMapInfo line="114" column="1" position="Net:7" />
                <LineMapInfo line="115" column="1" position="Net:7" />
                <LineMapInfo line="116" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="117" column="6" position="Net:7, Ln:1, Col:8" />
                <LineMapInfo line="119" column="3" position="Net:7, Ln:1, Col:37" />
                <LineMapInfo line="120" column="4" position="Net:7, Ln:1, Col:8" />
                <LineMapInfo line="121" column="3" position="Net:7, Ln:2, Col:38" />
                <LineMapInfo line="122" column="4" position="Net:7, Ln:1, Col:8" />
                <LineMapInfo line="123" column="3" position="Net:7, Ln:3, Col:37" />
                <LineMapInfo line="124" column="4" position="Net:7, Ln:1, Col:8" />
                <LineMapInfo line="125" column="5" position="Net:7, Ln:4, Col:14" />
                <LineMapInfo line="127" column="3" position="Net:7, Ln:4, Col:37" />
                <LineMapInfo line="128" column="4" position="Net:7, Ln:4, Col:14" />
                <LineMapInfo line="129" column="3" position="Net:7, Ln:5, Col:36" />
                <LineMapInfo line="131" column="1" position="Net:8" />
                <LineMapInfo line="132" column="1" position="Net:8" />
                <LineMapInfo line="133" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="135" column="3" position="Net:8, Ln:1, Col:36" />
                <LineMapInfo line="136" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="137" column="6" position="Net:8, Ln:2, Col:8" />
                <LineMapInfo line="138" column="3" position="Net:8, Ln:2, Col:36" />
                <LineMapInfo line="140" column="1" position="Net:9" />
                <LineMapInfo line="141" column="1" position="Net:9" />
                <LineMapInfo line="142" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="143" column="5" position="Net:9, Ln:1, Col:8" />
                <LineMapInfo line="144" column="5" position="Net:9, Ln:1, Col:15" />
                <LineMapInfo line="145" column="5" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="147" column="3" position="Net:9, Ln:1, Col:37" />
                <LineMapInfo line="148" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="149" column="3" position="Net:9, Ln:2, Col:36" />
                <LineMapInfo line="150" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="151" column="3" position="Net:9, Ln:3, Col:37" />
                <LineMapInfo line="152" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="153" column="3" position="Net:9, Ln:4, Col:37" />
                <LineMapInfo line="154" column="4" position="Net:9, Ln:1, Col:22" />
                <LineMapInfo line="155" column="3" position="Net:9, Ln:5, Col:36" />
                <LineMapInfo line="157" column="1" position="Net:10" />
                <LineMapInfo line="158" column="1" position="Net:10" />
                <LineMapInfo line="159" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="161" column="3" position="Net:10, Ln:1, Col:36" />
                <LineMapInfo line="162" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="163" column="3" position="Net:10, Ln:2, Col:37" />
                <LineMapInfo line="165" column="1" position="Net:11" />
                <LineMapInfo line="166" column="1" position="Net:11" />
                <LineMapInfo line="167" column="5" position="Net:11, Ln:1, Col:1" />
                <LineMapInfo line="168" column="5" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="169" column="7" position="Net:11, Ln:2, Col:6" />
                <LineMapInfo line="173" column="1" position="Net:12" />
                <LineMapInfo line="174" column="1" position="Net:12" />
                <LineMapInfo line="175" column="4" position="Net:12, Ln:1, Col:1" />
                <LineMapInfo line="176" column="5" position="Net:12, Ln:1, Col:6" />
                <LineMapInfo line="177" column="6" position="Net:12, Ln:1, Col:12" />
                <LineMapInfo line="178" column="3" position="Net:12, Ln:1, Col:36" />
                <LineMapInfo line="180" column="1" position="Net:13" />
                <LineMapInfo line="181" column="1" position="Net:13" />
                <LineMapInfo line="182" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="183" column="5" position="Net:13, Ln:1, Col:6" />
                <LineMapInfo line="184" column="6" position="Net:13, Ln:1, Col:13" />
                <LineMapInfo line="186" column="3" position="Net:13, Ln:1, Col:38" />
                <LineMapInfo line="187" column="4" position="Net:13, Ln:1, Col:13" />
                <LineMapInfo line="188" column="5" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="190" column="3" position="Net:13, Ln:2, Col:37" />
                <LineMapInfo line="191" column="4" position="Net:13, Ln:2, Col:19" />
                <LineMapInfo line="192" column="3" position="Net:13, Ln:3, Col:38" />
                <LineMapInfo line="194" column="1" position="Net:14" />
                <LineMapInfo line="195" column="1" position="Net:14" />
                <LineMapInfo line="196" column="4" position="Net:14, Ln:1, Col:1" />
                <LineMapInfo line="197" column="5" position="Net:14, Ln:1, Col:6" />
                <LineMapInfo line="198" column="6" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="200" column="3" position="Net:14, Ln:1, Col:37" />
                <LineMapInfo line="201" column="4" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="202" column="5" position="Net:14, Ln:2, Col:18" />
                <LineMapInfo line="203" column="3" position="Net:14, Ln:2, Col:38" />
                <LineMapInfo line="204" column="4" position="Net:14, Ln:1, Col:12" />
                <LineMapInfo line="205" column="5" position="Net:14, Ln:3, Col:18" />
                <LineMapInfo line="207" column="3" position="Net:14, Ln:3, Col:37" />
                <LineMapInfo line="208" column="4" position="Net:14, Ln:3, Col:18" />
                <LineMapInfo line="209" column="3" position="Net:14, Ln:4, Col:37" />
                <LineMapInfo line="211" column="1" position="Net:15" />
                <LineMapInfo line="212" column="1" position="Net:15" />
                <LineMapInfo line="213" column="4" position="Net:15, Ln:1, Col:1" />
                <LineMapInfo line="214" column="5" position="Net:15, Ln:1, Col:6" />
                <LineMapInfo line="215" column="6" position="Net:15, Ln:1, Col:12" />
                <LineMapInfo line="217" column="3" position="Net:15, Ln:1, Col:37" />
                <LineMapInfo line="218" column="4" position="Net:15, Ln:1, Col:12" />
                <LineMapInfo line="219" column="5" position="Net:15, Ln:2, Col:19" />
                <LineMapInfo line="221" column="3" position="Net:15, Ln:2, Col:38" />
                <LineMapInfo line="222" column="4" position="Net:15, Ln:2, Col:19" />
                <LineMapInfo line="223" column="3" position="Net:15, Ln:3, Col:37" />
                <LineMapInfo line="224" column="4" position="Net:15, Ln:2, Col:19" />
                <LineMapInfo line="225" column="3" position="Net:15, Ln:4, Col:36" />
                <LineMapInfo line="226" column="4" position="Net:15, Ln:2, Col:19" />
                <LineMapInfo line="227" column="3" position="Net:15, Ln:5, Col:37" />
                <LineMapInfo line="229" column="1" position="Net:16" />
                <LineMapInfo line="230" column="1" position="Net:16" />
                <LineMapInfo line="231" column="4" position="Net:16, Ln:1, Col:1" />
                <LineMapInfo line="232" column="5" position="Net:16, Ln:1, Col:6" />
                <LineMapInfo line="233" column="6" position="Net:16, Ln:1, Col:13" />
                <LineMapInfo line="235" column="5" position="Net:16, Ln:1, Col:20" />
                <LineMapInfo line="236" column="3" position="Net:16, Ln:1, Col:37" />
                <LineMapInfo line="237" column="4" position="Net:16, Ln:1, Col:13" />
                <LineMapInfo line="238" column="6" position="Net:16, Ln:3, Col:20" />
                <LineMapInfo line="239" column="4" position="Net:16, Ln:2, Col:32 [Block input IN]" />
                <LineMapInfo line="240" column="4" position="Net:16, Ln:4, Col:27" />
                <LineMapInfo line="241" column="4" position="Net:16, Ln:2, Col:32 [Block input PT]" />
                <LineMapInfo line="242" column="5" position="Net:16, Ln:2, Col:32" />
                <LineMapInfo line="243" column="4" position="Net:16, Ln:2, Col:32 [Block output Q]" />
                <LineMapInfo line="245" column="3" position="Net:16, Ln:3, Col:37" />
                <LineMapInfo line="246" column="4" position="Net:16, Ln:2, Col:32 [Block output Q]" />
                <LineMapInfo line="247" column="3" position="Net:16, Ln:4, Col:36" />
                <LineMapInfo line="248" column="4" position="Net:16, Ln:2, Col:32 [Block output Q]" />
                <LineMapInfo line="249" column="3" position="Net:16, Ln:5, Col:37" />
                <LineMapInfo line="251" column="1" position="Net:17" />
                <LineMapInfo line="252" column="1" position="Net:17" />
                <LineMapInfo line="253" column="4" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="254" column="4" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="255" column="5" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="256" column="4" position="Net:17, Ln:1, Col:1" />
                <LineMapInfo line="257" column="5" position="Net:17, Ln:1, Col:6" />
                <LineMapInfo line="258" column="5" position="Net:17, Ln:1, Col:13" />
                <LineMapInfo line="259" column="3" position="Net:17, Ln:1, Col:37" />
                <LineMapInfo line="261" column="1" position="Net:18" />
                <LineMapInfo line="262" column="1" position="Net:18" />
                <LineMapInfo line="263" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="264" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="265" column="5" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="266" column="4" position="Net:18, Ln:1, Col:1" />
                <LineMapInfo line="267" column="5" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="269" column="3" position="Net:18, Ln:1, Col:37" />
                <LineMapInfo line="270" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="271" column="3" position="Net:18, Ln:2, Col:37" />
                <LineMapInfo line="272" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="273" column="3" position="Net:18, Ln:3, Col:36" />
                <LineMapInfo line="274" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="275" column="3" position="Net:18, Ln:4, Col:36" />
                <LineMapInfo line="276" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="277" column="3" position="Net:18, Ln:5, Col:37" />
                <LineMapInfo line="278" column="4" position="Net:18, Ln:1, Col:7" />
                <LineMapInfo line="279" column="3" position="Net:18, Ln:6, Col:37" />
                <LineMapInfo line="281" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="BE06DA8E" />
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
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1083" y="56" />
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
                <RelPosition x="1263" y="0" />
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
                <RelPosition x="1113" y="18" />
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
                <RelPosition x="1263" y="0" />
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
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.EnableModules" edge="none">
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
                <RelPosition x="1053" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.ModulesEnabled" edge="none" latch="none">
                <RelPosition x="1053" y="132" />
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
                <RelPosition x="1113" y="18" />
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
                <RelPosition x="1113" y="56" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Home" edge="rising">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.HomeStarted" edge="none" latch="set">
                <RelPosition x="1053" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.Power" edge="none" latch="set">
                <RelPosition x="1053" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="none">
                <RelPosition x="1053" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.DistBayHomed" edge="none" latch="reset">
                <RelPosition x="1053" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.SwivelArmHomed" edge="none" latch="reset">
                <RelPosition x="1053" y="246" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.ConveyorHomed" edge="none" latch="reset">
                <RelPosition x="1053" y="284" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapAtDropOff" edge="none" latch="reset">
                <RelPosition x="1053" y="436" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapDroppedOff" edge="none" latch="reset">
                <RelPosition x="1053" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Cmd.ErrorReset" edge="none" latch="none">
                <RelPosition x="1083" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.ErrorReset" edge="none" latch="none">
                <RelPosition x="1083" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.HomeDone" edge="none" latch="reset">
                <RelPosition x="1083" y="322" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapEjected" edge="none" latch="reset">
                <RelPosition x="1083" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapGripped" edge="none" latch="reset">
                <RelPosition x="1083" y="398" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapSent" edge="none" latch="reset">
                <RelPosition x="1083" y="512" />
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
                <RelPosition x="1263" y="0" />
                <Size x="3" y="532" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="4" />
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
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="10" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.HomeStarted" edge="none">
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Eject" negated="true" edge="none">
                <RelPosition x="213" y="94" />
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
                <RelPosition x="363" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.DistBayHomed" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
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
                <RelPosition x="1083" y="56" />
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
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1113" y="18" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.HomeStarted" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.HomeDone" negated="true" edge="none">
                <RelPosition x="213" y="18" />
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
                <RelPosition x="393" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.SwivelArmHomed" edge="none" latch="set">
                <RelPosition x="1053" y="170" />
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
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1083" y="132" />
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
                <RelPosition x="1113" y="56" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.HomeStarted" edge="none">
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Status.Moving" negated="true" edge="none">
                <RelPosition x="213" y="56" />
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
                <RelPosition x="1053" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.ConveyorHomed" edge="none" latch="set">
                <RelPosition x="1053" y="56" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.DistBayHomed" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.SwivelArmHomed" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.ConveyorHomed" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.CapsCleared" edge="none">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.HomeStarted" edge="none" latch="reset">
                <RelPosition x="1053" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="reset">
                <RelPosition x="1053" y="170" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.HomeDone" edge="none" latch="set">
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1083" y="132" />
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
                <RelPosition x="1263" y="0" />
                <Size x="3" y="190" />
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
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="7" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Stop" edge="none">
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
                <RelPosition x="1053" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.Status.HomeDone" edge="none" latch="reset">
                <RelPosition x="1083" y="56" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.EnableAutoMode" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Stop" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapEjected" negated="true" edge="none">
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
                <RelPosition x="1173" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Status.HomeDone" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Stop" negated="true" edge="none">
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
                <RelPosition x="1053" y="18" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapEjected" negated="true" edge="none">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapEjected" edge="none" latch="set">
                <RelPosition x="1083" y="56" />
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
                <RelPosition x="1113" y="18" />
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
                <RelPosition x="1113" y="94" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapEjected" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapGripped" negated="true" edge="none">
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
                <RelPosition x="1083" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapGripped" edge="none" latch="set">
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1083" y="132" />
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
                <RelPosition x="1113" y="56" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapGripped" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapAtDropOff" negated="true" edge="none">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapAtDropOff" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="1083" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gArmInterface.Cmd.EjectCap" edge="none" latch="set">
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1083" y="170" />
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
                <RelPosition x="1113" y="56" />
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
                <RelPosition x="1263" y="0" />
                <Size x="3" y="190" />
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
                  <Connection refConnectionPointOutId="6" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapAtDropOff" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapDroppedOff" negated="true" edge="none">
                <RelPosition x="363" y="18" />
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
                <RelPosition x="573" y="18" />
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
                <RelPosition x="573" y="94" />
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
                <RelPosition x="783" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="933" y="76" />
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapDroppedOff" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
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
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1083" y="94" />
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
                <RelPosition x="1083" y="170" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapDroppedOff" edge="none">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapSent" edge="none" latch="set">
                <RelPosition x="1083" y="18" />
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
                <RelPosition x="1263" y="0" />
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapSent" edge="none">
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
              <LdObject xsi:type="Contact" operand="gAutoInterface.State.CapSorted" edge="rising">
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
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapAtDropOff" edge="none" latch="reset">
                <RelPosition x="1053" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapDroppedOff" edge="none" latch="reset">
                <RelPosition x="1053" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapEjected" edge="none" latch="reset">
                <RelPosition x="1083" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapGripped" edge="none" latch="reset">
                <RelPosition x="1083" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapSent" edge="none" latch="reset">
                <RelPosition x="1083" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gAutoInterface.State.CapSorted" edge="none" latch="reset">
                <RelPosition x="1083" y="208" />
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
                <RelPosition x="1263" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="5" />
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