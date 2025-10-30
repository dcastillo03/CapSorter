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
 * Author:     Daniel Castillo-Idrobo  
 * Created:    October 24, 2025/10:43 AM 
 * Description: This task handles the arm control which physically sorts each cap.
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
	zz$$$$_0_Internal_Status_ModuleO : BOOL;
	zz$$$$_1_Internal_Cmd_Enable_And : BOOL;
	zz$$$$_2_Internal_Status_ModuleO : BOOL;
	zz$$$$_3_Eno_ComputeBlock : BOOL;
	zz$$$$_4_Internal_Status_ModuleO : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_Internal_Par_ProductAva : BOOL;
	zz$$$$_7_Eno_CompareBlock : BOOL;
	zz$$$$_8_Eno_CompareBlock : BOOL;
	zz$$$$_9_Eno_CompareBlock : BOOL;
	zz$$$$_10_Internal_Status_Active : BOOL;
	zz$$$$_11_f_trig_IO_Inputs_diLan : f_trig;
	zz$$$$_12_Eno_ComputeBlock : BOOL;
	zz$$$$_13_f_trig_IO_Inputs_diLan : f_trig;
	zz$$$$_14_Eno_ComputeBlock : BOOL;
	zz$$$$_15_f_trig_IO_Inputs_diLan : f_trig;
	zz$$$$_16_Eno_ComputeBlock : BOOL;
	zz$$$$_17_Internal_Cmd_Clear_And : BOOL;
	zz$$$$_18_Eno_ComputeBlock : BOOL;
	zz$$$$_19_Eno_ComputeBlock : BOOL;
	zz$$$$_20_Eno_ComputeBlock : BOOL;
	zz$$$$_21_Internal_Status_Active : BOOL;
	zz$$$$_22_Internal_Status_CapIde : BOOL;
	zz$$$$_23_Internal_Cmd_MoveSwitc : BOOL;
	zz$$$$_24_IO_Outputs_doSwitchOne : BOOL;
	zz$$$$_25_Eno_ComputeBlock : BOOL;
	zz$$$$_26_Internal_Cmd_MoveSwitc : BOOL;
	zz$$$$_27_IO_Outputs_doSwitchOne : BOOL;
	zz$$$$_28_Eno_ComputeBlock : BOOL;
	zz$$$$_29_Internal_Status_Stoppe : BOOL;
	zz$$$$_30_Internal_Status_Active : BOOL;
	zz$$$$_31_Internal_Cmd_DoRetract : BOOL;
	zz$$$$_32_Internal_Status_CapIsS : BOOL;
	zz$$$$_33_Eno_ComputeBlock : BOOL;
	zz$$$$_34_f_trig_IO_Inputs_diLan : f_trig;
	zz$$$$_35_IO_Inputs_diLaneSensor : BOOL;
	zz$$$$_36_Internal_Status_Active : BOOL;
	zz$$$$_37_gCapArmCtrl_Cmd_Enable : BOOL;
	zz$$$$_38_Eno_ComputeBlock : BOOL;
	zz$$$$_39_Eno_ComputeBlock : BOOL;
	zz$$$$_40_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
sorterSTANDBY:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_0_Internal_Status_ModuleO
ST	Internal.Status.Active {CheckDataType := BOOL}
JMPC	sorterCAP_DETECT

{NetworkNumber := 2}
ModuleOkCheck:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_1_Internal_Cmd_Enable_And
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_2_Internal_Status_ModuleO
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_2_Internal_Status_ModuleO
ST	zz$$$$_3_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	cacERROR_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_0:
LD	zz$$$$_1_Internal_Cmd_Enable_And
ANDN	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_4_Internal_Status_ModuleO
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_4_Internal_Status_ModuleO
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	cacERROR_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_1:

{NetworkNumber := 3}
sorterCAP_DETECT:
LD	Internal.Cmd.Start {CheckDataType := BOOL}
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_6_Internal_Par_ProductAva
ST	zz$$$$_7_Eno_CompareBlock
JMPCN ll$$$$_IF_2
Compare!	Internal.Par.CapColor = ccCAP_METAL
ST	CapColor.Metal
ll$$$$_IF_2:
LD	zz$$$$_6_Internal_Par_ProductAva
AND	CapColor.Metal {CheckDataType := BOOL}
OR	zz$$$$_7_Eno_CompareBlock
ST	Internal.Status.CapIdentified {CheckDataType := BOOL}
LD	zz$$$$_6_Internal_Par_ProductAva
ST	zz$$$$_8_Eno_CompareBlock
JMPCN ll$$$$_IF_3
Compare!	Internal.Par.CapColor = ccCAP_RED
ST	CapColor.Red
ll$$$$_IF_3:
LD	zz$$$$_6_Internal_Par_ProductAva
AND	CapColor.Red {CheckDataType := BOOL}
OR	zz$$$$_8_Eno_CompareBlock
ST	Internal.Status.CapIdentified {CheckDataType := BOOL}
LD	zz$$$$_6_Internal_Par_ProductAva
ST	zz$$$$_9_Eno_CompareBlock
JMPCN ll$$$$_IF_4
Compare!	Internal.Par.CapColor = ccCAP_BLACK
ST	CapColor.Black
ll$$$$_IF_4:
LD	zz$$$$_6_Internal_Par_ProductAva
AND	CapColor.Black {CheckDataType := BOOL}
OR	zz$$$$_9_Eno_CompareBlock
ST	Internal.Status.CapIdentified {CheckDataType := BOOL}

