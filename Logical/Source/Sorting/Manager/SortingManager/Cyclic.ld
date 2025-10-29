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
	zz$$$$_4_gMoveCap_Status_Stopped : BOOL;
	zz$$$$_5_gCapDetect_Par_ProductA : BOOL;
	zz$$$$_6_gCapDetect_Status_Done_ : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_Manager_Status_Active_A : BOOL;
	zz$$$$_9_Manager_Cmd_Stop_AndRes : BOOL;
	zz$$$$_10_gSortingManager_Cmd_St : BOOL;
	zz$$$$_11_Eno_ComputeBlock : BOOL;
	zz$$$$_12_Eno_ComputeBlock : BOOL;
	zz$$$$_13_Eno_ComputeBlock : BOOL;
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
ST	zz$$$$_4_gMoveCap_Status_Stopped
AND	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_5_gCapDetect_Par_ProductA
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
ST	zz$$$$_6_gCapDetect_Status_Done_
ST	gCapArmCtrl.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_5_gCapDetect_Par_ProductA
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	gCapDetect.Par.CapColor
ST	gCapArmCtrl.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_5_gCapDetect_Par_ProductA
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
OR	zz$$$$_7_Eno_ComputeBlock
ST	gCapArmCtrl.Par.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_4_gMoveCap_Status_Stopped
AND	gMoveCap.Cmd.Start {CheckDataType := BOOL}
S	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.JogFwd {CheckDataType := BOOL}
ST	gMoveCap.Cmd.JogFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.JogBkwd {CheckDataType := BOOL}
ST	gMoveCap.Cmd.JogBkwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	gMoveCap.Status.Stopped {CheckDataType := BOOL}
R	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.MoveFrontSwitch {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.MoveBackSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.MoveBackSwitch {CheckDataType := BOOL}
LD	zz$$$$_3_gMoveCap_Cmd_Start_AndR
AND	Manager.Cmd.DoRetractStopper {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}

{NetworkNumber := 4}
SetDoneStatus:
LD	Manager.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_8_Manager_Status_Active_A
AND	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
S	Manager.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_8_Manager_Status_Active_A
ANDN	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
R	Manager.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 5}
ManagerStoppingState:
LD	Manager.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_9_Manager_Cmd_Stop_AndRes
ST	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.Stop {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Stop {CheckDataType := BOOL}
S	Manager.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 6}
LaneTooFullState:
LD	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
ST	Manager.Status.TooFull {CheckDataType := BOOL}

