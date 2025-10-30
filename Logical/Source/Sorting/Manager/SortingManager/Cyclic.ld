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
 * Description: This task is the manager task. It informs all other subtasks.
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
	zz$$$$_0_Manager_Cmd_Start_AndRe : BOOL;
	zz$$$$_1_Manager_Status_TooFull_ : BOOL;
	zz$$$$_2_gCapDetect_Status_Error : BOOL;
	zz$$$$_3_gMoveCap_Cmd_Start_AndR : BOOL;
	zz$$$$_4_Manager_Cmd_Auto_AndRes : BOOL;
	zz$$$$_5_Manager_Status_TooFull_ : BOOL;
	zz$$$$_6_gCapDetect_Status_Done_ : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_gMoveCap_Status_Stopped : BOOL;
	zz$$$$_9_Manager_Cmd_Manual_AndR : BOOL;
	zz$$$$_10_gMoveCap_Status_Stoppe : BOOL;
	zz$$$$_11_Manager_Status_Active_ : BOOL;
	zz$$$$_12_gCapArmCtrl_Status_Cap : BOOL;
	zz$$$$_13_gCapArmCtrl_Status_Cap : BOOL;
	zz$$$$_14_Manager_Cmd_Stop_AndRe : BOOL;
	zz$$$$_15_Manager_Status_Active_ : BOOL;
	zz$$$$_16_Eno_ComputeBlock : BOOL;
	zz$$$$_17_Eno_ComputeBlock : BOOL;
	zz$$$$_18_Eno_ComputeBlock : BOOL;
	zz$$$$_19_Eno_ComputeBlock : BOOL;
	zz$$$$_20_Eno_ComputeBlock : BOOL;
	zz$$$$_21_Eno_ComputeBlock : BOOL;
	zz$$$$_22_Manager_Status_Active_ : BOOL;
	zz$$$$_23_Eno_ComputeBlock : BOOL;
	zz$$$$_24_Eno_ComputeBlock : BOOL;
	zz$$$$_25_Eno_ComputeBlock : BOOL;
	zz$$$$_26_gSortingManager_Cmd_St : BOOL;
	zz$$$$_27_Eno_ComputeBlock : BOOL;
	zz$$$$_28_Eno_ComputeBlock : BOOL;
	zz$$$$_29_Eno_ComputeBlock : BOOL;
	zz$$$$_30_Eno_ComputeBlock : BOOL;
	zz$$$$_31_Eno_brsmemcpy : BOOL;
	zz$$$$_32_pSrc_brsmemcpy : ANY;
	zz$$$$_33_OUT_brsmemcpy : ANY;
END_VAR


{NetworkNumber := 1}
EnableSequence:
LD	Manager.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_0_Manager_Cmd_Start_AndRe
ANDN	Manager.Cmd.Stop {CheckDataType := BOOL}
ANDN	Manager.Status.TooFull {CheckDataType := BOOL}
ST	zz$$$$_1_Manager_Status_TooFull_
S	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_1_Manager_Status_TooFull_
S	gCapArmCtrl.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_1_Manager_Status_TooFull_
S	gMoveCap.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_1_Manager_Status_TooFull_
R	Manager.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_0_Manager_Cmd_Start_AndRe
ST	Manager.Status.Active {CheckDataType := BOOL}

{NetworkNumber := 2}
StartSequence:
LD	gCapArmCtrl.Status.Active {CheckDataType := BOOL}
AND	gCapDetect.Status.Active {CheckDataType := BOOL}
AND	gMoveCap.Status.Active {CheckDataType := BOOL}
ANDN	gMoveCap.Status.Error {CheckDataType := BOOL}
ANDN	gCapArmCtrl.Status.Error {CheckDataType := BOOL}
ANDN	gCapDetect.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_2_gCapDetect_Status_Error
ST	gCapArmCtrl.Cmd.Start {CheckDataType := BOOL}
ST	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Start {CheckDataType := BOOL}