{NetworkNumber := 4}
CapCounter:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_10_Internal_Status_Active
LD	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	zz$$$$_11_f_trig_IO_Inputs_diLan.CLK
CAL	zz$$$$_11_f_trig_IO_Inputs_diLan
LD	zz$$$$_10_Internal_Status_Active
AND	CapColor.Black {CheckDataType := BOOL}
AND	zz$$$$_11_f_trig_IO_Inputs_diLan.Q
ST	zz$$$$_12_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	Internal.Status.BlackCapCount + 1
ST	Internal.Status.BlackCapCount
ll$$$$_IF_5:
LD	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	zz$$$$_13_f_trig_IO_Inputs_diLan.CLK
CAL	zz$$$$_13_f_trig_IO_Inputs_diLan
LD	zz$$$$_10_Internal_Status_Active
AND	CapColor.Red {CheckDataType := BOOL}
AND	zz$$$$_13_f_trig_IO_Inputs_diLan.Q
ST	zz$$$$_14_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Status.RedCapCount + 1
ST	Internal.Status.RedCapCount
ll$$$$_IF_6:
LD	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	zz$$$$_15_f_trig_IO_Inputs_diLan.CLK
CAL	zz$$$$_15_f_trig_IO_Inputs_diLan
LD	zz$$$$_10_Internal_Status_Active
AND	CapColor.Metal {CheckDataType := BOOL}
AND	zz$$$$_15_f_trig_IO_Inputs_diLan.Q
ST	zz$$$$_16_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	Internal.Status.MetalCapCount + 1
ST	Internal.Status.MetalCapCount
ll$$$$_IF_7:
LD	zz$$$$_10_Internal_Status_Active
AND	Internal.Cmd.Clear {CheckDataType := BOOL}
ST	zz$$$$_17_Internal_Cmd_Clear_And
ST	zz$$$$_18_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	0
ST	Internal.Status.BlackCapCount
ll$$$$_IF_8:
LD	zz$$$$_17_Internal_Cmd_Clear_And
ST	zz$$$$_19_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	0
ST	Internal.Status.MetalCapCount
ll$$$$_IF_9:
LD	zz$$$$_17_Internal_Cmd_Clear_And
ST	zz$$$$_20_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	0
ST	Internal.Status.RedCapCount
ll$$$$_IF_10:

