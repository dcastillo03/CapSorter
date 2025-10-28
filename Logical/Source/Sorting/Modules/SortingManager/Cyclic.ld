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
	zz$$$$_0_Manager_Status_TooFull_ : BOOL;
	zz$$$$_1_gCapDetect_Status_Error : BOOL;
	zz$$$$_2_gMoveCap_Cmd_Start_AndR : BOOL;
	zz$$$$_3_gCapDetect_Par_ProductA : BOOL;
	zz$$$$_4_gCapDetect_Status_Done_ : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_r_trig_gMoveCap_Cmd_Sta : r_trig;
	zz$$$$_7_Manager_Status_Active_A : BOOL;
	zz$$$$_8_Manager_Cmd_Stop_AndRes : BOOL;
END_VAR


{NetworkNumber := 1}
EnableSequence:
LD	Manager.Cmd.Start {CheckDataType := BOOL}
ANDN	Manager.Cmd.Stop {CheckDataType := BOOL}
ANDN	Manager.Status.TooFull {CheckDataType := BOOL}
ST	zz$$$$_0_Manager_Status_TooFull_
ST	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.Enable {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Enable {CheckDataType := BOOL}
ST	Manager.Status.Active {CheckDataType := BOOL}
R	Manager.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 2}
StartSequence:
LD	gCapArmCtrl.Status.Active {CheckDataType := BOOL}
AND	gCapDetect.Status.Active {CheckDataType := BOOL}
AND	gMoveCap.Status.Active {CheckDataType := BOOL}
ANDN	gMoveCap.Status.Error {CheckDataType := BOOL}
ANDN	gCapArmCtrl.Status.Error {CheckDataType := BOOL}
ANDN	gCapDetect.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_1_gCapDetect_Status_Error
ST	gCapArmCtrl.Cmd.Start {CheckDataType := BOOL}
ST	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Start {CheckDataType := BOOL}

{NetworkNumber := 3}
EntryStationLogic:
LD	gMoveCap.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_2_gMoveCap_Cmd_Start_AndR
AND	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_3_gCapDetect_Par_ProductA
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
ST	zz$$$$_4_gCapDetect_Status_Done_
ST	gCapArmCtrl.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_3_gCapDetect_Par_ProductA
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	gCapDetect.Par.CapColor
ST	gCapArmCtrl.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_3_gCapDetect_Par_ProductA
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
OR	zz$$$$_5_Eno_ComputeBlock
ST	gCapArmCtrl.Par.ProductAvailable {CheckDataType := BOOL}
LD	gMoveCap.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_6_r_trig_gMoveCap_Cmd_Sta.CLK
CAL	zz$$$$_6_r_trig_gMoveCap_Cmd_Sta
LD	zz$$$$_2_gMoveCap_Cmd_Start_AndR
AND	zz$$$$_6_r_trig_gMoveCap_Cmd_Sta.Q
S	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}

