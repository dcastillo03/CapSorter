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
 * Created:   October 24, 2025
 * Description: Distribution Bay control task
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
	zz$$$$_0_Internal_Status_Error_A : BOOL;
	zz$$$$_1_gBayInterface_Cmd_Error : BOOL;
	zz$$$$_2_Eno_ComputeBlock : BOOL;
	zz$$$$_3_Internal_Status_Error_A : BOOL;
	zz$$$$_4_Internal_Status_Active_ : BOOL;
	zz$$$$_5_IO_Input_InputModuleOK_ : BOOL;
	zz$$$$_6_Eno_ComputeBlock : BOOL;
	zz$$$$_7_IO_Input_OutputModuleOK : BOOL;
	zz$$$$_8_Eno_ComputeBlock : BOOL;
	zz$$$$_9_IO_Input_diMagazineEmpt : BOOL;
	zz$$$$_10_TON : TON;
	zz$$$$_11_Q_TON_ : ANY;
	zz$$$$_12_Eno_ComputeBlock : BOOL;
	zz$$$$_13_TON : TON;
	zz$$$$_14_Q_TON_ : ANY;
	zz$$$$_15_Eno_ComputeBlock : BOOL;
	zz$$$$_16_Internal_Status_Active : BOOL;
	zz$$$$_17_gBayInterface_Cmd_Enab : BOOL;
	zz$$$$_18_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
Enable:
LD	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
ANDN	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_0_Internal_Status_Error_A
ST	Internal.Status.Active {CheckDataType := BOOL}
JMPC	ModuleOKCheck

{NetworkNumber := 2}
EnableCheck:
LDN	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
RETC

{NetworkNumber := 3}
ErrorReset:
LD	Internal.Status.Error {CheckDataType := BOOL}
AND	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	zz$$$$_1_gBayInterface_Cmd_Error
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_1_gBayInterface_Cmd_Error
ST	zz$$$$_2_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	errorbayNONE
ST	Internal.Status.ErrorID
ll$$$$_IF_0:
LD	zz$$$$_1_gBayInterface_Cmd_Error
RETC