{NetworkNumber := 5}
sorterCAP_ARM_CTRL:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_21_Internal_Status_Active
AND	Internal.Status.CapIdentified {CheckDataType := BOOL}
ST	zz$$$$_22_Internal_Status_CapIde
AND	CapColor.Metal {CheckDataType := BOOL}
JMPC	RetractStopperState
LD	zz$$$$_22_Internal_Status_CapIde
AND	CapColor.Red {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	zz$$$$_23_Internal_Cmd_MoveSwitc
S	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_23_Internal_Cmd_MoveSwitc
ST	Timer.DetectTime.IN
LD	Timer.TIME_DELAY
ST	Timer.DetectTime.PT
CAL	Timer.DetectTime
LD	Timer.DetectTime.Q
ANDN	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
ST	zz$$$$_24_IO_Outputs_doSwitchOne
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_24_IO_Outputs_doSwitchOne
ST	zz$$$$_25_Eno_ComputeBlock
JMPCN ll$$$$_IF_11
Compute!	cacERROR_ARM_TIMEOUT
ST	Internal.Status.ErrorID
ll$$$$_IF_11:
LD	zz$$$$_23_Internal_Cmd_MoveSwitc
JMPC	RetractStopperState
LD	zz$$$$_22_Internal_Status_CapIde
AND	CapColor.Black {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	zz$$$$_26_Internal_Cmd_MoveSwitc
S	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_26_Internal_Cmd_MoveSwitc
ST	Timer.DetectTime.IN
LD	Timer.TIME_DELAY
ST	Timer.DetectTime.PT
CAL	Timer.DetectTime
LD	Timer.DetectTime.Q
ANDN	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
ST	zz$$$$_27_IO_Outputs_doSwitchOne
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_27_IO_Outputs_doSwitchOne
ST	zz$$$$_28_Eno_ComputeBlock
JMPCN ll$$$$_IF_12
Compute!	cacERROR_ARM_TIMEOUT
ST	Internal.Status.ErrorID
ll$$$$_IF_12:
LD	zz$$$$_26_Internal_Cmd_MoveSwitc
JMPC	RetractStopperState
LD	zz$$$$_21_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
AND	Internal.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
S	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_21_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
R	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_21_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
AND	Internal.Cmd.MoveBackSwitch {CheckDataType := BOOL}
S	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_21_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveBackSwitch {CheckDataType := BOOL}
R	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}

{NetworkNumber := 6}
ManualRetractor:
LD	Internal.Status.Active {CheckDataType := BOOL}
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ST	zz$$$$_29_Internal_Status_Stoppe
AND	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
S	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_29_Internal_Status_Stoppe
ANDN	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
R	IO.Outputs.doRetractStopper {CheckDataType := BOOL}

{NetworkNumber := 7}
ErrorReset:
LD	Internal.Cmd.ErrorReset {CheckDataType := BOOL}
R	Internal.Status.Error {CheckDataType := BOOL}

{NetworkNumber := 8}
RetractStopperState:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_30_Internal_Status_Active
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ANDN	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
AND	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
ST	zz$$$$_31_Internal_Cmd_DoRetract
S	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_31_Internal_Cmd_DoRetract
ST	Timer.DetectTime.IN
LD	Timer.TIME_DELAY
ST	Timer.DetectTime.PT
CAL	Timer.DetectTime
LD	Timer.DetectTime.Q
ANDN	Internal.Status.CapIsSorted {CheckDataType := BOOL}
ST	zz$$$$_32_Internal_Status_CapIsS
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_32_Internal_Status_CapIsS
ST	zz$$$$_33_Eno_ComputeBlock
JMPCN ll$$$$_IF_13
Compute!	cacERROR_CAP_TIMEOUT
ST	Internal.Status.ErrorID
ll$$$$_IF_13:
LD	zz$$$$_31_Internal_Cmd_DoRetract
R	Internal.Status.CapIsSorted {CheckDataType := BOOL}
LD	zz$$$$_30_Internal_Status_Active
AND	IO.Inputs.SwitchOneExtended {CheckDataType := BOOL}
ST	Internal.Status.SwitchOneExtended {CheckDataType := BOOL}
LD	zz$$$$_30_Internal_Status_Active
AND	IO.Inputs.SwitchTwoExtended {CheckDataType := BOOL}
ST	Internal.Status.SwitchTwoExtended {CheckDataType := BOOL}
LD	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	zz$$$$_34_f_trig_IO_Inputs_diLan.CLK
CAL	zz$$$$_34_f_trig_IO_Inputs_diLan
LD	zz$$$$_30_Internal_Status_Active
ANDN	Internal.Par.ProductAvailable {CheckDataType := BOOL}
AND	zz$$$$_34_f_trig_IO_Inputs_diLan.Q
ST	zz$$$$_35_IO_Inputs_diLaneSensor
R	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_35_IO_Inputs_diLaneSensor
R	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_35_IO_Inputs_diLaneSensor
R	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_35_IO_Inputs_diLaneSensor
S	Internal.Status.CapIsSorted {CheckDataType := BOOL}
LD	zz$$$$_30_Internal_Status_Active
AND	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	Internal.Status.LaneIsFull {CheckDataType := BOOL}

{NetworkNumber := 9}
StopStatusAssignment:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_36_Internal_Status_Active
AND	Internal.Cmd.Stop {CheckDataType := BOOL}
S	Internal.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_36_Internal_Status_Active
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
R	Internal.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 10}
Assignments:
LD	gCapArmCtrl.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_37_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_38_Eno_ComputeBlock
JMPCN ll$$$$_IF_14
Compute!	gCapArmCtrl.Cmd
ST	Internal.Cmd
ll$$$$_IF_14:
LD	zz$$$$_37_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_39_Eno_ComputeBlock
JMPCN ll$$$$_IF_15
Compute!	gCapArmCtrl.Par
ST	Internal.Par
ll$$$$_IF_15:
LD	zz$$$$_37_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_40_Eno_ComputeBlock
JMPCN ll$$$$_IF_16
Compute!	Internal.Status
ST	gCapArmCtrl.Status
ll$$$$_IF_16:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="48" column="1" position="Net:1" />
                <LineMapInfo line="49" column="1" position="Net:1" />
                <LineMapInfo line="50" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="51" column="5" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="53" column="4" position="Net:1, Ln:1, Col:47" />
                <LineMapInfo line="54" column="6" position="Net:1, Ln:2, Col:47" />
                <LineMapInfo line="56" column="1" position="Net:2" />
                <LineMapInfo line="57" column="1" position="Net:2" />
                <LineMapInfo line="58" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="60" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="62" column="3" position="Net:2, Ln:1, Col:47" />
                <LineMapInfo line="63" column="4" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="64" column="4" position="Net:2, Ln:2, Col:42 [Block input EN]" />
                <LineMapInfo line="66" column="10" position="Net:2, Ln:2, Col:42" />
                <LineMapInfo line="67" column="4" position="Net:2, Ln:3, Col:47" />
                <LineMapInfo line="69" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="70" column="6" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="72" column="3" position="Net:2, Ln:4, Col:47" />
                <LineMapInfo line="73" column="4" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="74" column="4" position="Net:2, Ln:5, Col:40 [Block input EN]" />
                <LineMapInfo line="76" column="10" position="Net:2, Ln:5, Col:40" />
                <LineMapInfo line="77" column="4" position="Net:2, Ln:6, Col:47" />
                <LineMapInfo line="80" column="1" position="Net:3" />
                <LineMapInfo line="81" column="1" position="Net:3" />
                <LineMapInfo line="82" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="83" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="85" column="4" position="Net:3, Ln:2, Col:11 [Block input EN]" />
                <LineMapInfo line="87" column="10" position="Net:3, Ln:2, Col:11" />
                <LineMapInfo line="88" column="4" position="Net:3, Ln:3, Col:19" />
                <LineMapInfo line="90" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="91" column="5" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="92" column="4" position="Net:3, Ln:2, Col:11 [Block output ENO]" />
                <LineMapInfo line="93" column="4" position="Net:3, Ln:1, Col:46" />
                <LineMapInfo line="94" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="95" column="4" position="Net:3, Ln:5, Col:11 [Block input EN]" />
                <LineMapInfo line="97" column="10" position="Net:3, Ln:5, Col:11" />
                <LineMapInfo line="98" column="4" position="Net:3, Ln:6, Col:19" />
                <LineMapInfo line="100" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="101" column="5" position="Net:3, Ln:4, Col:11" />
                <LineMapInfo line="102" column="4" position="Net:3, Ln:5, Col:11 [Block output ENO]" />
                <LineMapInfo line="103" column="4" position="Net:3, Ln:4, Col:46" />
                <LineMapInfo line="104" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="105" column="4" position="Net:3, Ln:8, Col:11 [Block input EN]" />
                <LineMapInfo line="107" column="10" position="Net:3, Ln:8, Col:11" />
                <LineMapInfo line="108" column="4" position="Net:3, Ln:9, Col:19" />
                <LineMapInfo line="110" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="111" column="5" position="Net:3, Ln:7, Col:11" />
                <LineMapInfo line="112" column="4" position="Net:3, Ln:8, Col:11 [Block output ENO]" />
                <LineMapInfo line="113" column="4" position="Net:3, Ln:7, Col:46" />
                <LineMapInfo line="115" column="1" position="Net:4" />
                <LineMapInfo line="116" column="1" position="Net:4" />
                <LineMapInfo line="117" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="119" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="120" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="121" column="5" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="123" column="5" position="Net:4, Ln:1, Col:5" />
                <LineMapInfo line="124" column="5" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="125" column="4" position="Net:4, Ln:1, Col:38 [Block input EN]" />
                <LineMapInfo line="127" column="10" position="Net:4, Ln:1, Col:38" />
                <LineMapInfo line="128" column="4" position="Net:4, Ln:2, Col:45" />
                <LineMapInfo line="130" column="4" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="131" column="4" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="132" column="5" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="133" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="134" column="5" position="Net:4, Ln:3, Col:5" />
                <LineMapInfo line="135" column="5" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="136" column="4" position="Net:4, Ln:3, Col:38 [Block input EN]" />
                <LineMapInfo line="138" column="10" position="Net:4, Ln:3, Col:38" />
                <LineMapInfo line="139" column="4" position="Net:4, Ln:4, Col:45" />
                <LineMapInfo line="141" column="4" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="142" column="4" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="143" column="5" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="144" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="145" column="5" position="Net:4, Ln:5, Col:5" />
                <LineMapInfo line="146" column="5" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="147" column="4" position="Net:4, Ln:5, Col:38 [Block input EN]" />
                <LineMapInfo line="149" column="10" position="Net:4, Ln:5, Col:38" />
                <LineMapInfo line="150" column="4" position="Net:4, Ln:6, Col:45" />
                <LineMapInfo line="152" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="153" column="5" position="Net:4, Ln:7, Col:5" />
                <LineMapInfo line="155" column="4" position="Net:4, Ln:7, Col:41 [Block input EN]" />
                <LineMapInfo line="157" column="10" position="Net:4, Ln:7, Col:41" />
                <LineMapInfo line="158" column="4" position="Net:4, Ln:8, Col:45" />
                <LineMapInfo line="160" column="4" position="Net:4, Ln:7, Col:5" />
                <LineMapInfo line="161" column="4" position="Net:4, Ln:9, Col:41 [Block input EN]" />
                <LineMapInfo line="163" column="10" position="Net:4, Ln:9, Col:41" />
                <LineMapInfo line="164" column="4" position="Net:4, Ln:10, Col:45" />
                <LineMapInfo line="166" column="4" position="Net:4, Ln:7, Col:5" />
                <LineMapInfo line="167" column="4" position="Net:4, Ln:11, Col:41 [Block input EN]" />
                <LineMapInfo line="169" column="10" position="Net:4, Ln:11, Col:41" />
                <LineMapInfo line="170" column="4" position="Net:4, Ln:12, Col:45" />
                <LineMapInfo line="173" column="1" position="Net:5" />
                <LineMapInfo line="174" column="1" position="Net:5" />
                <LineMapInfo line="175" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="177" column="5" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="179" column="5" position="Net:5, Ln:1, Col:10" />
                <LineMapInfo line="180" column="6" position="Net:5, Ln:1, Col:47" />
                <LineMapInfo line="181" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="182" column="5" position="Net:5, Ln:2, Col:10" />
                <LineMapInfo line="183" column="5" position="Net:5, Ln:2, Col:13" />
                <LineMapInfo line="185" column="3" position="Net:5, Ln:2, Col:46" />
                <LineMapInfo line="186" column="4" position="Net:5, Ln:2, Col:13" />
                <LineMapInfo line="187" column="4" position="Net:5, Ln:3, Col:22 [Block input IN]" />
                <LineMapInfo line="188" column="4" position="Net:5, Ln:5, Col:18" />
                <LineMapInfo line="189" column="4" position="Net:5, Ln:3, Col:22 [Block input PT]" />
                <LineMapInfo line="190" column="5" position="Net:5, Ln:3, Col:22" />
                <LineMapInfo line="191" column="4" position="Net:5, Ln:3, Col:22 [Block output Q]" />
                <LineMapInfo line="192" column="6" position="Net:5, Ln:4, Col:26" />
                <LineMapInfo line="194" column="3" position="Net:5, Ln:4, Col:47" />
                <LineMapInfo line="195" column="4" position="Net:5, Ln:4, Col:26" />
                <LineMapInfo line="196" column="4" position="Net:5, Ln:5, Col:40 [Block input EN]" />
                <LineMapInfo line="198" column="10" position="Net:5, Ln:5, Col:40" />
                <LineMapInfo line="199" column="4" position="Net:5, Ln:6, Col:47" />
                <LineMapInfo line="201" column="4" position="Net:5, Ln:2, Col:13" />
                <LineMapInfo line="202" column="6" position="Net:5, Ln:6, Col:47" />
                <LineMapInfo line="203" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="204" column="5" position="Net:5, Ln:7, Col:10" />
                <LineMapInfo line="205" column="5" position="Net:5, Ln:7, Col:13" />
                <LineMapInfo line="207" column="3" position="Net:5, Ln:7, Col:46" />
                <LineMapInfo line="208" column="4" position="Net:5, Ln:7, Col:13" />
                <LineMapInfo line="209" column="4" position="Net:5, Ln:8, Col:22 [Block input IN]" />
                <LineMapInfo line="210" column="4" position="Net:5, Ln:10, Col:18" />
                <LineMapInfo line="211" column="4" position="Net:5, Ln:8, Col:22 [Block input PT]" />
                <LineMapInfo line="212" column="5" position="Net:5, Ln:8, Col:22" />
                <LineMapInfo line="213" column="4" position="Net:5, Ln:8, Col:22 [Block output Q]" />
                <LineMapInfo line="214" column="6" position="Net:5, Ln:9, Col:26" />
                <LineMapInfo line="216" column="3" position="Net:5, Ln:9, Col:47" />
                <LineMapInfo line="217" column="4" position="Net:5, Ln:9, Col:26" />
                <LineMapInfo line="218" column="4" position="Net:5, Ln:10, Col:40 [Block input EN]" />
                <LineMapInfo line="220" column="10" position="Net:5, Ln:10, Col:40" />
                <LineMapInfo line="221" column="4" position="Net:5, Ln:11, Col:47" />
                <LineMapInfo line="223" column="4" position="Net:5, Ln:7, Col:13" />
                <LineMapInfo line="224" column="6" position="Net:5, Ln:11, Col:47" />
                <LineMapInfo line="225" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="226" column="5" position="Net:5, Ln:12, Col:5" />
                <LineMapInfo line="227" column="5" position="Net:5, Ln:12, Col:10" />
                <LineMapInfo line="228" column="3" position="Net:5, Ln:12, Col:46" />
                <LineMapInfo line="229" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="230" column="5" position="Net:5, Ln:13, Col:5" />
                <LineMapInfo line="231" column="6" position="Net:5, Ln:13, Col:10" />
                <LineMapInfo line="232" column="3" position="Net:5, Ln:13, Col:46" />
                <LineMapInfo line="233" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="234" column="5" position="Net:5, Ln:14, Col:5" />
                <LineMapInfo line="235" column="5" position="Net:5, Ln:14, Col:10" />
                <LineMapInfo line="236" column="3" position="Net:5, Ln:14, Col:46" />
                <LineMapInfo line="237" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="238" column="5" position="Net:5, Ln:15, Col:5" />
                <LineMapInfo line="239" column="6" position="Net:5, Ln:15, Col:10" />
                <LineMapInfo line="240" column="3" position="Net:5, Ln:15, Col:46" />
                <LineMapInfo line="242" column="1" position="Net:6" />
                <LineMapInfo line="243" column="1" position="Net:6" />
                <LineMapInfo line="244" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="245" column="5" position="Net:6, Ln:1, Col:5" />
                <LineMapInfo line="247" column="5" position="Net:6, Ln:1, Col:10" />
                <LineMapInfo line="248" column="3" position="Net:6, Ln:1, Col:45" />
                <LineMapInfo line="249" column="4" position="Net:6, Ln:1, Col:5" />
                <LineMapInfo line="250" column="6" position="Net:6, Ln:2, Col:10" />
                <LineMapInfo line="251" column="3" position="Net:6, Ln:2, Col:45" />
                <LineMapInfo line="253" column="1" position="Net:7" />
                <LineMapInfo line="254" column="1" position="Net:7" />
                <LineMapInfo line="255" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="256" column="3" position="Net:7, Ln:1, Col:47" />
                <LineMapInfo line="258" column="1" position="Net:8" />
                <LineMapInfo line="259" column="1" position="Net:8" />
                <LineMapInfo line="260" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="262" column="5" position="Net:8, Ln:1, Col:5" />
                <LineMapInfo line="263" column="5" position="Net:8, Ln:1, Col:11" />
                <LineMapInfo line="264" column="6" position="Net:8, Ln:1, Col:16" />
                <LineMapInfo line="265" column="5" position="Net:8, Ln:1, Col:21" />
                <LineMapInfo line="267" column="3" position="Net:8, Ln:1, Col:45" />
                <LineMapInfo line="268" column="4" position="Net:8, Ln:1, Col:21" />
                <LineMapInfo line="269" column="4" position="Net:8, Ln:2, Col:31 [Block input IN]" />
                <LineMapInfo line="270" column="4" position="Net:8, Ln:4, Col:27" />
                <LineMapInfo line="271" column="4" position="Net:8, Ln:2, Col:31 [Block input PT]" />
                <LineMapInfo line="272" column="5" position="Net:8, Ln:2, Col:31" />
                <LineMapInfo line="273" column="4" position="Net:8, Ln:2, Col:31 [Block output Q]" />
                <LineMapInfo line="274" column="6" position="Net:8, Ln:3, Col:35" />
                <LineMapInfo line="276" column="3" position="Net:8, Ln:3, Col:47" />
                <LineMapInfo line="277" column="4" position="Net:8, Ln:3, Col:35" />
                <LineMapInfo line="278" column="4" position="Net:8, Ln:4, Col:40 [Block input EN]" />
                <LineMapInfo line="280" column="10" position="Net:8, Ln:4, Col:40" />
                <LineMapInfo line="281" column="4" position="Net:8, Ln:5, Col:47" />
                <LineMapInfo line="283" column="4" position="Net:8, Ln:1, Col:21" />
                <LineMapInfo line="284" column="3" position="Net:8, Ln:5, Col:46" />
                <LineMapInfo line="285" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="286" column="5" position="Net:8, Ln:6, Col:5" />
                <LineMapInfo line="287" column="4" position="Net:8, Ln:6, Col:44" />
                <LineMapInfo line="288" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="289" column="5" position="Net:8, Ln:7, Col:5" />
                <LineMapInfo line="290" column="4" position="Net:8, Ln:7, Col:44" />
                <LineMapInfo line="291" column="4" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="292" column="4" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="293" column="5" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="294" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="295" column="6" position="Net:8, Ln:8, Col:5" />
                <LineMapInfo line="296" column="5" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="298" column="3" position="Net:8, Ln:8, Col:45" />
                <LineMapInfo line="299" column="4" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="300" column="3" position="Net:8, Ln:9, Col:46" />
                <LineMapInfo line="301" column="4" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="302" column="3" position="Net:8, Ln:10, Col:46" />
                <LineMapInfo line="303" column="4" position="Net:8, Ln:8, Col:11" />
                <LineMapInfo line="304" column="3" position="Net:8, Ln:11, Col:46" />
                <LineMapInfo line="305" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="306" column="5" position="Net:8, Ln:12, Col:5" />
                <LineMapInfo line="307" column="4" position="Net:8, Ln:12, Col:46" />
                <LineMapInfo line="309" column="1" position="Net:9" />
                <LineMapInfo line="310" column="1" position="Net:9" />
                <LineMapInfo line="311" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="313" column="5" position="Net:9, Ln:1, Col:5" />
                <LineMapInfo line="314" column="3" position="Net:9, Ln:1, Col:46" />
                <LineMapInfo line="315" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="316" column="6" position="Net:9, Ln:2, Col:5" />
                <LineMapInfo line="317" column="3" position="Net:9, Ln:2, Col:46" />
                <LineMapInfo line="319" column="1" position="Net:10" />
                <LineMapInfo line="320" column="1" position="Net:10" />
                <LineMapInfo line="321" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="323" column="4" position="Net:10, Ln:1, Col:43 [Block input EN]" />
                <LineMapInfo line="325" column="10" position="Net:10, Ln:1, Col:43" />
                <LineMapInfo line="326" column="4" position="Net:10, Ln:2, Col:48" />
                <LineMapInfo line="328" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="329" column="4" position="Net:10, Ln:3, Col:43 [Block input EN]" />
                <LineMapInfo line="331" column="10" position="Net:10, Ln:3, Col:43" />
                <LineMapInfo line="332" column="4" position="Net:10, Ln:4, Col:48" />
                <LineMapInfo line="334" column="4" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="335" column="4" position="Net:10, Ln:5, Col:43 [Block input EN]" />
                <LineMapInfo line="337" column="10" position="Net:10, Ln:5, Col:43" />
                <LineMapInfo line="338" column="4" position="Net:10, Ln:6, Col:47" />
                <LineMapInfo line="341" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="D301C19B" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="sorterSTANDBY">
              <Documentation xsi:type="SimpleText"><![CDATA[For enabling task]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Active" edge="none" latch="none">
                <RelPosition x="1383" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="sorterCAP_DETECT">
                <RelPosition x="1383" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="2" label="ModuleOkCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Checks, sets, and resets, ModuleOK for DO IO slice]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" negated="true" edge="none">
                <RelPosition x="123" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cacERROR_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1173" y="152" />
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
                      <Connection refConnectionPointOutId="4" />
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
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cacERROR_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1233" y="38" />
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
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="reset">
                <RelPosition x="1383" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1383" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="sorterCAP_DETECT">
              <Documentation xsi:type="SimpleText"><![CDATA[Command proper arm to be switched on]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" edge="none">
                <RelPosition x="123" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Metal" edge="none">
                <RelPosition x="303" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compare">
                <AddData>
                  <Data name="BR_CompareBlock" handleUnknown="implementation">
                    <CompareBlock><![CDATA[Internal.Par.CapColor = ccCAP_METAL]]></CompareBlock>
                  </Data>
                </AddData>
                <RelPosition x="303" y="38" />
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
              <LdObject xsi:type="Contact" operand="CapColor.Red" edge="none">
                <RelPosition x="303" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compare">
                <AddData>
                  <Data name="BR_CompareBlock" handleUnknown="implementation">
                    <CompareBlock><![CDATA[Internal.Par.CapColor = ccCAP_RED]]></CompareBlock>
                  </Data>
                </AddData>
                <RelPosition x="303" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Black" edge="none">
                <RelPosition x="303" y="246" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compare">
                <AddData>
                  <Data name="BR_CompareBlock" handleUnknown="implementation">
                    <CompareBlock><![CDATA[Internal.Par.CapColor = ccCAP_BLACK]]></CompareBlock>
                  </Data>
                </AddData>
                <RelPosition x="303" y="266" />
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
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="CapColor.Metal">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="543" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="CapColor.Red">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="543" y="208" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="CapColor.Black">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="543" y="322" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIdentified" edge="none" latch="none">
                <RelPosition x="1353" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIdentified" edge="none" latch="none">
                <RelPosition x="1353" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIdentified" edge="none" latch="none">
                <RelPosition x="1353" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="342" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="CapCounter">
              <Documentation xsi:type="SimpleText"><![CDATA[This network counts the caps]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="CapColor.Black" edge="none">
                <RelPosition x="123" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Red" edge="none">
                <RelPosition x="123" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Metal" edge="none">
                <RelPosition x="123" y="170" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Clear" edge="none">
                <RelPosition x="123" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="falling">
                <RelPosition x="213" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="falling">
                <RelPosition x="213" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="falling">
                <RelPosition x="213" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.BlackCapCount + 1]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1113" y="0" />
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
                      <Connection refConnectionPointOutId="7" />
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
                    <ConnectionPointOut connectionPointOutId="10">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.RedCapCount + 1]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1113" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="13">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.MetalCapCount + 1]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1113" y="152" />
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
                      <Connection refConnectionPointOutId="9" />
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
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="15">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[0]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1203" y="228" />
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
                      <Connection refConnectionPointOutId="6" />
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
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="17">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[0]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1203" y="304" />
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
                      <Connection refConnectionPointOutId="6" />
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
                    <ConnectionPointOut connectionPointOutId="18">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="19">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[0]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1203" y="380" />
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
                      <Connection refConnectionPointOutId="6" />
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
                    <ConnectionPointOut connectionPointOutId="20">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="21">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.BlackCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.RedCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.MetalCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.BlackCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="284" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.MetalCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.RedCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1323" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="456" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="sorterCAP_ARM_CTRL">
              <Documentation xsi:type="SimpleText"><![CDATA[Moves the appropriate switch depending on the cap color]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="570" />
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
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="560" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.CapIdentified" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="474" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="550" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Metal" edge="none">
                <RelPosition x="273" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Red" edge="none">
                <RelPosition x="273" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="CapColor.Black" edge="none">
                <RelPosition x="273" y="246" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFrontSwitch" edge="none">
                <RelPosition x="273" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFrontSwitch" negated="true" edge="none">
                <RelPosition x="273" y="474" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveBackSwitch" edge="none">
                <RelPosition x="273" y="512" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveBackSwitch" negated="true" edge="none">
                <RelPosition x="273" y="550" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveSwitch" edge="none">
                <RelPosition x="363" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveSwitch" edge="none">
                <RelPosition x="363" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="Timer.TIME_DELAY">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="513" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="Timer.TIME_DELAY">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="513" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="Timer.DetectTime">
                <RelPosition x="633" y="114" />
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
                      <Connection refConnectionPointOutId="17" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="19">
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
              <FbdObject xsi:type="Block" typeName="TON" instanceName="Timer.DetectTime">
                <RelPosition x="633" y="304" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="16" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="18" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="20">
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
              <LdObject xsi:type="Contact" operand="IO.Outputs.doSwitchOne" negated="true" edge="none">
                <RelPosition x="753" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Outputs.doSwitchOne" negated="true" edge="none">
                <RelPosition x="753" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cacERROR_ARM_TIMEOUT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1173" y="152" />
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
                      <Connection refConnectionPointOutId="21" />
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
                    <ConnectionPointOut connectionPointOutId="23">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="24">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cacERROR_ARM_TIMEOUT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1173" y="342" />
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
                      <Connection refConnectionPointOutId="22" />
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
                    <ConnectionPointOut connectionPointOutId="25">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="26">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="set">
                <RelPosition x="1353" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="27">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="set">
                <RelPosition x="1353" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="28">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="set">
                <RelPosition x="1353" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="29">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="reset">
                <RelPosition x="1353" y="474" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="30">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="set">
                <RelPosition x="1353" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="31">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="reset">
                <RelPosition x="1353" y="550" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="32">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="1383" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1383" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="33">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="24" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="1383" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1383" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="34">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="1383" y="398" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="398" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="26" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="570" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="27" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="33" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="34" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="29" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="30" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                  <Connection refConnectionPointOutId="31" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="560" />
                  <Connection refConnectionPointOutId="32" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="ManualRetractor">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles manual stopper retraction.]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.DoRetractStopper" edge="none">
                <RelPosition x="273" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.DoRetractStopper" negated="true" edge="none">
                <RelPosition x="273" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="set">
                <RelPosition x="1323" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="reset">
                <RelPosition x="1323" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="ErrorReset">
              <Documentation xsi:type="SimpleText"><![CDATA[Network for error reset]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.ErrorReset" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="reset">
                <RelPosition x="1383" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="RetractStopperState">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles retracting the stopper once the appropriate switch has been moved, and there is not a full lane.]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" edge="none">
                <RelPosition x="123" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.SwitchOneExtended" edge="none">
                <RelPosition x="123" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.SwitchTwoExtended" edge="none">
                <RelPosition x="123" y="246" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" negated="true" edge="none">
                <RelPosition x="123" y="284" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="none">
                <RelPosition x="123" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveSwitch" edge="none">
                <RelPosition x="303" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="falling">
                <RelPosition x="303" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" negated="true" edge="none">
                <RelPosition x="453" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.DoRetractStopper" edge="none">
                <RelPosition x="603" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="Timer.TIME_DELAY">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="Timer.DetectTime">
                <RelPosition x="903" y="76" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="11" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="12" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="13">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.CapIsSorted" negated="true" edge="none">
                <RelPosition x="1023" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cacERROR_CAP_TIMEOUT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1173" y="114" />
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
                      <Connection refConnectionPointOutId="14" />
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
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.SwitchOneExtended" edge="none" latch="none">
                <RelPosition x="1293" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.SwitchTwoExtended" edge="none" latch="none">
                <RelPosition x="1293" y="246" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="set">
                <RelPosition x="1323" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="reset">
                <RelPosition x="1323" y="284" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIsSorted" edge="none" latch="reset">
                <RelPosition x="1353" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="reset">
                <RelPosition x="1353" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="reset">
                <RelPosition x="1353" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIsSorted" edge="none" latch="set">
                <RelPosition x="1353" y="398" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.LaneIsFull" edge="none" latch="none">
                <RelPosition x="1353" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="25">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1383" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="26">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="456" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="26" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="24" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="9" label="StopStatusAssignment">
              <Documentation xsi:type="SimpleText"><![CDATA[THis network sets the stopped status]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" edge="none">
                <RelPosition x="123" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="123" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Stopped" edge="none" latch="set">
                <RelPosition x="1353" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Stopped" edge="none" latch="reset">
                <RelPosition x="1353" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="10" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[This handles assignments upon enabling]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Cmd.Enable" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapArmCtrl.Cmd]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1263" y="0" />
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
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapArmCtrl.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1263" y="76" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1263" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapArmCtrl.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1383" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Cmd">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1413" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1413" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1503" y="0" />
                <Size x="3" y="228" />
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
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
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