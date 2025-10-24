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
	zz$$$$_2_Eno_ComputeBlock : BOOL;
	zz$$$$_3_Internal_Par_ProductAva : BOOL;
	zz$$$$_4_Eno_ComputeBlock : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_Eno_ComputeBlock : BOOL;
	zz$$$$_7_Internal_Status_Active_ : BOOL;
	zz$$$$_8_Internal_Status_ModuleO : BOOL;
	zz$$$$_9_Eno_ComputeBlock : BOOL;
	zz$$$$_10_Internal_Status_Module : BOOL;
	zz$$$$_11_Eno_ComputeBlock : BOOL;
	zz$$$$_12_Internal_Status_Active : BOOL;
	zz$$$$_13_Eno_ComputeBlock : BOOL;
	zz$$$$_14_Eno_ComputeBlock : BOOL;
	zz$$$$_15_gCapDetect_Cmd_Enable_ : BOOL;
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
JMPC	IdentifyState
LDN	zz$$$$_1_Internal_Cmd_Stop_AndRe
ST	Internal.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 3}
IdentifyState:
LD	TRUE
ST	zz$$$$_2_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	cdCAP_NONE
ST	Internal.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_2_Eno_ComputeBlock
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_3_Internal_Par_ProductAva
AND	IO.Inputs.diMetalCap {CheckDataType := BOOL}
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ST	zz$$$$_4_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	cdCAP_METAL
ST	Internal.Par.CapColor
ll$$$$_IF_1:
LD	zz$$$$_4_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Par_ProductAva
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	cdCAP_RED
ST	Internal.Par.CapColor
ll$$$$_IF_2:
LD	zz$$$$_5_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Par_ProductAva
ANDN	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_6_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	cdCAP_BLACK
ST	Internal.Par.CapColor
ll$$$$_IF_3:
LD	zz$$$$_6_Eno_ComputeBlock
ST	Internal.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 4}
ModuleOkCheck:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_7_Internal_Status_Active_
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_8_Internal_Status_ModuleO
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_8_Internal_Status_ModuleO
ST	zz$$$$_9_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	cdERROR_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_4:
LD	zz$$$$_7_Internal_Status_Active_
ANDN	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_10_Internal_Status_Module
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_10_Internal_Status_Module
ST	zz$$$$_11_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	cdERROR_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_5:

{NetworkNumber := 5}
InternalToGlobal:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_12_Internal_Status_Active
ST	zz$$$$_13_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Status.ErrorID
ST	gCapDetect.Status.ErrorID
ll$$$$_IF_6:
LD	zz$$$$_12_Internal_Status_Active
ST	zz$$$$_14_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	Internal.Par.CapColor
ST	gCapDetect.Par.CapColor
ll$$$$_IF_7:
LD	zz$$$$_12_Internal_Status_Active
AND	Internal.Status.Done {CheckDataType := BOOL}
ST	gCapDetect.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_12_Internal_Status_Active
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_12_Internal_Status_Active
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	gCapDetect.Status.ModuleOk {CheckDataType := BOOL}
LD	zz$$$$_12_Internal_Status_Active
AND	Internal.Status.Error {CheckDataType := BOOL}
ST	gCapDetect.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_12_Internal_Status_Active
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ST	gCapDetect.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_12_Internal_Status_Active
ST	gCapDetect.Status.Active {CheckDataType := BOOL}