{NetworkNumber := 7}
Assignments:
LD	gSortingManager.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_10_gSortingManager_Cmd_St
ST	zz$$$$_11_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	gSortingManager.Cmd
ST	Manager.Cmd
ll$$$$_IF_1:
LD	zz$$$$_10_gSortingManager_Cmd_St
ST	zz$$$$_12_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	Manager.Par
ST	gSortingManager.Par
ll$$$$_IF_2:
LD	zz$$$$_10_gSortingManager_Cmd_St
ST	zz$$$$_13_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	Manager.Status
ST	gSortingManager.Status
ll$$$$_IF_3:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="21" column="1" position="Net:1" />
                <LineMapInfo line="22" column="1" position="Net:1" />
                <LineMapInfo line="23" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="25" column="6" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="26" column="6" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="28" column="3" position="Net:1, Ln:1, Col:31" />
                <LineMapInfo line="29" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="30" column="3" position="Net:1, Ln:2, Col:31" />
                <LineMapInfo line="31" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="32" column="3" position="Net:1, Ln:3, Col:31" />
                <LineMapInfo line="33" column="4" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="34" column="3" position="Net:1, Ln:4, Col:31" />
                <LineMapInfo line="35" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:5, Col:31" />
                <LineMapInfo line="38" column="1" position="Net:2" />
                <LineMapInfo line="39" column="1" position="Net:2" />
                <LineMapInfo line="40" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="41" column="5" position="Net:2, Ln:1, Col:6" />
                <LineMapInfo line="42" column="5" position="Net:2, Ln:1, Col:11" />
                <LineMapInfo line="43" column="6" position="Net:2, Ln:1, Col:16" />
                <LineMapInfo line="44" column="6" position="Net:2, Ln:1, Col:21" />
                <LineMapInfo line="45" column="6" position="Net:2, Ln:1, Col:26" />
                <LineMapInfo line="47" column="4" position="Net:2, Ln:1, Col:31" />
                <LineMapInfo line="48" column="4" position="Net:2, Ln:2, Col:31" />
                <LineMapInfo line="49" column="4" position="Net:2, Ln:3, Col:32" />
                <LineMapInfo line="51" column="1" position="Net:3" />
                <LineMapInfo line="52" column="1" position="Net:3" />
                <LineMapInfo line="53" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="55" column="6" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="57" column="5" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="59" column="5" position="Net:3, Ln:1, Col:16" />
                <LineMapInfo line="61" column="4" position="Net:3, Ln:1, Col:30" />
                <LineMapInfo line="62" column="4" position="Net:3, Ln:2, Col:29" />
                <LineMapInfo line="63" column="4" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="64" column="4" position="Net:3, Ln:4, Col:16 [Block input EN]" />
                <LineMapInfo line="66" column="10" position="Net:3, Ln:4, Col:16" />
                <LineMapInfo line="67" column="4" position="Net:3, Ln:5, Col:22" />
                <LineMapInfo line="69" column="4" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="70" column="5" position="Net:3, Ln:3, Col:16" />
                <LineMapInfo line="71" column="4" position="Net:3, Ln:4, Col:16 [Block output ENO]" />
                <LineMapInfo line="72" column="4" position="Net:3, Ln:3, Col:30" />
                <LineMapInfo line="73" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="74" column="5" position="Net:3, Ln:6, Col:10" />
                <LineMapInfo line="75" column="3" position="Net:3, Ln:6, Col:31" />
                <LineMapInfo line="76" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="77" column="5" position="Net:3, Ln:7, Col:5" />
                <LineMapInfo line="78" column="4" position="Net:3, Ln:7, Col:31" />
                <LineMapInfo line="79" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="80" column="5" position="Net:3, Ln:8, Col:5" />
                <LineMapInfo line="81" column="4" position="Net:3, Ln:8, Col:31" />
                <LineMapInfo line="82" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="83" column="5" position="Net:3, Ln:9, Col:5" />
                <LineMapInfo line="84" column="3" position="Net:3, Ln:9, Col:31" />
                <LineMapInfo line="85" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="86" column="5" position="Net:3, Ln:10, Col:5" />
                <LineMapInfo line="87" column="4" position="Net:3, Ln:10, Col:29" />
                <LineMapInfo line="88" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="89" column="5" position="Net:3, Ln:11, Col:5" />
                <LineMapInfo line="90" column="4" position="Net:3, Ln:11, Col:29" />
                <LineMapInfo line="91" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="92" column="5" position="Net:3, Ln:12, Col:5" />
                <LineMapInfo line="93" column="4" position="Net:3, Ln:12, Col:29" />
                <LineMapInfo line="95" column="1" position="Net:4" />
                <LineMapInfo line="96" column="1" position="Net:4" />
                <LineMapInfo line="97" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="99" column="5" position="Net:4, Ln:1, Col:6" />
                <LineMapInfo line="100" column="3" position="Net:4, Ln:1, Col:32" />
                <LineMapInfo line="101" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="102" column="6" position="Net:4, Ln:2, Col:6" />
                <LineMapInfo line="103" column="3" position="Net:4, Ln:2, Col:32" />
                <LineMapInfo line="105" column="1" position="Net:5" />
                <LineMapInfo line="106" column="1" position="Net:5" />
                <LineMapInfo line="107" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="109" column="4" position="Net:5, Ln:1, Col:31" />
                <LineMapInfo line="110" column="4" position="Net:5, Ln:2, Col:31" />
                <LineMapInfo line="111" column="4" position="Net:5, Ln:3, Col:32" />
                <LineMapInfo line="112" column="3" position="Net:5, Ln:4, Col:31" />
                <LineMapInfo line="114" column="1" position="Net:6" />
                <LineMapInfo line="115" column="1" position="Net:6" />
                <LineMapInfo line="116" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="117" column="4" position="Net:6, Ln:1, Col:31" />
                <LineMapInfo line="119" column="1" position="Net:7" />
                <LineMapInfo line="120" column="1" position="Net:7" />
                <LineMapInfo line="121" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="123" column="4" position="Net:7, Ln:1, Col:27 [Block input EN]" />
                <LineMapInfo line="125" column="10" position="Net:7, Ln:1, Col:27" />
                <LineMapInfo line="126" column="4" position="Net:7, Ln:2, Col:33" />
                <LineMapInfo line="128" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="129" column="4" position="Net:7, Ln:3, Col:28 [Block input EN]" />
                <LineMapInfo line="131" column="10" position="Net:7, Ln:3, Col:28" />
                <LineMapInfo line="132" column="4" position="Net:7, Ln:4, Col:32" />
                <LineMapInfo line="134" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="135" column="4" position="Net:7, Ln:5, Col:27 [Block input EN]" />
                <LineMapInfo line="137" column="10" position="Net:7, Ln:5, Col:27" />
                <LineMapInfo line="138" column="4" position="Net:7, Ln:6, Col:31" />
                <LineMapInfo line="141" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="4DA2B46B" />
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
                <RelPosition x="903" y="18" />
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
                <RelPosition x="903" y="56" />
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
                <RelPosition x="903" y="94" />
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
                <RelPosition x="903" y="132" />
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
                <RelPosition x="903" y="170" />
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
                <RelPosition x="1053" y="0" />
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
                <RelPosition x="903" y="18" />
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
                <RelPosition x="903" y="56" />
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
                <RelPosition x="933" y="94" />
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
                <RelPosition x="1053" y="0" />
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
              <LdObject xsi:type="Contact" operand="Manager.Cmd.JogFwd" edge="none">
                <RelPosition x="123" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.JogBkwd" edge="none">
                <RelPosition x="123" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Status.Stopped" edge="none">
                <RelPosition x="123" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveFrontSwitch" edge="none">
                <RelPosition x="123" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.MoveBackSwitch" edge="none">
                <RelPosition x="123" y="398" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Manager.Cmd.DoRetractStopper" edge="none">
                <RelPosition x="123" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Par.ProductAvailable" edge="none">
                <RelPosition x="273" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.Start" edge="none">
                <RelPosition x="273" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="453" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="453" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapDetect.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="453" y="114" />
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
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="180" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="15">
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
                <RelPosition x="633" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="none">
                <RelPosition x="843" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveFrontSwitch" edge="none" latch="none">
                <RelPosition x="843" y="360" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveBackSwitch" edge="none" latch="none">
                <RelPosition x="843" y="398" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="none">
                <RelPosition x="843" y="436" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveSwitch" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="873" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="903" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.JogFwd" edge="none" latch="none">
                <RelPosition x="903" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.JogBkwd" edge="none" latch="none">
                <RelPosition x="903" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.MoveFwd" edge="none" latch="reset">
                <RelPosition x="903" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="25">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1053" y="0" />
                <Size x="3" y="456" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="24" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="SetDoneStatus">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles setting the manager done status]]></Documentation>
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
                <RelPosition x="153" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Done" edge="none" latch="set">
                <RelPosition x="933" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Manager.Status.Done" edge="none" latch="reset">
                <RelPosition x="933" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1053" y="0" />
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
                <RelPosition x="903" y="18" />
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
                <RelPosition x="903" y="56" />
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
                <RelPosition x="903" y="132" />
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
                <RelPosition x="933" y="94" />
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
                <RelPosition x="1053" y="0" />
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
            <Rung evaluationOrder="6" label="LaneTooFullState">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles the case when a lane is too full of caps]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapArmCtrl.Status.CapIsSorted" edge="none">
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
              <LdObject xsi:type="Coil" operand="Manager.Status.TooFull" edge="none" latch="none">
                <RelPosition x="903" y="18" />
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
                <RelPosition x="1053" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[Connects internal Manager variable to global SortingManager variable]]></Documentation>
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gSortingManager.Cmd]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="783" y="0" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="783" y="152" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Manager.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="813" y="76" />
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
              <FbdObject xsi:type="DataSink" identifier="gSortingManager.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="903" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gSortingManager.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="933" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Manager.Cmd">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="963" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1053" y="0" />
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
                  <Connection refConnectionPointOutId="7" />
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
              </LdObject>
            </Rung>
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>