{NetworkNumber := 3}
EntryStationLogic:
LD	gMoveCap.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_3_gMoveCap_Cmd_Start_AndR
ANDN	gMoveCap.Status.Stopped {CheckDataType := BOOL}
AND	Manager.Cmd.Auto {CheckDataType := BOOL}
ST	zz$$$$_4_Manager_Cmd_Auto_AndRes
AND	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
ANDN	Manager.Status.TooFull {CheckDataType := BOOL}
ST	zz$$$$_5_Manager_Status_TooFull_
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
ST	zz$$$$_6_gCapDetect_Status_Done_
ST	gCapArmCtrl.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_5_Manager_Status_TooFull_
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	gCapDetect.Par.CapColor
ST	gCapArmCtrl.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_5_Manager_Status_TooFull_
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
OR	zz$$$$_7_Eno_ComputeBlock
ST	gCapArmCtrl.Par.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_4_Manager_Cmd_Auto_AndRes
AND	gMoveCap.Cmd.Start {CheckDataType := BOOL}
S	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
AND	Manager.Cmd.JogFwd {CheckDataType := BOOL}
ST	gMoveCap.Cmd.JogFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
AND	Manager.Cmd.JogBkwd {CheckDataType := BOOL}
ST	gMoveCap.Cmd.JogBkwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
R	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
ST	zz$$$$_8_gMoveCap_Status_Stopped
AND	Manager.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
S	gCapArmCtrl.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
LD	zz$$$$_8_gMoveCap_Status_Stopped
ANDN	Manager.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
R	gCapArmCtrl.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
ST	zz$$$$_9_Manager_Cmd_Manual_AndR
AND	Manager.Cmd.MoveBackSwitch {CheckDataType := BOOL}
S	gCapArmCtrl.Cmd.MoveBackSwitch {CheckDataType := BOOL}
LD	zz$$$$_9_Manager_Cmd_Manual_AndR
ANDN	Manager.Cmd.MoveBackSwitch {CheckDataType := BOOL}
R	gCapArmCtrl.Cmd.MoveBackSwitch {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
ST	zz$$$$_10_gMoveCap_Status_Stoppe
AND	Manager.Cmd.DoRetractStopper {CheckDataType := BOOL}
S	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_10_gMoveCap_Status_Stoppe
ANDN	Manager.Cmd.DoRetractStopper {CheckDataType := BOOL}
R	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.Manual {CheckDataType := BOOL}
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
AND	Manager.Cmd.ManualCapDetect {CheckDataType := BOOL}
ST	gCapDetect.Cmd.ManualDetect {CheckDataType := BOOL}

{NetworkNumber := 4}
SetDoneStatus:
LD	Manager.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_11_Manager_Status_Active_
AND	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
ST	zz$$$$_12_gCapArmCtrl_Status_Cap
S	Manager.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_12_gCapArmCtrl_Status_Cap
S	gCapDetect.Status.CapIsSorted {CheckDataType := BOOL}
LD	zz$$$$_11_Manager_Status_Active_
ANDN	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
ST	zz$$$$_13_gCapArmCtrl_Status_Cap
R	Manager.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_13_gCapArmCtrl_Status_Cap
R	gCapDetect.Status.CapIsSorted {CheckDataType := BOOL}

{NetworkNumber := 5}
ManagerStoppingState:
LD	Manager.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_14_Manager_Cmd_Stop_AndRe
ST	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.Stop {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Stop {CheckDataType := BOOL}
S	Manager.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 6}
UpdatingConveyorPars:
LD	Manager.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_16_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	Manager.Par.Decel
ST	gMoveCap.Par.Decel
ll$$$$_IF_1:
LD	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_17_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	Manager.Par.Accel
ST	gMoveCap.Par.Accel
ll$$$$_IF_2:
LD	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_18_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	Manager.Par.Vel
ST	gMoveCap.Par.Vel
ll$$$$_IF_3:
LD	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_19_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	Manager.Par.JogAccel
ST	gMoveCap.Par.JogAccel
ll$$$$_IF_4:
LD	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_20_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	Manager.Par.JogVel
ST	gMoveCap.Par.JogVel
ll$$$$_IF_5:
LD	zz$$$$_15_Manager_Status_Active_
ST	zz$$$$_21_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Manager.Par.JogDecel
ST	gMoveCap.Par.JogDecel
ll$$$$_IF_6:
LD	zz$$$$_15_Manager_Status_Active_
AND	Manager.Cmd.UpdateConveyorPars {CheckDataType := BOOL}
ST	gMoveCap.Cmd.UpdatePars {CheckDataType := BOOL}
LD	zz$$$$_15_Manager_Status_Active_
AND	Manager.Cmd.Clear {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.Clear {CheckDataType := BOOL}

{NetworkNumber := 7}
MachineStatusPage:
LD	Manager.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_22_Manager_Status_Active_
AND	gCapArmCtrl.Status.SwitchOneExtended {CheckDataType := BOOL}
ST	Manager.Status.SwitchOneExtended {CheckDataType := BOOL}
LD	zz$$$$_22_Manager_Status_Active_
AND	gCapArmCtrl.Status.SwitchTwoExtended {CheckDataType := BOOL}
ST	Manager.Status.SwitchTwoExtended {CheckDataType := BOOL}
LD	zz$$$$_22_Manager_Status_Active_
AND	gCapArmCtrl.Status.LaneIsFull {CheckDataType := BOOL}
ST	Manager.Status.TooFull {CheckDataType := BOOL}
LD	zz$$$$_22_Manager_Status_Active_
AND	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
ST	Manager.Status.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_22_Manager_Status_Active_
ST	zz$$$$_23_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	gCapArmCtrl.Status.BlackCapCount
ST	Manager.Status.BlackCount
ll$$$$_IF_7:
LD	zz$$$$_22_Manager_Status_Active_
ST	zz$$$$_24_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	gCapArmCtrl.Status.RedCapCount
ST	Manager.Status.RedCount
ll$$$$_IF_8:
LD	zz$$$$_22_Manager_Status_Active_
ST	zz$$$$_25_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	gCapArmCtrl.Status.MetalCapCount
ST	Manager.Status.MetalCount
ll$$$$_IF_9:

{NetworkNumber := 8}
PowerOnMotor:
LD	Manager.Cmd.PowerOn {CheckDataType := BOOL}
ST	gMoveCap.Cmd.PowerOn {CheckDataType := BOOL}

{NetworkNumber := 9}
Assignments:
LD	gSortingManager.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_26_gSortingManager_Cmd_St
ST	zz$$$$_27_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	gSortingManager.Cmd
ST	Manager.Cmd
ll$$$$_IF_10:
LD	zz$$$$_26_gSortingManager_Cmd_St
ST	zz$$$$_28_Eno_ComputeBlock
JMPCN ll$$$$_IF_11
Compute!	Manager.Status
ST	gSortingManager.Status
ll$$$$_IF_11:
LD	zz$$$$_26_gSortingManager_Cmd_St
ST	zz$$$$_29_Eno_ComputeBlock
JMPCN ll$$$$_IF_12
Compute!	gCapDetect.Par.CapColor
ST	Manager.Status.CapColor
ll$$$$_IF_12:
LD	zz$$$$_26_gSortingManager_Cmd_St
ST	zz$$$$_30_Eno_ComputeBlock
JMPCN ll$$$$_IF_13
Compute!	gSortingManager.Par
ST	Manager.Par
ll$$$$_IF_13:
LD	zz$$$$_26_gSortingManager_Cmd_St
ST	zz$$$$_31_Eno_brsmemcpy
LD	gSortingManager.Status.CapColor
ADR
ST	zz$$$$_32_pSrc_brsmemcpy
LD	zz$$$$_31_Eno_brsmemcpy
JMPCN ll$$$$_IF_14
LD	gSortingManager.Status.CapColorID
ADR
brsmemcpy	zz$$$$_32_pSrc_brsmemcpy, 20
ST	zz$$$$_33_OUT_brsmemcpy
ll$$$$_IF_14:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="41" column="1" position="Net:1" />
                <LineMapInfo line="42" column="1" position="Net:1" />
                <LineMapInfo line="43" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="45" column="6" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="46" column="6" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="48" column="3" position="Net:1, Ln:1, Col:37" />
                <LineMapInfo line="49" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="50" column="3" position="Net:1, Ln:2, Col:37" />
                <LineMapInfo line="51" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="52" column="3" position="Net:1, Ln:3, Col:37" />
                <LineMapInfo line="53" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="54" column="3" position="Net:1, Ln:4, Col:37" />
                <LineMapInfo line="55" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="56" column="4" position="Net:1, Ln:5, Col:37" />
                <LineMapInfo line="58" column="1" position="Net:2" />
                <LineMapInfo line="59" column="1" position="Net:2" />
                <LineMapInfo line="60" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="61" column="5" position="Net:2, Ln:1, Col:6" />
                <LineMapInfo line="62" column="5" position="Net:2, Ln:1, Col:11" />
                <LineMapInfo line="63" column="6" position="Net:2, Ln:1, Col:16" />
                <LineMapInfo line="64" column="6" position="Net:2, Ln:1, Col:21" />
                <LineMapInfo line="65" column="6" position="Net:2, Ln:1, Col:26" />
                <LineMapInfo line="67" column="4" position="Net:2, Ln:1, Col:37" />
                <LineMapInfo line="68" column="4" position="Net:2, Ln:2, Col:37" />
                <LineMapInfo line="69" column="4" position="Net:2, Ln:3, Col:38" />
                <LineMapInfo line="71" column="1" position="Net:3" />
                <LineMapInfo line="72" column="1" position="Net:3" />
                <LineMapInfo line="73" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="75" column="6" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="76" column="5" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="78" column="5" position="Net:3, Ln:1, Col:14" />
                <LineMapInfo line="79" column="6" position="Net:3, Ln:1, Col:20" />
                <LineMapInfo line="81" column="5" position="Net:3, Ln:1, Col:25" />
                <LineMapInfo line="83" column="4" position="Net:3, Ln:1, Col:36" />
                <LineMapInfo line="84" column="4" position="Net:3, Ln:2, Col:35" />
                <LineMapInfo line="85" column="4" position="Net:3, Ln:1, Col:20" />
                <LineMapInfo line="86" column="4" position="Net:3, Ln:4, Col:25 [Block input EN]" />
                <LineMapInfo line="88" column="10" position="Net:3, Ln:4, Col:25" />
                <LineMapInfo line="89" column="4" position="Net:3, Ln:5, Col:31" />
                <LineMapInfo line="91" column="4" position="Net:3, Ln:1, Col:20" />
                <LineMapInfo line="92" column="5" position="Net:3, Ln:3, Col:25" />
                <LineMapInfo line="93" column="4" position="Net:3, Ln:4, Col:25 [Block output ENO]" />
                <LineMapInfo line="94" column="4" position="Net:3, Ln:3, Col:36" />
                <LineMapInfo line="95" column="4" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="96" column="5" position="Net:3, Ln:6, Col:14" />
                <LineMapInfo line="97" column="3" position="Net:3, Ln:6, Col:37" />
                <LineMapInfo line="98" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="99" column="5" position="Net:3, Ln:7, Col:5" />
                <LineMapInfo line="100" column="5" position="Net:3, Ln:7, Col:9" />
                <LineMapInfo line="101" column="5" position="Net:3, Ln:7, Col:14" />
                <LineMapInfo line="102" column="4" position="Net:3, Ln:7, Col:37" />
                <LineMapInfo line="103" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="104" column="5" position="Net:3, Ln:8, Col:5" />
                <LineMapInfo line="105" column="5" position="Net:3, Ln:8, Col:9" />
                <LineMapInfo line="106" column="5" position="Net:3, Ln:8, Col:14" />
                <LineMapInfo line="107" column="4" position="Net:3, Ln:8, Col:37" />
                <LineMapInfo line="108" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="109" column="5" position="Net:3, Ln:9, Col:5" />
                <LineMapInfo line="110" column="5" position="Net:3, Ln:9, Col:9" />
                <LineMapInfo line="111" column="3" position="Net:3, Ln:9, Col:37" />
                <LineMapInfo line="112" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="113" column="5" position="Net:3, Ln:10, Col:5" />
                <LineMapInfo line="114" column="5" position="Net:3, Ln:10, Col:9" />
                <LineMapInfo line="116" column="5" position="Net:3, Ln:10, Col:14" />
                <LineMapInfo line="117" column="3" position="Net:3, Ln:10, Col:35" />
                <LineMapInfo line="118" column="4" position="Net:3, Ln:10, Col:9" />
                <LineMapInfo line="119" column="6" position="Net:3, Ln:11, Col:14" />
                <LineMapInfo line="120" column="3" position="Net:3, Ln:11, Col:35" />
                <LineMapInfo line="121" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="122" column="5" position="Net:3, Ln:12, Col:5" />
                <LineMapInfo line="124" column="5" position="Net:3, Ln:12, Col:9" />
                <LineMapInfo line="125" column="3" position="Net:3, Ln:12, Col:35" />
                <LineMapInfo line="126" column="4" position="Net:3, Ln:12, Col:5" />
                <LineMapInfo line="127" column="6" position="Net:3, Ln:13, Col:9" />
                <LineMapInfo line="128" column="3" position="Net:3, Ln:13, Col:35" />
                <LineMapInfo line="129" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="130" column="5" position="Net:3, Ln:14, Col:5" />
                <LineMapInfo line="131" column="5" position="Net:3, Ln:14, Col:9" />
                <LineMapInfo line="133" column="5" position="Net:3, Ln:14, Col:14" />
                <LineMapInfo line="134" column="3" position="Net:3, Ln:14, Col:35" />
                <LineMapInfo line="135" column="4" position="Net:3, Ln:14, Col:9" />
                <LineMapInfo line="136" column="6" position="Net:3, Ln:15, Col:14" />
                <LineMapInfo line="137" column="3" position="Net:3, Ln:15, Col:35" />
                <LineMapInfo line="138" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="139" column="5" position="Net:3, Ln:16, Col:5" />
                <LineMapInfo line="140" column="5" position="Net:3, Ln:16, Col:9" />
                <LineMapInfo line="141" column="5" position="Net:3, Ln:16, Col:14" />
                <LineMapInfo line="142" column="4" position="Net:3, Ln:16, Col:36" />
                <LineMapInfo line="144" column="1" position="Net:4" />
                <LineMapInfo line="145" column="1" position="Net:4" />
                <LineMapInfo line="146" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="148" column="5" position="Net:4, Ln:1, Col:6" />
                <LineMapInfo line="150" column="3" position="Net:4, Ln:1, Col:38" />
                <LineMapInfo line="151" column="4" position="Net:4, Ln:1, Col:6" />
                <LineMapInfo line="152" column="3" position="Net:4, Ln:2, Col:36" />
                <LineMapInfo line="153" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="154" column="6" position="Net:4, Ln:3, Col:6" />
                <LineMapInfo line="156" column="3" position="Net:4, Ln:3, Col:38" />
                <LineMapInfo line="157" column="4" position="Net:4, Ln:3, Col:6" />
                <LineMapInfo line="158" column="3" position="Net:4, Ln:4, Col:36" />
                <LineMapInfo line="160" column="1" position="Net:5" />
                <LineMapInfo line="161" column="1" position="Net:5" />
                <LineMapInfo line="162" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="164" column="4" position="Net:5, Ln:1, Col:37" />
                <LineMapInfo line="165" column="4" position="Net:5, Ln:2, Col:37" />
                <LineMapInfo line="166" column="4" position="Net:5, Ln:3, Col:38" />
                <LineMapInfo line="167" column="3" position="Net:5, Ln:4, Col:37" />
                <LineMapInfo line="169" column="1" position="Net:6" />
                <LineMapInfo line="170" column="1" position="Net:6" />
                <LineMapInfo line="171" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="173" column="4" position="Net:6, Ln:1, Col:33 [Block input EN]" />
                <LineMapInfo line="175" column="10" position="Net:6, Ln:1, Col:33" />
                <LineMapInfo line="176" column="4" position="Net:6, Ln:2, Col:38" />
                <LineMapInfo line="178" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="179" column="4" position="Net:6, Ln:3, Col:33 [Block input EN]" />
                <LineMapInfo line="181" column="10" position="Net:6, Ln:3, Col:33" />
                <LineMapInfo line="182" column="4" position="Net:6, Ln:4, Col:38" />
                <LineMapInfo line="184" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="185" column="4" position="Net:6, Ln:5, Col:33 [Block input EN]" />
                <LineMapInfo line="187" column="10" position="Net:6, Ln:5, Col:33" />
                <LineMapInfo line="188" column="4" position="Net:6, Ln:6, Col:38" />
                <LineMapInfo line="190" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="191" column="4" position="Net:6, Ln:7, Col:31 [Block input EN]" />
                <LineMapInfo line="193" column="10" position="Net:6, Ln:7, Col:31" />
                <LineMapInfo line="194" column="4" position="Net:6, Ln:8, Col:37" />
                <LineMapInfo line="196" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="197" column="4" position="Net:6, Ln:9, Col:32 [Block input EN]" />
                <LineMapInfo line="199" column="10" position="Net:6, Ln:9, Col:32" />
                <LineMapInfo line="200" column="4" position="Net:6, Ln:10, Col:37" />
                <LineMapInfo line="202" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="203" column="4" position="Net:6, Ln:11, Col:31 [Block input EN]" />
                <LineMapInfo line="205" column="10" position="Net:6, Ln:11, Col:31" />
                <LineMapInfo line="206" column="4" position="Net:6, Ln:12, Col:37" />
                <LineMapInfo line="208" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="209" column="5" position="Net:6, Ln:13, Col:6" />
                <LineMapInfo line="210" column="4" position="Net:6, Ln:13, Col:36" />
                <LineMapInfo line="211" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="212" column="5" position="Net:6, Ln:14, Col:6" />
                <LineMapInfo line="213" column="4" position="Net:6, Ln:14, Col:37" />
                <LineMapInfo line="215" column="1" position="Net:7" />
                <LineMapInfo line="216" column="1" position="Net:7" />
                <LineMapInfo line="217" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="219" column="5" position="Net:7, Ln:1, Col:6" />
                <LineMapInfo line="220" column="4" position="Net:7, Ln:1, Col:35" />
                <LineMapInfo line="221" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="222" column="5" position="Net:7, Ln:2, Col:6" />
                <LineMapInfo line="223" column="4" position="Net:7, Ln:2, Col:35" />
                <LineMapInfo line="224" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="225" column="5" position="Net:7, Ln:3, Col:6" />
                <LineMapInfo line="226" column="4" position="Net:7, Ln:3, Col:37" />
                <LineMapInfo line="227" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="228" column="5" position="Net:7, Ln:4, Col:6" />
                <LineMapInfo line="229" column="4" position="Net:7, Ln:4, Col:36" />
                <LineMapInfo line="230" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="231" column="4" position="Net:7, Ln:5, Col:29 [Block input EN]" />
                <LineMapInfo line="233" column="10" position="Net:7, Ln:5, Col:29" />
                <LineMapInfo line="234" column="4" position="Net:7, Ln:6, Col:37" />
                <LineMapInfo line="236" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="237" column="4" position="Net:7, Ln:7, Col:29 [Block input EN]" />
                <LineMapInfo line="239" column="10" position="Net:7, Ln:7, Col:29" />
                <LineMapInfo line="240" column="4" position="Net:7, Ln:8, Col:37" />
                <LineMapInfo line="242" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="243" column="4" position="Net:7, Ln:9, Col:29 [Block input EN]" />
                <LineMapInfo line="245" column="10" position="Net:7, Ln:9, Col:29" />
                <LineMapInfo line="246" column="4" position="Net:7, Ln:10, Col:37" />
                <LineMapInfo line="249" column="1" position="Net:8" />
                <LineMapInfo line="250" column="1" position="Net:8" />
                <LineMapInfo line="251" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="252" column="4" position="Net:8, Ln:1, Col:37" />
                <LineMapInfo line="254" column="1" position="Net:9" />
                <LineMapInfo line="255" column="1" position="Net:9" />
                <LineMapInfo line="256" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="258" column="4" position="Net:9, Ln:1, Col:33 [Block input EN]" />
                <LineMapInfo line="260" column="10" position="Net:9, Ln:1, Col:33" />
                <LineMapInfo line="261" column="4" position="Net:9, Ln:2, Col:39" />
                <LineMapInfo line="263" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="264" column="4" position="Net:9, Ln:3, Col:33 [Block input EN]" />
                <LineMapInfo line="266" column="10" position="Net:9, Ln:3, Col:33" />
                <LineMapInfo line="267" column="4" position="Net:9, Ln:4, Col:37" />
                <LineMapInfo line="269" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="270" column="4" position="Net:9, Ln:5, Col:31 [Block input EN]" />
                <LineMapInfo line="272" column="10" position="Net:9, Ln:5, Col:31" />
                <LineMapInfo line="273" column="4" position="Net:9, Ln:6, Col:37" />
                <LineMapInfo line="275" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="276" column="4" position="Net:9, Ln:7, Col:34 [Block input EN]" />
                <LineMapInfo line="278" column="10" position="Net:9, Ln:7, Col:34" />
                <LineMapInfo line="279" column="4" position="Net:9, Ln:8, Col:39" />
                <LineMapInfo line="281" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="282" column="4" position="Net:9, Ln:9, Col:37 [Block input EN]" />
                <LineMapInfo line="283" column="4" position="Net:9, Ln:11, Col:29" />
                <LineMapInfo line="285" column="4" position="Net:9, Ln:9, Col:37 [Block input pSrc]" />
                <LineMapInfo line="286" column="4" position="Net:9, Ln:9, Col:37 [Block input EN]" />
                <LineMapInfo line="288" column="4" position="Net:9, Ln:10, Col:29" />
                <LineMapInfo line="290" column="1" position="Net:9, Ln:9, Col:37" />
                <LineMapInfo line="290" column="11" position="Net:9, Ln:9, Col:37 [Block input pSrc]" />
                <LineMapInfo line="290" column="37" position="Net:9, Ln:12, Col:35" />
                <LineMapInfo line="291" column="4" position="Net:9, Ln:9, Col:37 [Block output OUT]" />
                <LineMapInfo line="294" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="643FD5A4" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="EnableSequence">
              <Documentation xsi:type="SimpleText"><![CDATA[Enables all subtasks]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Stop" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="Manager.Status.TooFull" negated="true" edge="none">
                <RelPosition x="243" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="1083" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Stopped" edge="none" latch="reset">
                <RelPosition x="1083" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Active" edge="none" latch="none">
                <RelPosition x="1083" y="170" />
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
            <Rung evaluationOrder="2" label="StartSequence">
              <Documentation xsi:type="SimpleText"><![CDATA[Starts all subtasks once they are successfully active]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Active" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Active" edge="none">
                <RelPosition x="303" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Error" negated="true" edge="none">
                <RelPosition x="453" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.Error" negated="true" edge="none">
                <RelPosition x="603" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Error" negated="true" edge="none">
                <RelPosition x="753" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Start" edge="none" latch="none">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Start" edge="none" latch="none">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Start" edge="none" latch="none">
                <RelPosition x="1113" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="114" />
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
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="EntryStationLogic">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles logic for when a cap is detected as having entered the system]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="608" />
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
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="598" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="436" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Manual" edge="none">
                <RelPosition x="123" y="588" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveBackSwitch" edge="none">
                <RelPosition x="243" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveBackSwitch" negated="true" edge="none">
                <RelPosition x="243" y="474" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="243" y="588" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Auto" edge="none">
                <RelPosition x="273" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Par.ProductAvailable" edge="none">
                <RelPosition x="393" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.Start" edge="none">
                <RelPosition x="393" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.JogFwd" edge="none">
                <RelPosition x="393" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.JogBkwd" edge="none">
                <RelPosition x="393" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveFrontSwitch" edge="none">
                <RelPosition x="393" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveFrontSwitch" negated="true" edge="none">
                <RelPosition x="393" y="398" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="25">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.DoRetractStopper" edge="none">
                <RelPosition x="393" y="512" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="26">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.DoRetractStopper" negated="true" edge="none">
                <RelPosition x="393" y="550" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="27">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.ManualCapDetect" edge="none">
                <RelPosition x="393" y="588" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="28">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Status.TooFull" negated="true" edge="none">
                <RelPosition x="573" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="29">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="723" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="29" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="30">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="723" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="29" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="31">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapDetect.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="723" y="114" />
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
                      <Connection refConnectionPointOutId="29" />
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
                    <ConnectionPointOut connectionPointOutId="32">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="33">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapArmCtrl.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="903" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="33" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="none">
                <RelPosition x="1023" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="30" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="34">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveFrontSwitch" edge="none" latch="set">
                <RelPosition x="1023" y="360" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="24" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="35">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveFrontSwitch" edge="none" latch="reset">
                <RelPosition x="1023" y="398" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="36">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveBackSwitch" edge="none" latch="set">
                <RelPosition x="1023" y="436" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="37">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveBackSwitch" edge="none" latch="reset">
                <RelPosition x="1023" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="38">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="set">
                <RelPosition x="1023" y="512" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="26" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="39">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="reset">
                <RelPosition x="1023" y="550" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="27" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="40">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveSwitch" edge="none" latch="none">
                <RelPosition x="1053" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="30" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="41">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="1053" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="31" />
                  <Connection refConnectionPointOutId="32" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="42">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.ManualDetect" edge="none" latch="none">
                <RelPosition x="1053" y="588" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="28" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="43">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="1083" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="44">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.JogFwd" edge="none" latch="none">
                <RelPosition x="1083" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="45">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.JogBkwd" edge="none" latch="none">
                <RelPosition x="1083" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="46">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="1083" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="47">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="608" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="41" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="34" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="42" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="44" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="45" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="46" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="47" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="35" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="36" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="37" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="38" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                  <Connection refConnectionPointOutId="39" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="560" />
                  <Connection refConnectionPointOutId="40" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="598" />
                  <Connection refConnectionPointOutId="43" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="SetDoneStatus">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles setting the manager done status]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Manager.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.CapIsSorted" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.CapIsSorted" negated="true" edge="none">
                <RelPosition x="153" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.CapIsSorted" edge="none" latch="set">
                <RelPosition x="1053" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.CapIsSorted" edge="none" latch="reset">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Done" edge="none" latch="set">
                <RelPosition x="1113" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Done" edge="none" latch="reset">
                <RelPosition x="1113" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
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
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="ManagerStoppingState">
              <Documentation xsi:type="SimpleText"><![CDATA[This manger handles stopping for the manager and all subtasks]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Stop" edge="none">
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
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Stop" edge="none" latch="none">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Stop" edge="none" latch="none">
                <RelPosition x="1083" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Stopped" edge="none" latch="set">
                <RelPosition x="1083" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Stop" edge="none" latch="none">
                <RelPosition x="1113" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="152" />
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
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="UpdatingConveyorPars">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles conveyor par updates]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Manager.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.UpdateConveyorPars" edge="none">
                <RelPosition x="153" y="474" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.Clear" edge="none">
                <RelPosition x="153" y="512" />
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
                    <ComputeBlock><![CDATA[Manager.Par.JogAccel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="903" y="228" />
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
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par.JogDecel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="903" y="380" />
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
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par.JogVel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="933" y="304" />
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
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="10">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par.Decel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="0" />
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
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par.Accel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="13">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par.Vel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="15">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.UpdatePars" edge="none" latch="none">
                <RelPosition x="1053" y="474" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.JogAccel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.JogVel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.JogDecel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="436" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Clear" edge="none" latch="none">
                <RelPosition x="1083" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.Decel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.Accel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par.Vel">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1113" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="532" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="MachineStatusPage">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles displaying the machine status page colors]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="380" />
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
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Status.Active" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.SwitchOneExtended" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.SwitchTwoExtended" edge="none">
                <RelPosition x="153" y="56" />
                <Size x="240" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.LaneIsFull" edge="none">
                <RelPosition x="153" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Par.ProductAvailable" edge="none">
                <RelPosition x="153" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapArmCtrl.Status.BlackCapCount]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="152" />
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
                    <ComputeBlock><![CDATA[gCapArmCtrl.Status.RedCapCount]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="228" />
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
                    <ComputeBlock><![CDATA[gCapArmCtrl.Status.MetalCapCount]]></ComputeBlock>
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
              <LdObject xsi:type="Coil" operand="Manager.Status.SwitchOneExtended" edge="none" latch="none">
                <RelPosition x="1023" y="18" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.SwitchTwoExtended" edge="none" latch="none">
                <RelPosition x="1023" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.ProductAvailable" edge="none" latch="none">
                <RelPosition x="1053" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.TooFull" edge="none" latch="none">
                <RelPosition x="1083" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Status.BlackCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Status.RedCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Status.MetalCount">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="PowerOnMotor">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles motor power on/off]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.PowerOn" edge="none">
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
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.PowerOn" edge="none" latch="none">
                <RelPosition x="1083" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="9" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[Connects internal Manager variable to global SortingManager variable]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gSortingManager.Cmd.Start" edge="none">
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
              <FbdObject xsi:type="DataSource" identifier="gSortingManager.Status.CapColorID">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="843" y="360" />
                <Size x="240" y="20" />
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="gSortingManager.Status.CapColor">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="843" y="398" />
                <Size x="240" y="20" />
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="240" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapDetect.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="903" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gSortingManager.Cmd]]></ComputeBlock>
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
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="180" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="10">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gSortingManager.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="993" y="228" />
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
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="20">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1023" y="436" />
                <Size x="60" y="20" />
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="60" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gSortingManager.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Status.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="brsmemcpy">
                <RelPosition x="1083" y="304" />
                <Size x="120" y="152" />
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
                  <InputVariable parameterName="pDest">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="3" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="pSrc">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                      <Connection refConnectionPointOutId="4" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="length">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                      <Connection refConnectionPointOutId="13" />
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
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="OUT">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Cmd">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1143" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1143" y="284" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1233" y="0" />
                <Size x="3" y="456" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="5" />
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
                  <Connection refConnectionPointOutId="14" />
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
              </LdObject>
            </Rung>
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>