{NetworkNumber := 4}
SetDoneStatus:
LD	Manager.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_7_Manager_Status_Active_A
AND	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
S	Manager.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_7_Manager_Status_Active_A
ANDN	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
R	Manager.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 5}
ManagerStoppingState:
LD	Manager.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_8_Manager_Cmd_Stop_AndRes
ST	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.Stop {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Stop {CheckDataType := BOOL}
S	Manager.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 6}
LaneTooFullState:
LD	gCapArmCtrl.Status.CapIsSorted {CheckDataType := BOOL}
ST	Manager.Status.TooFull {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="16" column="1" position="Net:1" />
                <LineMapInfo line="17" column="1" position="Net:1" />
                <LineMapInfo line="18" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="19" column="6" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="20" column="6" position="Net:1, Ln:1, Col:9" />
                <LineMapInfo line="22" column="4" position="Net:1, Ln:1, Col:31" />
                <LineMapInfo line="23" column="4" position="Net:1, Ln:2, Col:31" />
                <LineMapInfo line="24" column="4" position="Net:1, Ln:3, Col:31" />
                <LineMapInfo line="25" column="4" position="Net:1, Ln:4, Col:31" />
                <LineMapInfo line="26" column="3" position="Net:1, Ln:5, Col:31" />
                <LineMapInfo line="28" column="1" position="Net:2" />
                <LineMapInfo line="29" column="1" position="Net:2" />
                <LineMapInfo line="30" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="31" column="5" position="Net:2, Ln:1, Col:6" />
                <LineMapInfo line="32" column="5" position="Net:2, Ln:1, Col:11" />
                <LineMapInfo line="33" column="6" position="Net:2, Ln:1, Col:16" />
                <LineMapInfo line="34" column="6" position="Net:2, Ln:1, Col:21" />
                <LineMapInfo line="35" column="6" position="Net:2, Ln:1, Col:26" />
                <LineMapInfo line="37" column="4" position="Net:2, Ln:1, Col:31" />
                <LineMapInfo line="38" column="4" position="Net:2, Ln:2, Col:31" />
                <LineMapInfo line="39" column="4" position="Net:2, Ln:3, Col:32" />
                <LineMapInfo line="41" column="1" position="Net:3" />
                <LineMapInfo line="42" column="1" position="Net:3" />
                <LineMapInfo line="43" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="45" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="47" column="5" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:1, Col:30" />
                <LineMapInfo line="50" column="4" position="Net:3, Ln:2, Col:29" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="52" column="4" position="Net:3, Ln:4, Col:11 [Block input EN]" />
                <LineMapInfo line="54" column="10" position="Net:3, Ln:4, Col:11" />
                <LineMapInfo line="55" column="4" position="Net:3, Ln:5, Col:17" />
                <LineMapInfo line="57" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="58" column="5" position="Net:3, Ln:3, Col:11" />
                <LineMapInfo line="59" column="4" position="Net:3, Ln:4, Col:11 [Block output ENO]" />
                <LineMapInfo line="60" column="4" position="Net:3, Ln:3, Col:30" />
                <LineMapInfo line="61" column="4" position="Net:3, Ln:6, Col:5" />
                <LineMapInfo line="62" column="4" position="Net:3, Ln:6, Col:5" />
                <LineMapInfo line="63" column="5" position="Net:3, Ln:6, Col:5" />
                <LineMapInfo line="64" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="65" column="5" position="Net:3, Ln:6, Col:5" />
                <LineMapInfo line="66" column="3" position="Net:3, Ln:6, Col:31" />
                <LineMapInfo line="68" column="1" position="Net:4" />
                <LineMapInfo line="69" column="1" position="Net:4" />
                <LineMapInfo line="70" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="72" column="5" position="Net:4, Ln:1, Col:6" />
                <LineMapInfo line="73" column="3" position="Net:4, Ln:1, Col:32" />
                <LineMapInfo line="74" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="75" column="6" position="Net:4, Ln:2, Col:6" />
                <LineMapInfo line="76" column="3" position="Net:4, Ln:2, Col:32" />
                <LineMapInfo line="78" column="1" position="Net:5" />
                <LineMapInfo line="79" column="1" position="Net:5" />
                <LineMapInfo line="80" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="82" column="4" position="Net:5, Ln:1, Col:31" />
                <LineMapInfo line="83" column="4" position="Net:5, Ln:2, Col:31" />
                <LineMapInfo line="84" column="4" position="Net:5, Ln:3, Col:32" />
                <LineMapInfo line="85" column="3" position="Net:5, Ln:4, Col:31" />
                <LineMapInfo line="87" column="1" position="Net:6" />
                <LineMapInfo line="88" column="1" position="Net:6" />
                <LineMapInfo line="89" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="90" column="4" position="Net:6, Ln:1, Col:31" />
                <LineMapInfo line="92" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="1783EFDE" />
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
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Enable" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Enable" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Enable" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="Manager.Status.Active" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="Manager.Status.Stopped" edge="none" latch="reset">
                <RelPosition x="903" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Par.ProductAvailable" edge="none">
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
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.Start" edge="rising">
                <RelPosition x="123" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="303" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
                <RelPosition x="303" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gCapDetect.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="303" y="114" />
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
              <FbdObject xsi:type="DataSink" identifier="gCapArmCtrl.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="483" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="none">
                <RelPosition x="843" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveSwitch" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="873" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.MoveFwd" edge="none" latch="set">
                <RelPosition x="903" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1053" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="9" />
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
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="SetDoneStatus">
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
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>