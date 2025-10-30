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
 * Created:   October 27, 2025
 * Description: Distribution Conveyor control task
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
	zz$$$$_0_Eno_ComputeBlock : BOOL;
	zz$$$$_1_gDistConveyorInterface_ : BOOL;
	zz$$$$_2_Eno_ComputeBlock : BOOL;
	zz$$$$_3_gDistConveyorInterface_ : BOOL;
	zz$$$$_4_Eno_ComputeBlock : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_Eno_ComputeBlock : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_Eno_ComputeBlock : BOOL;
	zz$$$$_9_Eno_ComputeBlock : BOOL;
	zz$$$$_10_Internal_Status_Error_ : BOOL;
	zz$$$$_11_TON : TON;
	zz$$$$_12_gDistConveyorInterface : BOOL;
	zz$$$$_13_f_trig_Internal_Status : f_trig;
	zz$$$$_14_Internal_Status_CapAtD : BOOL;
	zz$$$$_15_Eno_ComputeBlock : BOOL;
	zz$$$$_16_f_trig_Internal_Status : f_trig;
	zz$$$$_17_TON : TON;
	zz$$$$_18_Q_TON_ : ANY;
	zz$$$$_19_Eno_ComputeBlock : BOOL;
	zz$$$$_20_IOInput_ModuleOK_AndRe : BOOL;
	zz$$$$_21_Internal_Status_Module : BOOL;
	zz$$$$_22_Eno_ComputeBlock : BOOL;
	zz$$$$_23_TON : TON;
	zz$$$$_24_Internal_Status_Module : BOOL;
	zz$$$$_25_Eno_ComputeBlock : BOOL;
	zz$$$$_26_gDistConveyorInterface : BOOL;
	zz$$$$_27_Eno_ComputeBlock : BOOL;
	zz$$$$_28_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
SetPars:
LD	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_0_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	gDistConveyorInterface.Par
ST	Internal.Par
ll$$$$_IF_0:

{NetworkNumber := 2}
ReadIO:
LD	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_1_gDistConveyorInterface_
AND	IOInput.CapAtDropOff {CheckDataType := BOOL}
ST	Internal.Status.CapAtDropOff {CheckDataType := BOOL}
LD	zz$$$$_1_gDistConveyorInterface_
AND	IOInput.CapAtExit {CheckDataType := BOOL}
ST	Internal.Status.CapAtExit {CheckDataType := BOOL}
LD	zz$$$$_1_gDistConveyorInterface_
ST	zz$$$$_2_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	errCONV_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_1:

{NetworkNumber := 3}
UpdatePars:
LD	gDistConveyorInterface.Cmd.UpdatePar {CheckDataType := BOOL}
ST	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_4_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	Internal.Par.SetSpeed_mms
ST	DistConveyor.Parameters.Velocity
ll$$$$_IF_2:
LD	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	Internal.Par.MoveAcceleration_mmss
ST	DistConveyor.Parameters.Acceleration
ll$$$$_IF_3:
LD	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_6_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	Internal.Par.MoveAcceleration_mmss
ST	DistConveyor.Parameters.Deceleration
ll$$$$_IF_4:
LD	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	Internal.Par.JogSpeed_mms
ST	DistConveyor.Parameters.Jog.Velocity
ll$$$$_IF_5:
LD	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_8_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Par.JogAcceleration_mmss
ST	DistConveyor.Parameters.Jog.Acceleration
ll$$$$_IF_6:
LD	zz$$$$_3_gDistConveyorInterface_
ST	zz$$$$_9_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	Internal.Par.JogAcceleration_mmss
ST	DistConveyor.Parameters.Jog.Deceleration
ll$$$$_IF_7:

{NetworkNumber := 4}
ErrorReset:
LD	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
AND	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_10_Internal_Status_Error_
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_10_Internal_Status_Error_
ST	zz$$$$_11_TON.IN
LD	AXIS_RESET_TIME
ST	zz$$$$_11_TON.PT
CAL	zz$$$$_11_TON
LD	zz$$$$_11_TON.Q
R	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_10_Internal_Status_Error_
R	Internal.Status.CapInTransit {CheckDataType := BOOL}

