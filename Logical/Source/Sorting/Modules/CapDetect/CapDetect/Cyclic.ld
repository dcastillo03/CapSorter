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
 * Description: This task handles cap detection, not identification, at the entry
    point of the sorting station.
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
	zz$$$$_1_Internal_Cmd_Stop_AndRe : BOOL;
	zz$$$$_2_IO_Inputs_diProductAvai : BOOL;
	zz$$$$_3_Eno_ComputeBlock : BOOL;
	zz$$$$_4_Internal_Par_ProductAva : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_Eno_ComputeBlock : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_Internal_Status_Active_ : BOOL;
	zz$$$$_9_gCapDetect_Cmd_Enable_A : BOOL;
END_VAR


{NetworkNumber := 1}
EnableState:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_0_Internal_Status_ModuleO
ST	Internal.Status.Active {CheckDataType := BOOL}
JMPC	SensingState

{NetworkNumber := 2}
SensingState:
LD	Internal.Cmd.Start {CheckDataType := BOOL}
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_1_Internal_Cmd_Stop_AndRe
AND	IO.Inputs.diProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_2_IO_Inputs_diProductAvai
ST	Internal.Par.ProductAvailable {CheckDataType := BOOL}
JMPC	IdentifyState
LDN	zz$$$$_1_Internal_Cmd_Stop_AndRe
ST	Internal.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 3}
IdentifyState:
LD	TRUE
ST	zz$$$$_3_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	cdCAP_NONE
ST	gCapDetect.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_3_Eno_ComputeBlock
ANDN	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_4_Internal_Par_ProductAva
AND	IO.Inputs.diMetalCap {CheckDataType := BOOL}
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	cdCAP_METAL
ST	gCapDetect.Par.CapColor
ll$$$$_IF_1:
LD	zz$$$$_5_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_4_Internal_Par_ProductAva
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_6_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	cdCAP_RED
ST	gCapDetect.Par.CapColor
ll$$$$_IF_2:
LD	zz$$$$_6_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_4_Internal_Par_ProductAva
ANDN	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	cdCAP_BLACK
ST	gCapDetect.Par.CapColor
ll$$$$_IF_3:
LD	zz$$$$_7_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 4}
InternalToGlobal:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_8_Internal_Status_Active_
AND	Internal.Status.Done {CheckDataType := BOOL}
ST	gCapDetect.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_Active_
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_Active_
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	gCapDetect.Status.ModuleOk {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_Active_
AND	Internal.Status.Error {CheckDataType := BOOL}
ST	gCapDetect.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_Active_
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ST	gCapDetect.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_Active_
ST	gCapDetect.Status.Active {CheckDataType := BOOL}

{NetworkNumber := 5}
GlobalToInternal:
LD	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_9_gCapDetect_Cmd_Enable_A
ST	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	gCapDetect.Cmd.ErrorReset {CheckDataType := BOOL}
ST	Internal.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_9_gCapDetect_Cmd_Enable_A
AND	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	Internal.Cmd.Start {CheckDataType := BOOL}
LD	zz$$$$_9_gCapDetect_Cmd_Enable_A
AND	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	Internal.Cmd.Stop {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="17" column="1" position="Net:1" />
                <LineMapInfo line="18" column="1" position="Net:1" />
                <LineMapInfo line="19" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="20" column="5" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="22" column="4" position="Net:1, Ln:1, Col:35" />
                <LineMapInfo line="23" column="6" position="Net:1, Ln:2, Col:36" />
                <LineMapInfo line="25" column="1" position="Net:2" />
                <LineMapInfo line="26" column="1" position="Net:2" />
                <LineMapInfo line="27" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="28" column="6" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="30" column="5" position="Net:2, Ln:1, Col:9" />
                <LineMapInfo line="32" column="4" position="Net:2, Ln:1, Col:33" />
                <LineMapInfo line="33" column="6" position="Net:2, Ln:2, Col:36" />
                <LineMapInfo line="34" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="35" column="4" position="Net:2, Ln:3, Col:34" />
                <LineMapInfo line="37" column="1" position="Net:3" />
                <LineMapInfo line="38" column="1" position="Net:3" />
                <LineMapInfo line="39" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="40" column="4" position="Net:3, Ln:1, Col:2 [Block input EN]" />
                <LineMapInfo line="42" column="10" position="Net:3, Ln:1, Col:2" />
                <LineMapInfo line="43" column="4" position="Net:3, Ln:2, Col:6" />
                <LineMapInfo line="45" column="4" position="Net:3, Ln:1, Col:2 [Block output ENO]" />
                <LineMapInfo line="46" column="6" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="48" column="5" position="Net:3, Ln:1, Col:17" />
                <LineMapInfo line="49" column="5" position="Net:3, Ln:1, Col:21" />
                <LineMapInfo line="50" column="4" position="Net:3, Ln:1, Col:26 [Block input EN]" />
                <LineMapInfo line="52" column="10" position="Net:3, Ln:1, Col:26" />
                <LineMapInfo line="53" column="4" position="Net:3, Ln:2, Col:30" />
                <LineMapInfo line="55" column="4" position="Net:3, Ln:1, Col:26 [Block output ENO]" />
                <LineMapInfo line="56" column="4" position="Net:3, Ln:1, Col:35" />
                <LineMapInfo line="57" column="4" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="58" column="5" position="Net:3, Ln:3, Col:17" />
                <LineMapInfo line="59" column="6" position="Net:3, Ln:3, Col:22" />
                <LineMapInfo line="60" column="4" position="Net:3, Ln:3, Col:26 [Block input EN]" />
                <LineMapInfo line="62" column="10" position="Net:3, Ln:3, Col:26" />
                <LineMapInfo line="63" column="4" position="Net:3, Ln:4, Col:30" />
                <LineMapInfo line="65" column="4" position="Net:3, Ln:3, Col:26 [Block output ENO]" />
                <LineMapInfo line="66" column="4" position="Net:3, Ln:3, Col:35" />
                <LineMapInfo line="67" column="4" position="Net:3, Ln:1, Col:11" />
                <LineMapInfo line="68" column="6" position="Net:3, Ln:5, Col:17" />
                <LineMapInfo line="69" column="6" position="Net:3, Ln:5, Col:22" />
                <LineMapInfo line="70" column="4" position="Net:3, Ln:5, Col:26 [Block input EN]" />
                <LineMapInfo line="72" column="10" position="Net:3, Ln:5, Col:26" />
                <LineMapInfo line="73" column="4" position="Net:3, Ln:6, Col:30" />
                <LineMapInfo line="75" column="4" position="Net:3, Ln:5, Col:26 [Block output ENO]" />
                <LineMapInfo line="76" column="4" position="Net:3, Ln:5, Col:35" />
                <LineMapInfo line="78" column="1" position="Net:4" />
                <LineMapInfo line="79" column="1" position="Net:4" />
                <LineMapInfo line="80" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="82" column="5" position="Net:4, Ln:1, Col:5" />
                <LineMapInfo line="83" column="4" position="Net:4, Ln:1, Col:34" />
                <LineMapInfo line="84" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="85" column="5" position="Net:4, Ln:2, Col:5" />
                <LineMapInfo line="86" column="4" position="Net:4, Ln:2, Col:33" />
                <LineMapInfo line="87" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="88" column="5" position="Net:4, Ln:3, Col:5" />
                <LineMapInfo line="89" column="4" position="Net:4, Ln:3, Col:33" />
                <LineMapInfo line="90" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="91" column="5" position="Net:4, Ln:4, Col:5" />
                <LineMapInfo line="92" column="4" position="Net:4, Ln:4, Col:34" />
                <LineMapInfo line="93" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="94" column="5" position="Net:4, Ln:5, Col:5" />
                <LineMapInfo line="95" column="4" position="Net:4, Ln:5, Col:34" />
                <LineMapInfo line="96" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="97" column="4" position="Net:4, Ln:6, Col:34" />
                <LineMapInfo line="99" column="1" position="Net:5" />
                <LineMapInfo line="100" column="1" position="Net:5" />
                <LineMapInfo line="101" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="103" column="4" position="Net:5, Ln:1, Col:35" />
                <LineMapInfo line="104" column="5" position="Net:5, Ln:2, Col:6" />
                <LineMapInfo line="105" column="4" position="Net:5, Ln:2, Col:34" />
                <LineMapInfo line="106" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="107" column="5" position="Net:5, Ln:3, Col:6" />
                <LineMapInfo line="108" column="4" position="Net:5, Ln:3, Col:35" />
                <LineMapInfo line="109" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="110" column="5" position="Net:5, Ln:4, Col:6" />
                <LineMapInfo line="111" column="4" position="Net:5, Ln:4, Col:35" />
                <LineMapInfo line="113" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="5BF09C2D" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="EnableState">
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
                <RelPosition x="1023" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="SensingState">
                <RelPosition x="1053" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
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
            <Rung evaluationOrder="2" label="SensingState">
              <Documentation xsi:type="SimpleText"><![CDATA[For cap detection]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Inputs.diProductAvailable" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Par.ProductAvailable" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Stopped" negated="true" edge="none" latch="none">
                <RelPosition x="993" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="IdentifyState">
                <RelPosition x="1053" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="IdentifyState">
              <Documentation xsi:type="SimpleText"><![CDATA[For cap detection]]></Documentation>
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cdCAP_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="33" y="0" />
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
                      <Connection refConnectionPointOutId="1" />
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
                    <ConnectionPointOut connectionPointOutId="2">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="153" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" negated="true" edge="none">
                <RelPosition x="303" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" edge="none">
                <RelPosition x="483" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" edge="none">
                <RelPosition x="483" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" negated="true" edge="none">
                <RelPosition x="483" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" edge="none">
                <RelPosition x="603" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="633" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="633" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cdCAP_METAL]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="753" y="0" />
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
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="12">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cdCAP_RED]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="753" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="13">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[cdCAP_BLACK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="753" y="152" />
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
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="873" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="873" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="873" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="none">
                <RelPosition x="1023" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="none">
                <RelPosition x="1023" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="none">
                <RelPosition x="1023" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1143" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="InternalToGlobal">
              <Documentation xsi:type="SimpleText"><![CDATA[Assigns internal to global]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Done" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" edge="none">
                <RelPosition x="123" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
                <RelPosition x="123" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
                <RelPosition x="123" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="963" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.ModuleOk" edge="none" latch="none">
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
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Done" edge="none" latch="none">
                <RelPosition x="993" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Error" edge="none" latch="none">
                <RelPosition x="993" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Stopped" edge="none" latch="none">
                <RelPosition x="993" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Active" edge="none" latch="none">
                <RelPosition x="993" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
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
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="GlobalToInternal">
              <Documentation xsi:type="SimpleText"><![CDATA[Assigns global commands to internal commands]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.ErrorReset" edge="none">
                <RelPosition x="153" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.Start" edge="none">
                <RelPosition x="153" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.Stop" edge="none">
                <RelPosition x="153" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.ErrorReset" edge="none" latch="none">
                <RelPosition x="993" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="1023" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Start" edge="none" latch="none">
                <RelPosition x="1023" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Stop" edge="none" latch="none">
                <RelPosition x="1023" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
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
                  <Connection refConnectionPointOutId="6" />
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
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>