{NetworkNumber := 6}
GlobalToInternal:
LD	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_15_gCapDetect_Cmd_Enable_
ST	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	gCapDetect.Cmd.ErrorReset {CheckDataType := BOOL}
ST	Internal.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_15_gCapDetect_Cmd_Enable_
AND	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	Internal.Cmd.Start {CheckDataType := BOOL}
LD	zz$$$$_15_gCapDetect_Cmd_Enable_
AND	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	Internal.Cmd.Stop {CheckDataType := BOOL}

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="23" column="1" position="Net:1" />
                <LineMapInfo line="24" column="1" position="Net:1" />
                <LineMapInfo line="25" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="26" column="5" position="Net:1, Ln:1, Col:5" />
                <LineMapInfo line="28" column="4" position="Net:1, Ln:1, Col:33" />
                <LineMapInfo line="29" column="6" position="Net:1, Ln:2, Col:34" />
                <LineMapInfo line="31" column="1" position="Net:2" />
                <LineMapInfo line="32" column="1" position="Net:2" />
                <LineMapInfo line="33" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="34" column="6" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="36" column="5" position="Net:2, Ln:1, Col:9" />
                <LineMapInfo line="37" column="6" position="Net:2, Ln:1, Col:34" />
                <LineMapInfo line="38" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="39" column="4" position="Net:2, Ln:2, Col:32" />
                <LineMapInfo line="41" column="1" position="Net:3" />
                <LineMapInfo line="42" column="1" position="Net:3" />
                <LineMapInfo line="43" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="44" column="4" position="Net:3, Ln:1, Col:2 [Block input EN]" />
                <LineMapInfo line="46" column="10" position="Net:3, Ln:1, Col:2" />
                <LineMapInfo line="47" column="4" position="Net:3, Ln:2, Col:6" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:1, Col:2 [Block output ENO]" />
                <LineMapInfo line="50" column="5" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="52" column="5" position="Net:3, Ln:1, Col:16" />
                <LineMapInfo line="53" column="5" position="Net:3, Ln:1, Col:20" />
                <LineMapInfo line="54" column="4" position="Net:3, Ln:1, Col:25 [Block input EN]" />
                <LineMapInfo line="56" column="10" position="Net:3, Ln:1, Col:25" />
                <LineMapInfo line="57" column="4" position="Net:3, Ln:2, Col:29" />
                <LineMapInfo line="59" column="4" position="Net:3, Ln:1, Col:25 [Block output ENO]" />
                <LineMapInfo line="60" column="4" position="Net:3, Ln:1, Col:33" />
                <LineMapInfo line="61" column="4" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="62" column="5" position="Net:3, Ln:3, Col:16" />
                <LineMapInfo line="63" column="6" position="Net:3, Ln:3, Col:21" />
                <LineMapInfo line="64" column="4" position="Net:3, Ln:3, Col:25 [Block input EN]" />
                <LineMapInfo line="66" column="10" position="Net:3, Ln:3, Col:25" />
                <LineMapInfo line="67" column="4" position="Net:3, Ln:4, Col:29" />
                <LineMapInfo line="69" column="4" position="Net:3, Ln:3, Col:25 [Block output ENO]" />
                <LineMapInfo line="70" column="4" position="Net:3, Ln:3, Col:33" />
                <LineMapInfo line="71" column="4" position="Net:3, Ln:1, Col:10" />
                <LineMapInfo line="72" column="6" position="Net:3, Ln:5, Col:16" />
                <LineMapInfo line="73" column="6" position="Net:3, Ln:5, Col:21" />
                <LineMapInfo line="74" column="4" position="Net:3, Ln:5, Col:25 [Block input EN]" />
                <LineMapInfo line="76" column="10" position="Net:3, Ln:5, Col:25" />
                <LineMapInfo line="77" column="4" position="Net:3, Ln:6, Col:29" />
                <LineMapInfo line="79" column="4" position="Net:3, Ln:5, Col:25 [Block output ENO]" />
                <LineMapInfo line="80" column="4" position="Net:3, Ln:5, Col:33" />
                <LineMapInfo line="82" column="1" position="Net:4" />
                <LineMapInfo line="83" column="1" position="Net:4" />
                <LineMapInfo line="84" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="86" column="5" position="Net:4, Ln:1, Col:5" />
                <LineMapInfo line="88" column="3" position="Net:4, Ln:1, Col:33" />
                <LineMapInfo line="89" column="4" position="Net:4, Ln:1, Col:5" />
                <LineMapInfo line="90" column="4" position="Net:4, Ln:2, Col:28 [Block input EN]" />
                <LineMapInfo line="92" column="10" position="Net:4, Ln:2, Col:28" />
                <LineMapInfo line="93" column="4" position="Net:4, Ln:3, Col:33" />
                <LineMapInfo line="95" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="96" column="6" position="Net:4, Ln:4, Col:5" />
                <LineMapInfo line="98" column="3" position="Net:4, Ln:4, Col:33" />
                <LineMapInfo line="99" column="4" position="Net:4, Ln:4, Col:5" />
                <LineMapInfo line="100" column="4" position="Net:4, Ln:5, Col:26 [Block input EN]" />
                <LineMapInfo line="102" column="10" position="Net:4, Ln:5, Col:26" />
                <LineMapInfo line="103" column="4" position="Net:4, Ln:6, Col:33" />
                <LineMapInfo line="106" column="1" position="Net:5" />
                <LineMapInfo line="107" column="1" position="Net:5" />
                <LineMapInfo line="108" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="110" column="4" position="Net:5, Ln:1, Col:27 [Block input EN]" />
                <LineMapInfo line="112" column="10" position="Net:5, Ln:1, Col:27" />
                <LineMapInfo line="113" column="4" position="Net:5, Ln:2, Col:32" />
                <LineMapInfo line="115" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="116" column="4" position="Net:5, Ln:3, Col:27 [Block input EN]" />
                <LineMapInfo line="118" column="10" position="Net:5, Ln:3, Col:27" />
                <LineMapInfo line="119" column="4" position="Net:5, Ln:4, Col:32" />
                <LineMapInfo line="121" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="122" column="5" position="Net:5, Ln:5, Col:5" />
                <LineMapInfo line="123" column="4" position="Net:5, Ln:5, Col:32" />
                <LineMapInfo line="124" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="125" column="5" position="Net:5, Ln:6, Col:5" />
                <LineMapInfo line="126" column="4" position="Net:5, Ln:6, Col:31" />
                <LineMapInfo line="127" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="128" column="5" position="Net:5, Ln:7, Col:5" />
                <LineMapInfo line="129" column="4" position="Net:5, Ln:7, Col:31" />
                <LineMapInfo line="130" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="131" column="5" position="Net:5, Ln:8, Col:5" />
                <LineMapInfo line="132" column="4" position="Net:5, Ln:8, Col:32" />
                <LineMapInfo line="133" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="134" column="5" position="Net:5, Ln:9, Col:5" />
                <LineMapInfo line="135" column="4" position="Net:5, Ln:9, Col:32" />
                <LineMapInfo line="136" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="137" column="4" position="Net:5, Ln:10, Col:32" />
                <LineMapInfo line="139" column="1" position="Net:6" />
                <LineMapInfo line="140" column="1" position="Net:6" />
                <LineMapInfo line="141" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="143" column="4" position="Net:6, Ln:1, Col:33" />
                <LineMapInfo line="144" column="5" position="Net:6, Ln:2, Col:6" />
                <LineMapInfo line="145" column="4" position="Net:6, Ln:2, Col:32" />
                <LineMapInfo line="146" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="147" column="5" position="Net:6, Ln:3, Col:6" />
                <LineMapInfo line="148" column="4" position="Net:6, Ln:3, Col:33" />
                <LineMapInfo line="149" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="150" column="5" position="Net:6, Ln:4, Col:6" />
                <LineMapInfo line="151" column="4" position="Net:6, Ln:4, Col:33" />
                <LineMapInfo line="153" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="DE657755" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="993" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1083" y="0" />
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
                <Size x="3" y="76" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Stopped" negated="true" edge="none" latch="none">
                <RelPosition x="933" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="IdentifyState">
                <RelPosition x="993" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1083" y="0" />
                <Size x="3" y="76" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="IdentifyState">
              <Documentation xsi:type="SimpleText"><![CDATA[For cap identification]]></Documentation>
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="153" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" edge="none">
                <RelPosition x="273" y="18" />
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
                <RelPosition x="453" y="18" />
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
                <RelPosition x="453" y="94" />
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
                <RelPosition x="453" y="170" />
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
                <RelPosition x="573" y="18" />
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
                <RelPosition x="603" y="94" />
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
                <RelPosition x="603" y="170" />
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
                <RelPosition x="723" y="0" />
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
                <RelPosition x="723" y="76" />
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="843" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="843" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="843" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="none">
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="94" />
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
                <RelPosition x="963" y="170" />
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
                <RelPosition x="1083" y="0" />
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
            <Rung evaluationOrder="4" label="ModuleOkCheck">
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
                    <ComputeBlock><![CDATA[cdERROR_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="753" y="152" />
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
                    <ComputeBlock><![CDATA[cdERROR_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="813" y="38" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="963" y="132" />
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
                <RelPosition x="963" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1083" y="0" />
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
            <Rung evaluationOrder="5" label="InternalToGlobal">
              <Documentation xsi:type="SimpleText"><![CDATA[Assigns internal to global]]></Documentation>
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
                <RelPosition x="123" y="170" />
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
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
                <RelPosition x="123" y="284" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.ErrorID]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="783" y="0" />
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
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="9">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="783" y="76" />
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
                    <ConnectionPointOut connectionPointOutId="10">
                      <RelPosition x="150" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="11">
                      <RelPosition x="150" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="903" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.ModuleOk" edge="none" latch="none">
                <RelPosition x="903" y="246" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="933" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="933" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Done" edge="none" latch="none">
                <RelPosition x="933" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Error" edge="none" latch="none">
                <RelPosition x="933" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Stopped" edge="none" latch="none">
                <RelPosition x="933" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Active" edge="none" latch="none">
                <RelPosition x="933" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1083" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="10" />
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
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="GlobalToInternal">
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
                <RelPosition x="933" y="56" />
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
                <RelPosition x="963" y="18" />
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
                <RelPosition x="963" y="94" />
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
                <RelPosition x="963" y="132" />
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
                <RelPosition x="1083" y="0" />
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