{NetworkNumber := 5}
ErrorCatch:
LD	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_12_gDistConveyorInterface
LD	Internal.Status.CapAtDropOff {CheckDataType := BOOL}
ST	zz$$$$_13_f_trig_Internal_Status.CLK
CAL	zz$$$$_13_f_trig_Internal_Status
LD	zz$$$$_12_gDistConveyorInterface
AND	gDistConveyorInterface.Cmd.JogBwd {CheckDataType := BOOL}
AND	zz$$$$_13_f_trig_Internal_Status.Q
ST	zz$$$$_14_Internal_Status_CapAtD
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_14_Internal_Status_CapAtD
ST	zz$$$$_15_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	errCONV_CAP_OFF_BACK
ST	Internal.Status.ErrorID
ll$$$$_IF_8:
LD	Internal.Status.CapAtDropOff {CheckDataType := BOOL}
ST	zz$$$$_16_f_trig_Internal_Status.CLK
CAL	zz$$$$_16_f_trig_Internal_Status
LD	zz$$$$_12_gDistConveyorInterface
AND	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
AND	zz$$$$_16_f_trig_Internal_Status.Q
S	Internal.Status.CapInTransit {CheckDataType := BOOL}
LD	zz$$$$_12_gDistConveyorInterface
AND	Internal.Status.CapAtExit {CheckDataType := BOOL}
R	Internal.Status.CapInTransit {CheckDataType := BOOL}
LD	zz$$$$_12_gDistConveyorInterface
AND	Internal.Status.CapInTransit {CheckDataType := BOOL}
ST	zz$$$$_17_TON.IN
LD	CAP_TRANSIT_TIME
ST	zz$$$$_17_TON.PT
CAL	zz$$$$_17_TON
LD	zz$$$$_17_TON.Q
ST	zz$$$$_18_Q_TON_
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_18_Q_TON_
ST	zz$$$$_19_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	errCONV_CAP_LOST
ST	Internal.Status.ErrorID
ll$$$$_IF_9:
LD	zz$$$$_12_gDistConveyorInterface
ANDN	IOInput.ModuleOK {CheckDataType := BOOL}
ST	zz$$$$_20_IOInput_ModuleOK_AndRe
R	Internal.Status.ModuleOK {CheckDataType := BOOL}
LD	zz$$$$_20_IOInput_ModuleOK_AndRe
R	gDistConveyorInterface.Cmd.Power {CheckDataType := BOOL}
LD	zz$$$$_12_gDistConveyorInterface
ANDN	Internal.Status.ModuleOK {CheckDataType := BOOL}
ST	zz$$$$_21_Internal_Status_Module
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_21_Internal_Status_Module
ST	zz$$$$_22_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	errCONV_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_10:

{NetworkNumber := 6}
AxisFUB:
LD	gDistConveyorInterface.Cmd.Power {CheckDataType := BOOL}
ANDN	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_23_TON.IN
LD	AXIS_RESET_TIME
ST	zz$$$$_23_TON.PT
CAL	zz$$$$_23_TON
LD	gDistributionAxis
ADR
ST	DistConveyor.Basic.MpLink
LD	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
ST	DistConveyor.Basic.Enable
LD	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	DistConveyor.Basic.ErrorReset
LD	DistConveyor.Parameters
ADR
ST	DistConveyor.Basic.Parameters
LD	gDistConveyorInterface.Cmd.UpdatePar {CheckDataType := BOOL}
ST	DistConveyor.Basic.Update
LD	zz$$$$_23_TON.Q
ST	DistConveyor.Basic.Power
LD	gDistConveyorInterface.Cmd.MoveFwd {CheckDataType := BOOL}
ANDN	gDistConveyorInterface.Cmd.JogBwd {CheckDataType := BOOL}
ANDN	gDistConveyorInterface.Cmd.JogFwd {CheckDataType := BOOL}
ST	DistConveyor.Basic.MoveVelocity
LD	gDistConveyorInterface.Cmd.JogFwd {CheckDataType := BOOL}
ANDN	gDistConveyorInterface.Cmd.JogBwd {CheckDataType := BOOL}
ST	DistConveyor.Basic.JogPositive
LD	gDistConveyorInterface.Cmd.JogBwd {CheckDataType := BOOL}
ANDN	gDistConveyorInterface.Cmd.JogFwd {CheckDataType := BOOL}
ANDN	Internal.Status.CapAtDropOff {CheckDataType := BOOL}
ST	DistConveyor.Basic.JogNegative
CAL	DistConveyor.Basic
LD	DistConveyor.Basic.Error
ST	Internal.Status.AxisError
LD	DistConveyor.Basic.StatusID
ST	Internal.Status.AxisStatusID
LD	DistConveyor.Basic.Velocity
ST	Internal.Status.Velocity_mms
LD	DistConveyor.Basic.PowerOn
ST	Internal.Status.PowerOn
LD	DistConveyor.Basic.MoveActive
ST	Internal.Status.Moving
LD	DistConveyor.Basic.Active
ST	Internal.Status.Active {CheckDataType := BOOL}

