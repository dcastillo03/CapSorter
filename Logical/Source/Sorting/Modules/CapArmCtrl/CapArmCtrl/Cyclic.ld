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
	zz$$$$_17_Internal_Status_Active : BOOL;
	zz$$$$_18_Internal_Status_CapIde : BOOL;
	zz$$$$_19_Internal_Cmd_MoveSwitc : BOOL;
	zz$$$$_20_Internal_Cmd_MoveSwitc : BOOL;
	zz$$$$_21_Internal_Status_Stoppe : BOOL;
	zz$$$$_22_Internal_Status_Active : BOOL;
	zz$$$$_23_Internal_Cmd_DoRetract : BOOL;
	zz$$$$_24_f_trig_IO_Inputs_diLan : f_trig;
	zz$$$$_25_IO_Inputs_diLaneSensor : BOOL;
	zz$$$$_26_Internal_Status_Active : BOOL;
	zz$$$$_27_gCapArmCtrl_Cmd_Enable : BOOL;
	zz$$$$_28_Eno_ComputeBlock : BOOL;
	zz$$$$_29_Eno_ComputeBlock : BOOL;
	zz$$$$_30_Eno_ComputeBlock : BOOL;
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

{NetworkNumber := 5}
sorterCAP_ARM_CTRL:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_17_Internal_Status_Active
AND	Internal.Status.CapIdentified {CheckDataType := BOOL}
ST	zz$$$$_18_Internal_Status_CapIde
AND	CapColor.Metal {CheckDataType := BOOL}
JMPC	RetractStopperState
LD	zz$$$$_18_Internal_Status_CapIde
AND	CapColor.Red {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	zz$$$$_19_Internal_Cmd_MoveSwitc
S	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_19_Internal_Cmd_MoveSwitc
JMPC	RetractStopperState
LD	zz$$$$_18_Internal_Status_CapIde
AND	CapColor.Black {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	zz$$$$_20_Internal_Cmd_MoveSwitc
S	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_20_Internal_Cmd_MoveSwitc
JMPC	RetractStopperState
LD	zz$$$$_17_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
AND	Internal.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
S	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_17_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
R	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_17_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
AND	Internal.Cmd.MoveBackSwitch {CheckDataType := BOOL}
S	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_17_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveBackSwitch {CheckDataType := BOOL}
R	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}

{NetworkNumber := 6}
ManualRetractor:
LD	Internal.Status.Active {CheckDataType := BOOL}
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ST	zz$$$$_21_Internal_Status_Stoppe
AND	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
S	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_21_Internal_Status_Stoppe
ANDN	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
R	IO.Outputs.doRetractStopper {CheckDataType := BOOL}

{NetworkNumber := 7}
RetractStopperState:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_22_Internal_Status_Active
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
AND	Internal.Cmd.MoveSwitch {CheckDataType := BOOL}
ANDN	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
AND	Internal.Cmd.DoRetractStopper {CheckDataType := BOOL}
ST	zz$$$$_23_Internal_Cmd_DoRetract
S	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_23_Internal_Cmd_DoRetract
R	Internal.Status.CapIsSorted {CheckDataType := BOOL}
LD	zz$$$$_22_Internal_Status_Active
AND	IO.Inputs.SwitchOneExtended {CheckDataType := BOOL}
ST	Internal.Status.SwitchOneExtended {CheckDataType := BOOL}
LD	zz$$$$_22_Internal_Status_Active
AND	IO.Inputs.SwitchTwoExtended {CheckDataType := BOOL}
ST	Internal.Status.SwitchTwoExtended {CheckDataType := BOOL}
LD	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	zz$$$$_24_f_trig_IO_Inputs_diLan.CLK
CAL	zz$$$$_24_f_trig_IO_Inputs_diLan
LD	zz$$$$_22_Internal_Status_Active
ANDN	Internal.Par.ProductAvailable {CheckDataType := BOOL}
AND	zz$$$$_24_f_trig_IO_Inputs_diLan.Q
ST	zz$$$$_25_IO_Inputs_diLaneSensor
R	IO.Outputs.doRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_25_IO_Inputs_diLaneSensor
R	IO.Outputs.doSwitchTwo {CheckDataType := BOOL}
LD	zz$$$$_25_IO_Inputs_diLaneSensor
R	IO.Outputs.doSwitchOne {CheckDataType := BOOL}
LD	zz$$$$_25_IO_Inputs_diLaneSensor
S	Internal.Status.CapIsSorted {CheckDataType := BOOL}
LD	zz$$$$_22_Internal_Status_Active
AND	IO.Inputs.diLaneSensor {CheckDataType := BOOL}
ST	Internal.Status.LaneIsFull {CheckDataType := BOOL}

{NetworkNumber := 8}
StopStatusAssignment:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_26_Internal_Status_Active
AND	Internal.Cmd.Stop {CheckDataType := BOOL}
S	Internal.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_26_Internal_Status_Active
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
R	Internal.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 9}
Assignments:
LD	gCapArmCtrl.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_27_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_28_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	gCapArmCtrl.Cmd
ST	Internal.Cmd
ll$$$$_IF_8:
LD	zz$$$$_27_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_29_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	gCapArmCtrl.Par
ST	Internal.Par
ll$$$$_IF_9:
LD	zz$$$$_27_gCapArmCtrl_Cmd_Enable
ST	zz$$$$_30_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	Internal.Status
ST	gCapArmCtrl.Status
ll$$$$_IF_10:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="38" column="1" position="Net:1" />
                <LineMapInfo line="39" column="1" position="Net:1" />
                <LineMapInfo line="40" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="41" column="5" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="43" column="4" position="Net:1, Ln:1, Col:29" />
                <LineMapInfo line="44" column="6" position="Net:1, Ln:2, Col:29" />
                <LineMapInfo line="46" column="1" position="Net:2" />
                <LineMapInfo line="47" column="1" position="Net:2" />
                <LineMapInfo line="48" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="50" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="52" column="3" position="Net:2, Ln:1, Col:29" />
                <LineMapInfo line="53" column="4" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="54" column="4" position="Net:2, Ln:2, Col:24 [Block input EN]" />
                <LineMapInfo line="56" column="10" position="Net:2, Ln:2, Col:24" />
                <LineMapInfo line="57" column="4" position="Net:2, Ln:3, Col:29" />
                <LineMapInfo line="59" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="60" column="6" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="62" column="3" position="Net:2, Ln:4, Col:29" />
                <LineMapInfo line="63" column="4" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="64" column="4" position="Net:2, Ln:5, Col:22 [Block input EN]" />
                <LineMapInfo line="66" column="10" position="Net:2, Ln:5, Col:22" />
                <LineMapInfo line="67" column="4" position="Net:2, Ln:6, Col:29" />
                <LineMapInfo line="70" column="1" position="Net:3" />
                <LineMapInfo line="71" column="1" position="Net:3" />
                <LineMapInfo line="72" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="73" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="75" column="4" position="Net:3, Ln:2, Col:11 [Block input EN]" />
                <LineMapInfo line="77" column="10" position="Net:3, Ln:2, Col:11" />
                <LineMapInfo line="78" column="4" position="Net:3, Ln:3, Col:19" />
                <LineMapInfo line="80" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="81" column="5" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="82" column="4" position="Net:3, Ln:2, Col:11 [Block output ENO]" />
                <LineMapInfo line="83" column="4" position="Net:3, Ln:1, Col:28" />
                <LineMapInfo line="84" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="85" column="4" position="Net:3, Ln:5, Col:11 [Block input EN]" />
                <LineMapInfo line="87" column="10" position="Net:3, Ln:5, Col:11" />
                <LineMapInfo line="88" column="4" position="Net:3, Ln:6, Col:19" />
                <LineMapInfo line="90" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="91" column="5" position="Net:3, Ln:4, Col:11" />
                <LineMapInfo line="92" column="4" position="Net:3, Ln:5, Col:11 [Block output ENO]" />
                <LineMapInfo line="93" column="4" position="Net:3, Ln:4, Col:28" />
                <LineMapInfo line="94" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="95" column="4" position="Net:3, Ln:8, Col:11 [Block input EN]" />
                <LineMapInfo line="97" column="10" position="Net:3, Ln:8, Col:11" />
                <LineMapInfo line="98" column="4" position="Net:3, Ln:9, Col:19" />
                <LineMapInfo line="100" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="101" column="5" position="Net:3, Ln:7, Col:11" />
                <LineMapInfo line="102" column="4" position="Net:3, Ln:8, Col:11 [Block output ENO]" />
                <LineMapInfo line="103" column="4" position="Net:3, Ln:7, Col:28" />
                <LineMapInfo line="105" column="1" position="Net:4" />
                <LineMapInfo line="106" column="1" position="Net:4" />
                <LineMapInfo line="107" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="109" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="110" column="4" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="111" column="5" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="113" column="5" position="Net:4, Ln:1, Col:5" />
                <LineMapInfo line="114" column="5" position="Net:4, Ln:1, Col:8" />
                <LineMapInfo line="115" column="4" position="Net:4, Ln:1, Col:20 [Block input EN]" />
                <LineMapInfo line="117" column="10" position="Net:4, Ln:1, Col:20" />
                <LineMapInfo line="118" column="4" position="Net:4, Ln:2, Col:27" />
                <LineMapInfo line="120" column="4" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="121" column="4" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="122" column="5" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="123" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="124" column="5" position="Net:4, Ln:3, Col:5" />
                <LineMapInfo line="125" column="5" position="Net:4, Ln:3, Col:8" />
                <LineMapInfo line="126" column="4" position="Net:4, Ln:3, Col:20 [Block input EN]" />
                <LineMapInfo line="128" column="10" position="Net:4, Ln:3, Col:20" />
                <LineMapInfo line="129" column="4" position="Net:4, Ln:4, Col:27" />
                <LineMapInfo line="131" column="4" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="132" column="4" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="133" column="5" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="134" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="135" column="5" position="Net:4, Ln:5, Col:5" />
                <LineMapInfo line="136" column="5" position="Net:4, Ln:5, Col:8" />
                <LineMapInfo line="137" column="4" position="Net:4, Ln:5, Col:20 [Block input EN]" />
                <LineMapInfo line="139" column="10" position="Net:4, Ln:5, Col:20" />
                <LineMapInfo line="140" column="4" position="Net:4, Ln:6, Col:27" />
                <LineMapInfo line="143" column="1" position="Net:5" />
                <LineMapInfo line="144" column="1" position="Net:5" />
                <LineMapInfo line="145" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="147" column="5" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="149" column="5" position="Net:5, Ln:1, Col:10" />
                <LineMapInfo line="150" column="6" position="Net:5, Ln:1, Col:29" />
                <LineMapInfo line="151" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="152" column="5" position="Net:5, Ln:2, Col:10" />
                <LineMapInfo line="153" column="5" position="Net:5, Ln:2, Col:13" />
                <LineMapInfo line="155" column="3" position="Net:5, Ln:2, Col:28" />
                <LineMapInfo line="156" column="4" position="Net:5, Ln:2, Col:13" />
                <LineMapInfo line="157" column="6" position="Net:5, Ln:3, Col:29" />
                <LineMapInfo line="158" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="159" column="5" position="Net:5, Ln:4, Col:10" />
                <LineMapInfo line="160" column="5" position="Net:5, Ln:4, Col:13" />
                <LineMapInfo line="162" column="3" position="Net:5, Ln:4, Col:28" />
                <LineMapInfo line="163" column="4" position="Net:5, Ln:4, Col:13" />
                <LineMapInfo line="164" column="6" position="Net:5, Ln:5, Col:29" />
                <LineMapInfo line="165" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="166" column="5" position="Net:5, Ln:6, Col:5" />
                <LineMapInfo line="167" column="5" position="Net:5, Ln:6, Col:10" />
                <LineMapInfo line="168" column="3" position="Net:5, Ln:6, Col:28" />
                <LineMapInfo line="169" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="170" column="5" position="Net:5, Ln:7, Col:5" />
                <LineMapInfo line="171" column="6" position="Net:5, Ln:7, Col:10" />
                <LineMapInfo line="172" column="3" position="Net:5, Ln:7, Col:28" />
                <LineMapInfo line="173" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="174" column="5" position="Net:5, Ln:8, Col:5" />
                <LineMapInfo line="175" column="5" position="Net:5, Ln:8, Col:10" />
                <LineMapInfo line="176" column="3" position="Net:5, Ln:8, Col:28" />
                <LineMapInfo line="177" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="178" column="5" position="Net:5, Ln:9, Col:5" />
                <LineMapInfo line="179" column="6" position="Net:5, Ln:9, Col:10" />
                <LineMapInfo line="180" column="3" position="Net:5, Ln:9, Col:28" />
                <LineMapInfo line="182" column="1" position="Net:6" />
                <LineMapInfo line="183" column="1" position="Net:6" />
                <LineMapInfo line="184" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="185" column="5" position="Net:6, Ln:1, Col:5" />
                <LineMapInfo line="187" column="5" position="Net:6, Ln:1, Col:10" />
                <LineMapInfo line="188" column="3" position="Net:6, Ln:1, Col:27" />
                <LineMapInfo line="189" column="4" position="Net:6, Ln:1, Col:5" />
                <LineMapInfo line="190" column="6" position="Net:6, Ln:2, Col:10" />
                <LineMapInfo line="191" column="3" position="Net:6, Ln:2, Col:27" />
                <LineMapInfo line="193" column="1" position="Net:7" />
                <LineMapInfo line="194" column="1" position="Net:7" />
                <LineMapInfo line="195" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="197" column="5" position="Net:7, Ln:1, Col:5" />
                <LineMapInfo line="198" column="5" position="Net:7, Ln:1, Col:11" />
                <LineMapInfo line="199" column="6" position="Net:7, Ln:1, Col:16" />
                <LineMapInfo line="200" column="5" position="Net:7, Ln:1, Col:21" />
                <LineMapInfo line="202" column="3" position="Net:7, Ln:1, Col:27" />
                <LineMapInfo line="203" column="4" position="Net:7, Ln:1, Col:21" />
                <LineMapInfo line="204" column="3" position="Net:7, Ln:2, Col:28" />
                <LineMapInfo line="205" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="206" column="5" position="Net:7, Ln:3, Col:5" />
                <LineMapInfo line="207" column="4" position="Net:7, Ln:3, Col:26" />
                <LineMapInfo line="208" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="209" column="5" position="Net:7, Ln:4, Col:5" />
                <LineMapInfo line="210" column="4" position="Net:7, Ln:4, Col:26" />
                <LineMapInfo line="211" column="4" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="212" column="4" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="213" column="5" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="214" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="215" column="6" position="Net:7, Ln:5, Col:5" />
                <LineMapInfo line="216" column="5" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="218" column="3" position="Net:7, Ln:5, Col:27" />
                <LineMapInfo line="219" column="4" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="220" column="3" position="Net:7, Ln:6, Col:28" />
                <LineMapInfo line="221" column="4" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="222" column="3" position="Net:7, Ln:7, Col:28" />
                <LineMapInfo line="223" column="4" position="Net:7, Ln:5, Col:11" />
                <LineMapInfo line="224" column="3" position="Net:7, Ln:8, Col:28" />
                <LineMapInfo line="225" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="226" column="5" position="Net:7, Ln:9, Col:5" />
                <LineMapInfo line="227" column="4" position="Net:7, Ln:9, Col:28" />
                <LineMapInfo line="229" column="1" position="Net:8" />
                <LineMapInfo line="230" column="1" position="Net:8" />
                <LineMapInfo line="231" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="233" column="5" position="Net:8, Ln:1, Col:5" />
                <LineMapInfo line="234" column="3" position="Net:8, Ln:1, Col:28" />
                <LineMapInfo line="235" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="236" column="6" position="Net:8, Ln:2, Col:5" />
                <LineMapInfo line="237" column="3" position="Net:8, Ln:2, Col:28" />
                <LineMapInfo line="239" column="1" position="Net:9" />
                <LineMapInfo line="240" column="1" position="Net:9" />
                <LineMapInfo line="241" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="243" column="4" position="Net:9, Ln:1, Col:25 [Block input EN]" />
                <LineMapInfo line="245" column="10" position="Net:9, Ln:1, Col:25" />
                <LineMapInfo line="246" column="4" position="Net:9, Ln:2, Col:30" />
                <LineMapInfo line="248" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="249" column="4" position="Net:9, Ln:3, Col:25 [Block input EN]" />
                <LineMapInfo line="251" column="10" position="Net:9, Ln:3, Col:25" />
                <LineMapInfo line="252" column="4" position="Net:9, Ln:4, Col:30" />
                <LineMapInfo line="254" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="255" column="4" position="Net:9, Ln:5, Col:25 [Block input EN]" />
                <LineMapInfo line="257" column="10" position="Net:9, Ln:5, Col:25" />
                <LineMapInfo line="258" column="4" position="Net:9, Ln:6, Col:29" />
                <LineMapInfo line="261" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="0105B96B" />
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
                <RelPosition x="843" y="18" />
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
                <RelPosition x="843" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
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
                <RelPosition x="633" y="152" />
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
                <RelPosition x="693" y="38" />
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
                <RelPosition x="843" y="18" />
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
                <RelPosition x="843" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="843" y="132" />
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
                <RelPosition x="843" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
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
                <RelPosition x="813" y="18" />
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
                <RelPosition x="813" y="132" />
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
                <RelPosition x="813" y="246" />
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
                <RelPosition x="963" y="0" />
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
              <LdObject xsi:type="Contact" operand="IO.Inputs.diLaneSensor" edge="falling">
                <RelPosition x="213" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
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
                <ConnectionPointOut connectionPointOutId="7">
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
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.BlackCapCount + 1]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="573" y="0" />
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
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="10">
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
                <RelPosition x="573" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
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
                <RelPosition x="573" y="152" />
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.BlackCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.RedCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.MetalCapCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="9" />
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
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="sorterCAP_ARM_CTRL">
              <Documentation xsi:type="SimpleText"><![CDATA[Moves the appropriate switch depending on the cap color]]></Documentation>
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
                <RelPosition x="123" y="208" />
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
                <RelPosition x="123" y="246" />
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
                <RelPosition x="123" y="284" />
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
                <RelPosition x="123" y="322" />
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
                <RelPosition x="273" y="132" />
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
                <RelPosition x="273" y="208" />
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
                <RelPosition x="273" y="246" />
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
                <RelPosition x="273" y="284" />
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
                <RelPosition x="273" y="322" />
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
                <RelPosition x="363" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="set">
                <RelPosition x="813" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="set">
                <RelPosition x="813" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="set">
                <RelPosition x="813" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="reset">
                <RelPosition x="813" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="set">
                <RelPosition x="813" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="reset">
                <RelPosition x="813" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="843" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="843" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="RetractStopperState">
                <RelPosition x="843" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
                <Size x="3" y="342" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="22" />
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
                <RelPosition x="783" y="18" />
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
                <RelPosition x="783" y="56" />
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
                <RelPosition x="963" y="0" />
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
            <Rung evaluationOrder="7" label="RetractStopperState">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles retracting the stopper once the appropriate switch has been moved, and there is not a full lane.]]></Documentation>
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
                <RelPosition x="123" y="94" />
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
                <RelPosition x="123" y="132" />
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
                <RelPosition x="123" y="170" />
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
                <RelPosition x="123" y="322" />
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
                <RelPosition x="303" y="170" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.SwitchOneExtended" edge="none" latch="none">
                <RelPosition x="753" y="94" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.SwitchTwoExtended" edge="none" latch="none">
                <RelPosition x="753" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="set">
                <RelPosition x="783" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doRetractStopper" edge="none" latch="reset">
                <RelPosition x="783" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIsSorted" edge="none" latch="reset">
                <RelPosition x="813" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchTwo" edge="none" latch="reset">
                <RelPosition x="813" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Outputs.doSwitchOne" edge="none" latch="reset">
                <RelPosition x="813" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIsSorted" edge="none" latch="set">
                <RelPosition x="813" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.LaneIsFull" edge="none" latch="none">
                <RelPosition x="813" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
                <Size x="3" y="342" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="15" />
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
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="StopStatusAssignment">
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
                <RelPosition x="813" y="18" />
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
                <RelPosition x="813" y="56" />
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
                <RelPosition x="963" y="0" />
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
            <Rung evaluationOrder="9" label="Assignments">
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
                <RelPosition x="723" y="0" />
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
                <RelPosition x="723" y="76" />
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
                <RelPosition x="723" y="152" />
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
                <RelPosition x="843" y="208" />
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
                <RelPosition x="873" y="56" />
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
                <RelPosition x="873" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="963" y="0" />
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