{NetworkNumber := 4}
Error:
LD	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_3_Internal_Status_Error_A
LDN	zz$$$$_3_Internal_Status_Error_A
ST	IO.Output.doEjectCap {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Status_Error_A
JMPC	Assignments

{NetworkNumber := 5}
ModuleOKCheck:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_4_Internal_Status_Active_
ANDN	IO.Input.InputModuleOK {CheckDataType := BOOL}
ST	zz$$$$_5_IO_Input_InputModuleOK_
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_5_IO_Input_InputModuleOK_
ST	zz$$$$_6_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	errorbayINPUT_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_1:
LD	zz$$$$_5_IO_Input_InputModuleOK_
RETC
LD	zz$$$$_4_Internal_Status_Active_
ANDN	IO.Input.OutputModuleOK {CheckDataType := BOOL}
ST	zz$$$$_7_IO_Input_OutputModuleOK
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_7_IO_Input_OutputModuleOK
ST	zz$$$$_8_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	errorbayOUTPUT_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_2:
LD	zz$$$$_7_IO_Input_OutputModuleOK
RETC

{NetworkNumber := 6}
Enabled:
LD	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
ANDN	IO.Input.diMagazineEmpty {CheckDataType := BOOL}
ST	zz$$$$_9_IO_Input_diMagazineEmpt
ST	IO.Output.doEjectCap {CheckDataType := BOOL}
ANDN	IO.Input.diEjectorExtended {CheckDataType := BOOL}
ST	zz$$$$_10_TON.IN
LD	TimeoutTime
ST	zz$$$$_10_TON.PT
CAL	zz$$$$_10_TON
LD	zz$$$$_10_TON.Q
ST	zz$$$$_11_Q_TON_
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_11_Q_TON_
ST	zz$$$$_12_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	errorbayEJECTOR_TIMEOUT
ST	Internal.Status.ErrorID
ll$$$$_IF_3:
LD	zz$$$$_11_Q_TON_
RETC

{NetworkNumber := 7}
RetractTimeout:
LDN	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
ANDN	IO.Input.diEjectorRetracted {CheckDataType := BOOL}
ST	zz$$$$_13_TON.IN
LD	TimeoutTime
ST	zz$$$$_13_TON.PT
CAL	zz$$$$_13_TON
LD	zz$$$$_13_TON.Q
ST	zz$$$$_14_Q_TON_
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_14_Q_TON_
ST	zz$$$$_15_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	errorbayEJECTOR_TIMEOUT
ST	Internal.Status.ErrorID
ll$$$$_IF_4:
LD	zz$$$$_14_Q_TON_
RETC

{NetworkNumber := 8}
IOReporting:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_16_Internal_Status_Active
AND	IO.Input.diEjectorExtended {CheckDataType := BOOL}
S	Internal.Status.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_16_Internal_Status_Active
AND	IO.Input.diEjectorRetracted {CheckDataType := BOOL}
R	Internal.Status.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_16_Internal_Status_Active
AND	IO.Input.diMagazineEmpty {CheckDataType := BOOL}
ST	Internal.Status.MagazineEmpty {CheckDataType := BOOL}

{NetworkNumber := 9}
Assignments:
LD	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_17_gBayInterface_Cmd_Enab
AND	gBayInterface.Cmd.Eject {CheckDataType := BOOL}
ST	Internal.Cmd.Eject {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	gBayInterface.Cmd.Enable {CheckDataType := BOOL}
ST	Internal.Cmd.Enable {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	gBayInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	Internal.Cmd.ErrorReset {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	Internal.Status.Active {CheckDataType := BOOL}
ST	gBayInterface.Status.Active {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	Internal.Status.CapEjected {CheckDataType := BOOL}
ST	gBayInterface.Status.CapEjected {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	Internal.Status.MagazineEmpty {CheckDataType := BOOL}
ST	gBayInterface.Status.MagazineEmpty {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
AND	Internal.Status.Error {CheckDataType := BOOL}
ST	gBayInterface.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_17_gBayInterface_Cmd_Enab
ST	zz$$$$_18_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	Internal.Status.ErrorID
ST	gBayInterface.Status.ErrorID
ll$$$$_IF_5:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="14" column="1" position="Net:6, Ln:2, Col:19" />
                <LineMapInfo line="17" column="1" position="Net:7, Ln:1, Col:14" />
                <LineMapInfo line="26" column="1" position="Net:1" />
                <LineMapInfo line="27" column="1" position="Net:1" />
                <LineMapInfo line="28" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="29" column="6" position="Net:1, Ln:1, Col:6" />
                <LineMapInfo line="31" column="4" position="Net:1, Ln:1, Col:30" />
                <LineMapInfo line="32" column="6" position="Net:1, Ln:2, Col:30" />
                <LineMapInfo line="34" column="1" position="Net:2" />
                <LineMapInfo line="35" column="1" position="Net:2" />
                <LineMapInfo line="36" column="5" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="39" column="1" position="Net:3" />
                <LineMapInfo line="40" column="1" position="Net:3" />
                <LineMapInfo line="41" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="42" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="44" column="3" position="Net:3, Ln:1, Col:30" />
                <LineMapInfo line="45" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="46" column="4" position="Net:3, Ln:2, Col:26 [Block input EN]" />
                <LineMapInfo line="48" column="10" position="Net:3, Ln:2, Col:26" />
                <LineMapInfo line="49" column="4" position="Net:3, Ln:3, Col:30" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="54" column="1" position="Net:4" />
                <LineMapInfo line="55" column="1" position="Net:4" />
                <LineMapInfo line="56" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="59" column="4" position="Net:4, Ln:1, Col:30" />
                <LineMapInfo line="60" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="61" column="6" position="Net:4, Ln:2, Col:31" />
                <LineMapInfo line="63" column="1" position="Net:5" />
                <LineMapInfo line="64" column="1" position="Net:5" />
                <LineMapInfo line="65" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="67" column="6" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="69" column="3" position="Net:5, Ln:1, Col:30" />
                <LineMapInfo line="70" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="71" column="4" position="Net:5, Ln:2, Col:22 [Block input EN]" />
                <LineMapInfo line="73" column="10" position="Net:5, Ln:2, Col:22" />
                <LineMapInfo line="74" column="4" position="Net:5, Ln:3, Col:30" />
                <LineMapInfo line="76" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="78" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="79" column="6" position="Net:5, Ln:5, Col:5" />
                <LineMapInfo line="81" column="3" position="Net:5, Ln:5, Col:30" />
                <LineMapInfo line="82" column="4" position="Net:5, Ln:5, Col:5" />
                <LineMapInfo line="83" column="4" position="Net:5, Ln:6, Col:22 [Block input EN]" />
                <LineMapInfo line="85" column="10" position="Net:5, Ln:6, Col:22" />
                <LineMapInfo line="86" column="4" position="Net:5, Ln:7, Col:30" />
                <LineMapInfo line="88" column="4" position="Net:5, Ln:5, Col:5" />
                <LineMapInfo line="91" column="1" position="Net:6" />
                <LineMapInfo line="92" column="1" position="Net:6" />
                <LineMapInfo line="93" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="94" column="6" position="Net:6, Ln:1, Col:6" />
                <LineMapInfo line="96" column="4" position="Net:6, Ln:1, Col:30" />
                <LineMapInfo line="97" column="6" position="Net:6, Ln:3, Col:11" />
                <LineMapInfo line="98" column="4" position="Net:6, Ln:2, Col:19 [Block input IN]" />
                <LineMapInfo line="99" column="4" position="Net:6, Ln:4, Col:16" />
                <LineMapInfo line="100" column="4" position="Net:6, Ln:2, Col:19 [Block input PT]" />
                <LineMapInfo line="101" column="5" position="Net:6, Ln:2, Col:19" />
                <LineMapInfo line="102" column="4" position="Net:6, Ln:2, Col:19 [Block output Q]" />
                <LineMapInfo line="104" column="3" position="Net:6, Ln:3, Col:30" />
                <LineMapInfo line="105" column="4" position="Net:6, Ln:2, Col:19 [Block output Q]" />
                <LineMapInfo line="106" column="4" position="Net:6, Ln:4, Col:23 [Block input EN]" />
                <LineMapInfo line="108" column="10" position="Net:6, Ln:4, Col:23" />
                <LineMapInfo line="109" column="4" position="Net:6, Ln:5, Col:30" />
                <LineMapInfo line="111" column="4" position="Net:6, Ln:2, Col:19 [Block output Q]" />
                <LineMapInfo line="114" column="1" position="Net:7" />
                <LineMapInfo line="115" column="1" position="Net:7" />
                <LineMapInfo line="116" column="5" position="Net:7, Ln:2, Col:1" />
                <LineMapInfo line="117" column="6" position="Net:7, Ln:2, Col:6" />
                <LineMapInfo line="118" column="4" position="Net:7, Ln:1, Col:14 [Block input IN]" />
                <LineMapInfo line="119" column="4" position="Net:7, Ln:3, Col:11" />
                <LineMapInfo line="120" column="4" position="Net:7, Ln:1, Col:14 [Block input PT]" />
                <LineMapInfo line="121" column="5" position="Net:7, Ln:1, Col:14" />
                <LineMapInfo line="122" column="4" position="Net:7, Ln:1, Col:14 [Block output Q]" />
                <LineMapInfo line="124" column="3" position="Net:7, Ln:2, Col:30" />
                <LineMapInfo line="125" column="4" position="Net:7, Ln:1, Col:14 [Block output Q]" />
                <LineMapInfo line="126" column="4" position="Net:7, Ln:3, Col:23 [Block input EN]" />
                <LineMapInfo line="128" column="10" position="Net:7, Ln:3, Col:23" />
                <LineMapInfo line="129" column="4" position="Net:7, Ln:4, Col:30" />
                <LineMapInfo line="131" column="4" position="Net:7, Ln:1, Col:14 [Block output Q]" />
                <LineMapInfo line="134" column="1" position="Net:8" />
                <LineMapInfo line="135" column="1" position="Net:8" />
                <LineMapInfo line="136" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="138" column="5" position="Net:8, Ln:1, Col:5" />
                <LineMapInfo line="139" column="3" position="Net:8, Ln:1, Col:29" />
                <LineMapInfo line="140" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="141" column="5" position="Net:8, Ln:2, Col:5" />
                <LineMapInfo line="142" column="3" position="Net:8, Ln:2, Col:29" />
                <LineMapInfo line="143" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="144" column="5" position="Net:8, Ln:3, Col:5" />
                <LineMapInfo line="145" column="4" position="Net:8, Ln:3, Col:28" />
                <LineMapInfo line="147" column="1" position="Net:9" />
                <LineMapInfo line="148" column="1" position="Net:9" />
                <LineMapInfo line="149" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="151" column="5" position="Net:9, Ln:1, Col:6" />
                <LineMapInfo line="152" column="4" position="Net:9, Ln:1, Col:30" />
                <LineMapInfo line="153" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="154" column="5" position="Net:9, Ln:2, Col:6" />
                <LineMapInfo line="155" column="4" position="Net:9, Ln:2, Col:30" />
                <LineMapInfo line="156" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="157" column="5" position="Net:9, Ln:3, Col:6" />
                <LineMapInfo line="158" column="4" position="Net:9, Ln:3, Col:29" />
                <LineMapInfo line="159" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="160" column="5" position="Net:9, Ln:4, Col:6" />
                <LineMapInfo line="161" column="4" position="Net:9, Ln:4, Col:29" />
                <LineMapInfo line="162" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="163" column="5" position="Net:9, Ln:5, Col:6" />
                <LineMapInfo line="164" column="4" position="Net:9, Ln:5, Col:28" />
                <LineMapInfo line="165" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="166" column="5" position="Net:9, Ln:6, Col:6" />
                <LineMapInfo line="167" column="4" position="Net:9, Ln:6, Col:27" />
                <LineMapInfo line="168" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="169" column="5" position="Net:9, Ln:7, Col:6" />
                <LineMapInfo line="170" column="4" position="Net:9, Ln:7, Col:29" />
                <LineMapInfo line="171" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="172" column="4" position="Net:9, Ln:8, Col:23 [Block input EN]" />
                <LineMapInfo line="174" column="10" position="Net:9, Ln:8, Col:23" />
                <LineMapInfo line="175" column="4" position="Net:9, Ln:9, Col:28" />
                <LineMapInfo line="178" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="48301475" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="Enable">
              <Documentation xsi:type="SimpleText"><![CDATA[Setting active status when enabled and not in error]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" negated="true" edge="none">
                <RelPosition x="153" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Active" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="ModuleOKCheck">
                <RelPosition x="873" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
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
            <Rung evaluationOrder="2" label="EnableCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Return to top if not enabled]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Enable" negated="true" edge="none">
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
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="ErrorReset">
              <Documentation xsi:type="SimpleText"><![CDATA[Reset error state on ErrorReset cmd]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.ErrorReset" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errorbayNONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="753" y="38" />
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
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="reset">
                <RelPosition x="873" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="873" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="Error">
              <Documentation xsi:type="SimpleText"><![CDATA[Send to assignments network if in error]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
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
              <LdObject xsi:type="Coil" operand="IO.Output.doEjectCap" negated="true" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="Assignments">
                <RelPosition x="903" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
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
            <Rung evaluationOrder="5" label="ModuleOKCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Check if X20 In/Out modules are OK]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="304" />
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
              <LdObject xsi:type="Contact" operand="IO.Input.InputModuleOK" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.OutputModuleOK" negated="true" edge="none">
                <RelPosition x="123" y="170" />
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
                    <ComputeBlock><![CDATA[errorbayINPUT_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="633" y="38" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errorbayOUTPUT_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="633" y="190" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="873" y="18" />
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
                <RelPosition x="873" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="873" y="170" />
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
                <RelPosition x="873" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="284" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="304" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="Enabled">
              <Documentation xsi:type="SimpleText"><![CDATA[Ejector Rod Control]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Eject" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diMagazineEmpty" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diEjectorExtended" negated="true" edge="none">
                <RelPosition x="303" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="TimeoutTime">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="453" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="543" y="76" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="4" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="5" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="6">
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
                    <ComputeBlock><![CDATA[errorbayEJECTOR_TIMEOUT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="114" />
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
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="8">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="IO.Output.doEjectCap" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="873" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
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
                <RelPosition x="873" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="208" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
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
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="RetractTimeout">
              <Documentation xsi:type="SimpleText"><![CDATA[Raise error if ejector takes too long to retract]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="1">
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Eject" negated="true" edge="none">
                <RelPosition x="3" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Input.diEjectorRetracted" negated="true" edge="none">
                <RelPosition x="153" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="TimeoutTime">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="303" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="">
                <RelPosition x="393" y="38" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errorbayEJECTOR_TIMEOUT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="76" />
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
                      <Connection refConnectionPointOutId="5" />
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
                    <ConnectionPointOut connectionPointOutId="6">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="7">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="873" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="873" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="903" y="170" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="8" />
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
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="IOReporting">
              <Documentation xsi:type="SimpleText"><![CDATA[Reports status based on IO]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="IO.Input.diEjectorExtended" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diEjectorRetracted" edge="none">
                <RelPosition x="123" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Input.diMagazineEmpty" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.MagazineEmpty" edge="none" latch="none">
                <RelPosition x="813" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapEjected" edge="none" latch="set">
                <RelPosition x="843" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapEjected" edge="none" latch="reset">
                <RelPosition x="843" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="114" />
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
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="9" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[Storing old cmds and passing status from/to global interface]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Eject" edge="none">
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
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.Enable" edge="none">
                <RelPosition x="153" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gBayInterface.Cmd.ErrorReset" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="153" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapEjected" edge="none">
                <RelPosition x="153" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.MagazineEmpty" edge="none">
                <RelPosition x="153" y="208" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
                <RelPosition x="153" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.ErrorID]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="266" />
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
              <LdObject xsi:type="Coil" operand="gBayInterface.Status.MagazineEmpty" edge="none" latch="none">
                <RelPosition x="783" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="210" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Status.CapEjected" edge="none" latch="none">
                <RelPosition x="813" y="170" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="gBayInterface.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="813" y="322" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.ErrorReset" edge="none" latch="none">
                <RelPosition x="843" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Status.Active" edge="none" latch="none">
                <RelPosition x="843" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gBayInterface.Status.Error" edge="none" latch="none">
                <RelPosition x="843" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Eject" edge="none" latch="none">
                <RelPosition x="873" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="873" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="993" y="0" />
                <Size x="3" y="342" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
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