{NetworkNumber := 7}
ModuleOKRecover:
LD	IOInput.ModuleOK {CheckDataType := BOOL}
ANDN	Internal.Status.ModuleOK {CheckDataType := BOOL}
ST	zz$$$$_24_Internal_Status_Module
S	gDistConveyorInterface.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_24_Internal_Status_Module
S	Internal.Status.ModuleOK {CheckDataType := BOOL}
LD	zz$$$$_24_Internal_Status_Module
ST	zz$$$$_25_Eno_ComputeBlock
JMPCN ll$$$$_IF_11
Compute!	errCONV_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_11:

{NetworkNumber := 8}
Assignments:
LD	gDistConveyorInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_26_gDistConveyorInterface
ST	zz$$$$_27_Eno_ComputeBlock
JMPCN ll$$$$_IF_12
Compute!	gDistConveyorInterface.Cmd
ST	Internal.Cmd
ll$$$$_IF_12:
LD	zz$$$$_26_gDistConveyorInterface
ST	zz$$$$_28_Eno_ComputeBlock
JMPCN ll$$$$_IF_13
Compute!	Internal.Status
ST	gDistConveyorInterface.Status
ll$$$$_IF_13:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="15" column="1" position="Net:4, Ln:2, Col:16" />
                <LineMapInfo line="21" column="1" position="Net:5, Ln:6, Col:17" />
                <LineMapInfo line="27" column="1" position="Net:6, Ln:7, Col:16" />
                <LineMapInfo line="36" column="1" position="Net:1" />
                <LineMapInfo line="37" column="1" position="Net:1" />
                <LineMapInfo line="38" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="39" column="4" position="Net:1, Ln:1, Col:36 [Block input EN]" />
                <LineMapInfo line="41" column="10" position="Net:1, Ln:1, Col:36" />
                <LineMapInfo line="42" column="4" position="Net:1, Ln:2, Col:42" />
                <LineMapInfo line="45" column="1" position="Net:2" />
                <LineMapInfo line="46" column="1" position="Net:2" />
                <LineMapInfo line="47" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="49" column="5" position="Net:2, Ln:1, Col:8" />
                <LineMapInfo line="50" column="4" position="Net:2, Ln:1, Col:39" />
                <LineMapInfo line="51" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="52" column="5" position="Net:2, Ln:2, Col:8" />
                <LineMapInfo line="53" column="4" position="Net:2, Ln:2, Col:40" />
                <LineMapInfo line="54" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="55" column="4" position="Net:2, Ln:3, Col:36 [Block input EN]" />
                <LineMapInfo line="57" column="10" position="Net:2, Ln:3, Col:36" />
                <LineMapInfo line="58" column="4" position="Net:2, Ln:4, Col:41" />
                <LineMapInfo line="61" column="1" position="Net:3" />
                <LineMapInfo line="62" column="1" position="Net:3" />
                <LineMapInfo line="63" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="65" column="4" position="Net:3, Ln:1, Col:33 [Block input EN]" />
                <LineMapInfo line="67" column="10" position="Net:3, Ln:1, Col:33" />
                <LineMapInfo line="68" column="4" position="Net:3, Ln:2, Col:39" />
                <LineMapInfo line="70" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="71" column="4" position="Net:3, Ln:3, Col:30 [Block input EN]" />
                <LineMapInfo line="73" column="10" position="Net:3, Ln:3, Col:30" />
                <LineMapInfo line="74" column="4" position="Net:3, Ln:4, Col:38" />
                <LineMapInfo line="76" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="77" column="4" position="Net:3, Ln:5, Col:30 [Block input EN]" />
                <LineMapInfo line="79" column="10" position="Net:3, Ln:5, Col:30" />
                <LineMapInfo line="80" column="4" position="Net:3, Ln:6, Col:38" />
                <LineMapInfo line="82" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="83" column="4" position="Net:3, Ln:7, Col:32 [Block input EN]" />
                <LineMapInfo line="85" column="10" position="Net:3, Ln:7, Col:32" />
                <LineMapInfo line="86" column="4" position="Net:3, Ln:8, Col:38" />
                <LineMapInfo line="88" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="89" column="4" position="Net:3, Ln:9, Col:29 [Block input EN]" />
                <LineMapInfo line="91" column="10" position="Net:3, Ln:9, Col:29" />
                <LineMapInfo line="92" column="4" position="Net:3, Ln:10, Col:37" />
                <LineMapInfo line="94" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="95" column="4" position="Net:3, Ln:11, Col:29 [Block input EN]" />
                <LineMapInfo line="97" column="10" position="Net:3, Ln:11, Col:29" />
                <LineMapInfo line="98" column="4" position="Net:3, Ln:12, Col:37" />
                <LineMapInfo line="101" column="1" position="Net:4" />
                <LineMapInfo line="102" column="1" position="Net:4" />
                <LineMapInfo line="103" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="104" column="5" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="106" column="3" position="Net:4, Ln:1, Col:41" />
                <LineMapInfo line="107" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="108" column="4" position="Net:4, Ln:2, Col:16 [Block input IN]" />
                <LineMapInfo line="109" column="4" position="Net:4, Ln:4, Col:12" />
                <LineMapInfo line="110" column="4" position="Net:4, Ln:2, Col:16 [Block input PT]" />
                <LineMapInfo line="111" column="5" position="Net:4, Ln:2, Col:16" />
                <LineMapInfo line="112" column="4" position="Net:4, Ln:2, Col:16 [Block output Q]" />
                <LineMapInfo line="113" column="3" position="Net:4, Ln:3, Col:38" />
                <LineMapInfo line="114" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="115" column="3" position="Net:4, Ln:5, Col:40" />
                <LineMapInfo line="117" column="1" position="Net:5" />
                <LineMapInfo line="118" column="1" position="Net:5" />
                <LineMapInfo line="119" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="121" column="4" position="Net:5, Ln:1, Col:15" />
                <LineMapInfo line="122" column="4" position="Net:5, Ln:1, Col:15" />
                <LineMapInfo line="123" column="5" position="Net:5, Ln:1, Col:15" />
                <LineMapInfo line="125" column="5" position="Net:5, Ln:1, Col:8" />
                <LineMapInfo line="126" column="5" position="Net:5, Ln:1, Col:15" />
                <LineMapInfo line="128" column="3" position="Net:5, Ln:1, Col:41" />
                <LineMapInfo line="129" column="4" position="Net:5, Ln:1, Col:15" />
                <LineMapInfo line="130" column="4" position="Net:5, Ln:2, Col:35 [Block input EN]" />
                <LineMapInfo line="132" column="10" position="Net:5, Ln:2, Col:35" />
                <LineMapInfo line="133" column="4" position="Net:5, Ln:3, Col:41" />
                <LineMapInfo line="135" column="4" position="Net:5, Ln:4, Col:15" />
                <LineMapInfo line="136" column="4" position="Net:5, Ln:4, Col:15" />
                <LineMapInfo line="137" column="5" position="Net:5, Ln:4, Col:15" />
                <LineMapInfo line="138" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="139" column="5" position="Net:5, Ln:4, Col:8" />
                <LineMapInfo line="140" column="5" position="Net:5, Ln:4, Col:15" />
                <LineMapInfo line="141" column="3" position="Net:5, Ln:4, Col:40" />
                <LineMapInfo line="142" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="143" column="5" position="Net:5, Ln:5, Col:8" />
                <LineMapInfo line="144" column="3" position="Net:5, Ln:5, Col:40" />
                <LineMapInfo line="145" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="146" column="5" position="Net:5, Ln:7, Col:8" />
                <LineMapInfo line="147" column="4" position="Net:5, Ln:6, Col:17 [Block input IN]" />
                <LineMapInfo line="148" column="4" position="Net:5, Ln:8, Col:13" />
                <LineMapInfo line="149" column="4" position="Net:5, Ln:6, Col:17 [Block input PT]" />
                <LineMapInfo line="150" column="5" position="Net:5, Ln:6, Col:17" />
                <LineMapInfo line="151" column="4" position="Net:5, Ln:6, Col:17 [Block output Q]" />
                <LineMapInfo line="153" column="3" position="Net:5, Ln:7, Col:41" />
                <LineMapInfo line="154" column="4" position="Net:5, Ln:6, Col:17 [Block output Q]" />
                <LineMapInfo line="155" column="4" position="Net:5, Ln:8, Col:36 [Block input EN]" />
                <LineMapInfo line="157" column="10" position="Net:5, Ln:8, Col:36" />
                <LineMapInfo line="158" column="4" position="Net:5, Ln:9, Col:41" />
                <LineMapInfo line="160" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="161" column="6" position="Net:5, Ln:10, Col:8" />
                <LineMapInfo line="163" column="3" position="Net:5, Ln:10, Col:40" />
                <LineMapInfo line="164" column="4" position="Net:5, Ln:10, Col:8" />
                <LineMapInfo line="165" column="3" position="Net:5, Ln:11, Col:38" />
                <LineMapInfo line="166" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="167" column="6" position="Net:5, Ln:12, Col:8" />
                <LineMapInfo line="169" column="3" position="Net:5, Ln:12, Col:41" />
                <LineMapInfo line="170" column="4" position="Net:5, Ln:12, Col:8" />
                <LineMapInfo line="171" column="4" position="Net:5, Ln:13, Col:34 [Block input EN]" />
                <LineMapInfo line="173" column="10" position="Net:5, Ln:13, Col:34" />
                <LineMapInfo line="174" column="4" position="Net:5, Ln:14, Col:41" />
                <LineMapInfo line="177" column="1" position="Net:6" />
                <LineMapInfo line="178" column="1" position="Net:6" />
                <LineMapInfo line="179" column="4" position="Net:6, Ln:8, Col:1" />
                <LineMapInfo line="180" column="6" position="Net:6, Ln:8, Col:8" />
                <LineMapInfo line="181" column="4" position="Net:6, Ln:7, Col:16 [Block input IN]" />
                <LineMapInfo line="182" column="4" position="Net:6, Ln:9, Col:12" />
                <LineMapInfo line="183" column="4" position="Net:6, Ln:7, Col:16 [Block input PT]" />
                <LineMapInfo line="184" column="5" position="Net:6, Ln:7, Col:16" />
                <LineMapInfo line="185" column="4" position="Net:6, Ln:2, Col:23" />
                <LineMapInfo line="187" column="4" position="Net:6, Ln:1, Col:28 [Block input MpLink]" />
                <LineMapInfo line="188" column="4" position="Net:6, Ln:3, Col:1" />
                <LineMapInfo line="189" column="4" position="Net:6, Ln:1, Col:28 [Block input Enable]" />
                <LineMapInfo line="190" column="4" position="Net:6, Ln:4, Col:1" />
                <LineMapInfo line="191" column="4" position="Net:6, Ln:1, Col:28 [Block input ErrorReset]" />
                <LineMapInfo line="192" column="4" position="Net:6, Ln:5, Col:22" />
                <LineMapInfo line="194" column="4" position="Net:6, Ln:1, Col:28 [Block input Parameters]" />
                <LineMapInfo line="195" column="4" position="Net:6, Ln:6, Col:1" />
                <LineMapInfo line="196" column="4" position="Net:6, Ln:1, Col:28 [Block input Update]" />
                <LineMapInfo line="197" column="4" position="Net:6, Ln:7, Col:16 [Block output Q]" />
                <LineMapInfo line="198" column="4" position="Net:6, Ln:1, Col:28 [Block input Power]" />
                <LineMapInfo line="199" column="4" position="Net:6, Ln:10, Col:1" />
                <LineMapInfo line="200" column="6" position="Net:6, Ln:10, Col:8" />
                <LineMapInfo line="201" column="6" position="Net:6, Ln:10, Col:15" />
                <LineMapInfo line="202" column="4" position="Net:6, Ln:1, Col:28 [Block input MoveVelocity]" />
                <LineMapInfo line="203" column="4" position="Net:6, Ln:13, Col:1" />
                <LineMapInfo line="204" column="6" position="Net:6, Ln:13, Col:8" />
                <LineMapInfo line="205" column="4" position="Net:6, Ln:1, Col:28 [Block input JogPositive]" />
                <LineMapInfo line="206" column="4" position="Net:6, Ln:14, Col:1" />
                <LineMapInfo line="207" column="6" position="Net:6, Ln:14, Col:8" />
                <LineMapInfo line="208" column="6" position="Net:6, Ln:14, Col:15" />
                <LineMapInfo line="209" column="4" position="Net:6, Ln:1, Col:28 [Block input JogNegative]" />
                <LineMapInfo line="210" column="5" position="Net:6, Ln:1, Col:28" />
                <LineMapInfo line="211" column="4" position="Net:6, Ln:1, Col:28 [Block output Error]" />
                <LineMapInfo line="212" column="4" position="Net:6, Ln:3, Col:35" />
                <LineMapInfo line="213" column="4" position="Net:6, Ln:1, Col:28 [Block output StatusID]" />
                <LineMapInfo line="214" column="4" position="Net:6, Ln:4, Col:35" />
                <LineMapInfo line="215" column="4" position="Net:6, Ln:1, Col:28 [Block output Velocity]" />
                <LineMapInfo line="216" column="4" position="Net:6, Ln:7, Col:35" />
                <LineMapInfo line="217" column="4" position="Net:6, Ln:1, Col:28 [Block output PowerOn]" />
                <LineMapInfo line="218" column="4" position="Net:6, Ln:10, Col:35" />
                <LineMapInfo line="219" column="4" position="Net:6, Ln:1, Col:28 [Block output MoveActive]" />
                <LineMapInfo line="220" column="4" position="Net:6, Ln:14, Col:35" />
                <LineMapInfo line="221" column="4" position="Net:6, Ln:1, Col:28 [Block output Active]" />
                <LineMapInfo line="222" column="4" position="Net:6, Ln:2, Col:41" />
                <LineMapInfo line="224" column="1" position="Net:7" />
                <LineMapInfo line="225" column="1" position="Net:7" />
                <LineMapInfo line="226" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="227" column="6" position="Net:7, Ln:1, Col:5" />
                <LineMapInfo line="229" column="3" position="Net:7, Ln:1, Col:38" />
                <LineMapInfo line="230" column="4" position="Net:7, Ln:1, Col:5" />
                <LineMapInfo line="231" column="3" position="Net:7, Ln:2, Col:40" />
                <LineMapInfo line="232" column="4" position="Net:7, Ln:1, Col:5" />
                <LineMapInfo line="233" column="4" position="Net:7, Ln:3, Col:36 [Block input EN]" />
                <LineMapInfo line="235" column="10" position="Net:7, Ln:3, Col:36" />
                <LineMapInfo line="236" column="4" position="Net:7, Ln:4, Col:41" />
                <LineMapInfo line="239" column="1" position="Net:8" />
                <LineMapInfo line="240" column="1" position="Net:8" />
                <LineMapInfo line="241" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="243" column="4" position="Net:8, Ln:1, Col:35 [Block input EN]" />
                <LineMapInfo line="245" column="10" position="Net:8, Ln:1, Col:35" />
                <LineMapInfo line="246" column="4" position="Net:8, Ln:2, Col:42" />
                <LineMapInfo line="248" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="249" column="4" position="Net:8, Ln:3, Col:35 [Block input EN]" />
                <LineMapInfo line="251" column="10" position="Net:8, Ln:3, Col:35" />
                <LineMapInfo line="252" column="4" position="Net:8, Ln:4, Col:39" />
                <LineMapInfo line="255" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="ECBA7044" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="SetPars">
              <Documentation xsi:type="SimpleText"><![CDATA[Pass pars from interface to internal structure]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Enable" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gDistConveyorInterface.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1053" y="0" />
                <Size x="180" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1233" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="2" label="ReadIO">
              <Documentation xsi:type="SimpleText"><![CDATA[Set statuses based on IO]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="IOInput.CapAtDropOff" edge="none">
                <RelPosition x="213" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IOInput.CapAtExit" edge="none">
                <RelPosition x="213" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errCONV_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1053" y="76" />
                <Size x="150" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapAtDropOff" edge="none" latch="none">
                <RelPosition x="1143" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapAtExit" edge="none" latch="none">
                <RelPosition x="1173" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="152" />
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
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="UpdatePars">
              <Documentation xsi:type="SimpleText"><![CDATA[Update axis parameters on UpdatePar cmd]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="456" />
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
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.UpdatePar" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.JogAcceleration_mmss]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="304" />
                <Size x="240" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.JogAcceleration_mmss]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="380" />
                <Size x="240" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.MoveAcceleration_mmss]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="873" y="76" />
                <Size x="240" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.MoveAcceleration_mmss]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="873" y="152" />
                <Size x="240" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="10">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.JogSpeed_mms]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="933" y="228" />
                <Size x="180" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.SetSpeed_mms]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="0" />
                <Size x="180" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="13">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Jog.Acceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="360" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Jog.Deceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="436" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Acceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Deceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Jog.Velocity">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="284" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="DistConveyor.Parameters.Velocity">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1143" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="456" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="ErrorReset">
              <Documentation xsi:type="SimpleText"><![CDATA[Reset all errors on ErrorReset cmd]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
                <RelPosition x="213" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="AXIS_RESET_TIME">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="333" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="453" y="76" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="3" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="4" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="5">
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
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="reset">
                <RelPosition x="1113" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapInTransit" edge="none" latch="reset">
                <RelPosition x="1173" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="reset">
                <RelPosition x="1203" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="ErrorCatch">
              <Documentation xsi:type="SimpleText"><![CDATA[Catch and report cap falling off back and cap being lost in transit]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogBwd" edge="none">
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none">
                <RelPosition x="213" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapAtExit" edge="none">
                <RelPosition x="213" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapInTransit" edge="none">
                <RelPosition x="213" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IOInput.ModuleOK" negated="true" edge="none">
                <RelPosition x="213" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOK" negated="true" edge="none">
                <RelPosition x="213" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="CAP_TRANSIT_TIME">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="363" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapAtDropOff" edge="falling">
                <RelPosition x="423" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapAtDropOff" edge="falling">
                <RelPosition x="423" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="483" y="228" />
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
                      <Connection refConnectionPointOutId="9" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="12">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errCONV_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="993" y="456" />
                <Size x="210" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="8" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="13">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errCONV_CAP_OFF_BACK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1023" y="38" />
                <Size x="180" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="10" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="15">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errCONV_CAP_LOST]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1053" y="266" />
                <Size x="150" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="12" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="17">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="18">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.Power" edge="none" latch="reset">
                <RelPosition x="1113" y="398" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapInTransit" edge="none" latch="set">
                <RelPosition x="1173" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapInTransit" edge="none" latch="reset">
                <RelPosition x="1173" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.ModuleOK" edge="none" latch="reset">
                <RelPosition x="1173" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1203" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1203" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1203" y="436" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="25">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="532" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="24" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="AxisFUB">
              <Documentation xsi:type="SimpleText"><![CDATA[Pass cmds/statuses to/from MpAxisBasic FUB]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="760" />
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="3" y="218" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="256" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="3" y="294" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="332" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="3" y="370" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="408" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="446" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="3" y="484" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="3" y="522" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="560" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="598" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="636" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="674" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="712" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="750" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Enable" edge="none">
                <RelPosition x="3" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none">
                <RelPosition x="3" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.UpdatePar" edge="none">
                <RelPosition x="3" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Power" edge="none">
                <RelPosition x="3" y="284" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.MoveFwd" edge="none">
                <RelPosition x="3" y="360" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogFwd" edge="none">
                <RelPosition x="3" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogBwd" edge="none">
                <RelPosition x="3" y="512" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" negated="true" edge="none">
                <RelPosition x="213" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogBwd" negated="true" edge="none">
                <RelPosition x="213" y="360" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogBwd" negated="true" edge="none">
                <RelPosition x="213" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogFwd" negated="true" edge="none">
                <RelPosition x="213" y="512" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="AXIS_RESET_TIME">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="333" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.JogFwd" negated="true" edge="none">
                <RelPosition x="423" y="360" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapAtDropOff" negated="true" edge="none">
                <RelPosition x="423" y="512" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="453" y="266" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="15" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="19" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="22">
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
              <FbdObject xsi:type="DataSource" identifier="DistConveyor.Parameters">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="633" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="gDistributionAxis">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="663" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="DistConveyor.Basic">
                <RelPosition x="813" y="38" />
                <Size x="210" y="722" />
                <InputVariables>
                  <InputVariable parameterName="MpLink">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="24" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="8" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ErrorReset">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                      <Connection refConnectionPointOutId="9" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Parameters">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                      <Connection refConnectionPointOutId="23" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Update">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="180" />
                      <Connection refConnectionPointOutId="10" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Power">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="218" />
                      <Connection refConnectionPointOutId="22" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Home">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="256" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveVelocity">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="294" />
                      <Connection refConnectionPointOutId="20" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAbsolute">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="332" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAdditive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="370" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Stop">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="408" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogPositive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="446" />
                      <Connection refConnectionPointOutId="17" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogNegative">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="484" />
                      <Connection refConnectionPointOutId="21" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="LimitLoad">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="522" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ReleaseBrake">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="560" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Simulate">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="598" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="AutoTune">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="636" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Active">
                    <ConnectionPointOut connectionPointOutId="25">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Error">
                    <ConnectionPointOut connectionPointOutId="26">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="StatusID">
                    <ConnectionPointOut connectionPointOutId="27">
                      <RelPosition x="210" y="104" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="UpdateDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="142" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Position">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="180" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Velocity">
                    <ConnectionPointOut connectionPointOutId="28">
                      <RelPosition x="210" y="218" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandBusy">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="256" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandAborted">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="294" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="PowerOn">
                    <ConnectionPointOut connectionPointOutId="29">
                      <RelPosition x="210" y="332" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="IsHomed">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="370" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InVelocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="408" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InPosition">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="446" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveActive">
                    <ConnectionPointOut connectionPointOutId="30">
                      <RelPosition x="210" y="484" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="522" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Stopped">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="560" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="LimitLoadReady">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="598" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="BrakeReleased">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="636" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="AutoTuneDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="674" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Info">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="712" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.AxisError">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="26" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.AxisStatusID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="27" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.Velocity_mms">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="246" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="28" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.PowerOn">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="29" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.Moving">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="30" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Active" edge="none" latch="none">
                <RelPosition x="1203" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="31">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="760" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="31" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="560" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="598" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="636" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="674" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="712" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="750" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="ModuleOKRecover">
              <Documentation xsi:type="SimpleText"><![CDATA[Recover from a Module Not OK error]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="IOInput.ModuleOK" edge="none">
                <RelPosition x="3" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOK" negated="true" edge="none">
                <RelPosition x="123" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errCONV_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1053" y="76" />
                <Size x="150" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="3" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gDistConveyorInterface.Cmd.ErrorReset" edge="none" latch="set">
                <RelPosition x="1113" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.ModuleOK" edge="none" latch="set">
                <RelPosition x="1173" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="152" />
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
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[Store old cmds and pass statuses between interface and internal structures]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gDistConveyorInterface.Cmd.Enable" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gDistConveyorInterface.Cmd]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1023" y="0" />
                <Size x="210" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1023" y="76" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="ENO">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gDistConveyorInterface.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1143" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Cmd">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1233" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
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