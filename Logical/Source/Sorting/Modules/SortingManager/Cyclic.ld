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
	zz$$$$_1_gMoveCap_Status_Active_ : BOOL;
	zz$$$$_2_gCapDetect_Par_ProductA : BOOL;
	zz$$$$_3_gCapDetect_Status_Done_ : BOOL;
END_VAR


{NetworkNumber := 1}
EnableSequence:
LD	Manager.Cmd.Start {CheckDataType := BOOL}
ST	zz$$$$_0_Manager_Cmd_Start_AndRe
S	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_0_Manager_Cmd_Start_AndRe
S	gCapArmCtrl.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_0_Manager_Cmd_Start_AndRe
S	gMoveCap.Cmd.Enable {CheckDataType := BOOL}

{NetworkNumber := 2}
StartSequence:
LD	gCapArmCtrl.Status.Active {CheckDataType := BOOL}
AND	gCapDetect.Status.Active {CheckDataType := BOOL}
AND	gMoveCap.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_1_gMoveCap_Status_Active_
ST	gCapArmCtrl.Cmd.Start {CheckDataType := BOOL}
ST	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	gMoveCap.Cmd.Start {CheckDataType := BOOL}

{NetworkNumber := 3}
EntryStationLogic:
LD	gMoveCap.Cmd.MoveFwd {CheckDataType := BOOL}
AND	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_2_gCapDetect_Par_ProductA
AND	gCapDetect.Status.Done {CheckDataType := BOOL}
ST	zz$$$$_3_gCapDetect_Status_Done_
ST	gCapArmCtrl.Cmd.MoveSwitch {CheckDataType := BOOL}
ST	gCapArmCtrl.Cmd.DoRetractStopper {CheckDataType := BOOL}
LD	zz$$$$_2_gCapDetect_Par_ProductA
ST	gCapArmCtrl.Par.ProductAvailable {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="11" column="1" position="Net:1" />
                <LineMapInfo line="12" column="1" position="Net:1" />
                <LineMapInfo line="13" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="15" column="3" position="Net:1, Ln:1, Col:19" />
                <LineMapInfo line="16" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="17" column="3" position="Net:1, Ln:2, Col:19" />
                <LineMapInfo line="18" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="19" column="3" position="Net:1, Ln:3, Col:19" />
                <LineMapInfo line="21" column="1" position="Net:2" />
                <LineMapInfo line="22" column="1" position="Net:2" />
                <LineMapInfo line="23" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="24" column="5" position="Net:2, Ln:1, Col:6" />
                <LineMapInfo line="25" column="5" position="Net:2, Ln:1, Col:11" />
                <LineMapInfo line="27" column="4" position="Net:2, Ln:1, Col:19" />
                <LineMapInfo line="28" column="4" position="Net:2, Ln:2, Col:19" />
                <LineMapInfo line="29" column="4" position="Net:2, Ln:3, Col:20" />
                <LineMapInfo line="31" column="1" position="Net:3" />
                <LineMapInfo line="32" column="1" position="Net:3" />
                <LineMapInfo line="33" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="34" column="5" position="Net:3, Ln:1, Col:6" />
                <LineMapInfo line="36" column="5" position="Net:3, Ln:1, Col:12" />
                <LineMapInfo line="38" column="4" position="Net:3, Ln:1, Col:18" />
                <LineMapInfo line="39" column="4" position="Net:3, Ln:2, Col:17" />
                <LineMapInfo line="40" column="4" position="Net:3, Ln:1, Col:6" />
                <LineMapInfo line="41" column="4" position="Net:3, Ln:3, Col:18" />
                <LineMapInfo line="43" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="805E4031" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="EnableSequence">
              <Documentation xsi:type="SimpleText"><![CDATA[Enables all subtasks]]></Documentation>
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
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="543" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="543" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Enable" edge="none" latch="set">
                <RelPosition x="543" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="693" y="0" />
                <Size x="3" y="114" />
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
                  <Connection refConnectionPointOutId="5" />
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
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.Start" edge="none" latch="none">
                <RelPosition x="543" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Cmd.Start" edge="none" latch="none">
                <RelPosition x="543" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gMoveCap.Cmd.Start" edge="none" latch="none">
                <RelPosition x="573" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="693" y="0" />
                <Size x="3" y="114" />
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
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="EntryStationLogic">
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
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.MoveFwd" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Par.ProductAvailable" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.Done" edge="none">
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
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.DoRetractStopper" edge="none" latch="none">
                <RelPosition x="483" y="56" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Cmd.MoveSwitch" edge="none" latch="none">
                <RelPosition x="513" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapArmCtrl.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="513" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="693" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="7" />
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