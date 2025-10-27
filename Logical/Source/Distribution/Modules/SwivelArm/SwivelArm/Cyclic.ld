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
 * Description: Swivel Arm control task
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
	zz$$$$_1_gArmInterface_Cmd_Error : BOOL;
	zz$$$$_2_Eno_ComputeBlock : BOOL;
	zz$$$$_3_Internal_Status_Error_A : BOOL;
	zz$$$$_4_gArmInterface_Cmd_Enabl : BOOL;
	zz$$$$_5_IO_Input_InputModuleOK_ : BOOL;
	zz$$$$_6_Eno_ComputeBlock : BOOL;
	zz$$$$_7_IO_Input_OutputModuleOK : BOOL;
	zz$$$$_8_Eno_ComputeBlock : BOOL;
	zz$$$$_9_Eno_ComputeBlock : BOOL;
	zz$$$$_10_TOF : TOF;
	zz$$$$_11_r_trig_gArmInterface_C : r_trig;
	zz$$$$_12_f_trig_Internal_Status : f_trig;
	zz$$$$_13_Internal_Status_CapGri : BOOL;
	zz$$$$_14_Eno_ComputeBlock : BOOL;
	zz$$$$_15_gArmInterface_Cmd_Enab : BOOL;
	zz$$$$_16_gArmInterface_Cmd_Enab : BOOL;
	zz$$$$_17_Eno_ComputeBlock : BOOL;
	zz$$$$_18_Eno_ComputeBlock : BOOL;
	zz$$$$_19_IO_Input_OutputModuleO : BOOL;
	zz$$$$_20_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
Enable:
LD	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ANDN	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_0_Internal_Status_Error_A
ST	Internal.Status.Active {CheckDataType := BOOL}
JMPC	ModuleOKCheck

{NetworkNumber := 2}
EnableCheck:
LDN	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
RETC

{NetworkNumber := 3}
ErrorReset:
LD	Internal.Status.Error {CheckDataType := BOOL}
AND	gArmInterface.Cmd.ErrorReset {CheckDataType := BOOL}
ST	zz$$$$_1_gArmInterface_Cmd_Error
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_1_gArmInterface_Cmd_Error
ST	zz$$$$_2_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	errARM_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_0:
LD	zz$$$$_1_gArmInterface_Cmd_Error
RETC

{NetworkNumber := 4}
Error:
LD	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_3_Internal_Status_Error_A
R	IO.Output.doSwivelArmFwd {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Status_Error_A
R	IO.Output.doSwivelArmBwd {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Status_Error_A
JMPC	Assignments

{NetworkNumber := 5}
ModuleOKCheck:
LD	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_4_gArmInterface_Cmd_Enabl
ANDN	IO.Input.InputModuleOK {CheckDataType := BOOL}
ST	zz$$$$_5_IO_Input_InputModuleOK_
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_5_IO_Input_InputModuleOK_
R	Internal.Status.ModuleOK {CheckDataType := BOOL}
LD	zz$$$$_5_IO_Input_InputModuleOK_
ST	zz$$$$_6_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	errARM_INPUT_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_1:
LD	zz$$$$_5_IO_Input_InputModuleOK_
RETC
LD	zz$$$$_4_gArmInterface_Cmd_Enabl
ANDN	IO.Input.OutputModuleOK {CheckDataType := BOOL}
ST	zz$$$$_7_IO_Input_OutputModuleOK
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_7_IO_Input_OutputModuleOK
R	Internal.Status.ModuleOK {CheckDataType := BOOL}
LD	zz$$$$_7_IO_Input_OutputModuleOK
ST	zz$$$$_8_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	errARM_OUTPUT_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_2:
LD	zz$$$$_7_IO_Input_OutputModuleOK
RETC

{NetworkNumber := 6}
ParPass:
LD	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_9_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	gArmInterface.Par
ST	Internal.Par
ll$$$$_IF_3:

{NetworkNumber := 7}
ArmFwdCtrl:
LD	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
ANDN	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
ANDN	IO.Input.diSwivelArmAtDropoff {CheckDataType := BOOL}
AND	Internal.Par.CanMoveFwd {CheckDataType := BOOL}
ST	IO.Output.doSwivelArmFwd {CheckDataType := BOOL}

{NetworkNumber := 8}
ArmBwdCtrl:
LD	gArmInterface.Cmd.MoveBwd {CheckDataType := BOOL}
ANDN	gArmInterface.Cmd.MoveFwd {CheckDataType := BOOL}
ANDN	IO.Input.diSwivelArmAtPickup {CheckDataType := BOOL}
ANDN	Internal.Status.CapGripped {CheckDataType := BOOL}
ST	IO.Output.doSwivelArmBwd {CheckDataType := BOOL}

{NetworkNumber := 9}
GripEnable:
LD	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
AND	Internal.Par.CanGrip {CheckDataType := BOOL}
S	IO.Output.doCapGripperPick {CheckDataType := BOOL}

{NetworkNumber := 10}
GripDisable:
LDN	gArmInterface.Cmd.GripCap {CheckDataType := BOOL}
AND	Internal.Par.CanRelease {CheckDataType := BOOL}
R	IO.Output.doCapGripperPick {CheckDataType := BOOL}

{NetworkNumber := 11}
Eject:
LD	gArmInterface.Cmd.EjectCap {CheckDataType := BOOL}
ST	zz$$$$_11_r_trig_gArmInterface_C.CLK
CAL	zz$$$$_11_r_trig_gArmInterface_C
LD	zz$$$$_11_r_trig_gArmInterface_C.Q
AND	Internal.Par.CanRelease {CheckDataType := BOOL}
ANDN	IO.Output.doCapGripperPick {CheckDataType := BOOL}
ST	zz$$$$_10_TOF.IN
LD	EjectorTime
ST	zz$$$$_10_TOF.PT
CAL	zz$$$$_10_TOF
LD	zz$$$$_10_TOF.Q
ST	IO.Output.doCapGripperEject {CheckDataType := BOOL}

{NetworkNumber := 12}
CapLoss:
LD	Internal.Status.CapGripped {CheckDataType := BOOL}
ST	zz$$$$_12_f_trig_Internal_Status.CLK
CAL	zz$$$$_12_f_trig_Internal_Status
LD	IO.Output.doCapGripperPick {CheckDataType := BOOL}
AND	zz$$$$_12_f_trig_Internal_Status.Q
ST	zz$$$$_13_Internal_Status_CapGri
ST	Internal.Status.Error {CheckDataType := BOOL}
ST	zz$$$$_14_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	errARM_CAP_LOST_IN_TRANSIT
ST	Internal.Status.ErrorID
ll$$$$_IF_4:
LD	zz$$$$_13_Internal_Status_CapGri
R	IO.Output.doCapGripperPick {CheckDataType := BOOL}
LD	zz$$$$_13_Internal_Status_CapGri
RETC

{NetworkNumber := 13}
IOCheck:
LD	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_15_gArmInterface_Cmd_Enab
AND	IO.Input.diCapGripperVacuum {CheckDataType := BOOL}
ST	Internal.Status.CapGripped {CheckDataType := BOOL}
LD	zz$$$$_15_gArmInterface_Cmd_Enab
AND	IO.Input.diSwivelArmAtPickup {CheckDataType := BOOL}
ST	Internal.Status.ArmAtPickup {CheckDataType := BOOL}
LD	zz$$$$_15_gArmInterface_Cmd_Enab
AND	IO.Input.diSwivelArmAtDropoff {CheckDataType := BOOL}
ST	Internal.Status.ArmAtDropoff {CheckDataType := BOOL}

{NetworkNumber := 14}
Assignments:
LD	gArmInterface.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_16_gArmInterface_Cmd_Enab
ST	zz$$$$_17_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	gArmInterface.Cmd
ST	Internal.Cmd
ll$$$$_IF_5:
LD	zz$$$$_16_gArmInterface_Cmd_Enab
ST	zz$$$$_18_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Status
ST	gArmInterface.Status
ll$$$$_IF_6:

{NetworkNumber := 15}
ModuleOKRecover:
LDN	Internal.Status.ModuleOK {CheckDataType := BOOL}
AND	IO.Input.InputModuleOK {CheckDataType := BOOL}
AND	IO.Input.OutputModuleOK {CheckDataType := BOOL}
ST	zz$$$$_19_IO_Input_OutputModuleO
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_19_IO_Input_OutputModuleO
S	Internal.Status.ModuleOK {CheckDataType := BOOL}
LD	zz$$$$_19_IO_Input_OutputModuleO
ST	zz$$$$_20_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	errARM_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_7:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="14" column="1" position="Net:11, Ln:1, Col:21" />
                <LineMapInfo line="28" column="1" position="Net:1" />
                <LineMapInfo line="29" column="1" position="Net:1" />
                <LineMapInfo line="30" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="31" column="6" position="Net:1, Ln:1, Col:6" />
                <LineMapInfo line="33" column="4" position="Net:1, Ln:1, Col:27" />
                <LineMapInfo line="34" column="6" position="Net:1, Ln:2, Col:27" />
                <LineMapInfo line="36" column="1" position="Net:2" />
                <LineMapInfo line="37" column="1" position="Net:2" />
                <LineMapInfo line="38" column="5" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="41" column="1" position="Net:3" />
                <LineMapInfo line="42" column="1" position="Net:3" />
                <LineMapInfo line="43" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="44" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="46" column="3" position="Net:3, Ln:1, Col:27" />
                <LineMapInfo line="47" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="48" column="4" position="Net:3, Ln:2, Col:23 [Block input EN]" />
                <LineMapInfo line="50" column="10" position="Net:3, Ln:2, Col:23" />
                <LineMapInfo line="51" column="4" position="Net:3, Ln:3, Col:27" />
                <LineMapInfo line="53" column="4" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="56" column="1" position="Net:4" />
                <LineMapInfo line="57" column="1" position="Net:4" />
                <LineMapInfo line="58" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="60" column="3" position="Net:4, Ln:1, Col:26" />
                <LineMapInfo line="61" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="62" column="3" position="Net:4, Ln:2, Col:26" />
                <LineMapInfo line="63" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="64" column="6" position="Net:4, Ln:3, Col:28" />
                <LineMapInfo line="66" column="1" position="Net:5" />
                <LineMapInfo line="67" column="1" position="Net:5" />
                <LineMapInfo line="68" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="70" column="6" position="Net:5, Ln:1, Col:6" />
                <LineMapInfo line="72" column="3" position="Net:5, Ln:1, Col:27" />
                <LineMapInfo line="73" column="4" position="Net:5, Ln:1, Col:6" />
                <LineMapInfo line="74" column="3" position="Net:5, Ln:2, Col:26" />
                <LineMapInfo line="75" column="4" position="Net:5, Ln:1, Col:6" />
                <LineMapInfo line="76" column="4" position="Net:5, Ln:3, Col:19 [Block input EN]" />
                <LineMapInfo line="78" column="10" position="Net:5, Ln:3, Col:19" />
                <LineMapInfo line="79" column="4" position="Net:5, Ln:4, Col:27" />
                <LineMapInfo line="81" column="4" position="Net:5, Ln:1, Col:6" />
                <LineMapInfo line="83" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="84" column="6" position="Net:5, Ln:6, Col:6" />
                <LineMapInfo line="86" column="3" position="Net:5, Ln:6, Col:27" />
                <LineMapInfo line="87" column="4" position="Net:5, Ln:6, Col:6" />
                <LineMapInfo line="88" column="3" position="Net:5, Ln:7, Col:26" />
                <LineMapInfo line="89" column="4" position="Net:5, Ln:6, Col:6" />
                <LineMapInfo line="90" column="4" position="Net:5, Ln:8, Col:19 [Block input EN]" />
                <LineMapInfo line="92" column="10" position="Net:5, Ln:8, Col:19" />
                <LineMapInfo line="93" column="4" position="Net:5, Ln:9, Col:27" />
                <LineMapInfo line="95" column="4" position="Net:5, Ln:6, Col:6" />
                <LineMapInfo line="98" column="1" position="Net:6" />
                <LineMapInfo line="99" column="1" position="Net:6" />
                <LineMapInfo line="100" column="4" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="101" column="4" position="Net:6, Ln:1, Col:23 [Block input EN]" />
                <LineMapInfo line="103" column="10" position="Net:6, Ln:1, Col:23" />
                <LineMapInfo line="104" column="4" position="Net:6, Ln:2, Col:28" />
                <LineMapInfo line="107" column="1" position="Net:7" />
                <LineMapInfo line="108" column="1" position="Net:7" />
                <LineMapInfo line="109" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="110" column="6" position="Net:7, Ln:1, Col:7" />
                <LineMapInfo line="111" column="6" position="Net:7, Ln:1, Col:13" />
                <LineMapInfo line="112" column="5" position="Net:7, Ln:1, Col:19" />
                <LineMapInfo line="113" column="4" position="Net:7, Ln:1, Col:26" />
                <LineMapInfo line="115" column="1" position="Net:8" />
                <LineMapInfo line="116" column="1" position="Net:8" />
                <LineMapInfo line="117" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="118" column="6" position="Net:8, Ln:1, Col:7" />
                <LineMapInfo line="119" column="6" position="Net:8, Ln:1, Col:13" />
                <LineMapInfo line="120" column="6" position="Net:8, Ln:1, Col:19" />
                <LineMapInfo line="121" column="4" position="Net:8, Ln:1, Col:26" />
                <LineMapInfo line="123" column="1" position="Net:9" />
                <LineMapInfo line="124" column="1" position="Net:9" />
                <LineMapInfo line="125" column="4" position="Net:9, Ln:1, Col:1" />
                <LineMapInfo line="126" column="5" position="Net:9, Ln:1, Col:6" />
                <LineMapInfo line="127" column="3" position="Net:9, Ln:1, Col:25" />
                <LineMapInfo line="129" column="1" position="Net:10" />
                <LineMapInfo line="130" column="1" position="Net:10" />
                <LineMapInfo line="131" column="5" position="Net:10, Ln:1, Col:1" />
                <LineMapInfo line="132" column="5" position="Net:10, Ln:1, Col:6" />
                <LineMapInfo line="133" column="3" position="Net:10, Ln:1, Col:25" />
                <LineMapInfo line="135" column="1" position="Net:11" />
                <LineMapInfo line="136" column="1" position="Net:11" />
                <LineMapInfo line="137" column="4" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="138" column="4" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="139" column="5" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="140" column="4" position="Net:11, Ln:2, Col:1" />
                <LineMapInfo line="141" column="5" position="Net:11, Ln:2, Col:7" />
                <LineMapInfo line="142" column="6" position="Net:11, Ln:2, Col:12" />
                <LineMapInfo line="143" column="4" position="Net:11, Ln:1, Col:21 [Block input IN]" />
                <LineMapInfo line="144" column="4" position="Net:11, Ln:3, Col:18" />
                <LineMapInfo line="145" column="4" position="Net:11, Ln:1, Col:21 [Block input PT]" />
                <LineMapInfo line="146" column="5" position="Net:11, Ln:1, Col:21" />
                <LineMapInfo line="147" column="4" position="Net:11, Ln:1, Col:21 [Block output Q]" />
                <LineMapInfo line="148" column="4" position="Net:11, Ln:2, Col:25" />
                <LineMapInfo line="150" column="1" position="Net:12" />
                <LineMapInfo line="151" column="1" position="Net:12" />
                <LineMapInfo line="152" column="4" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="153" column="4" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="154" column="5" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="155" column="4" position="Net:12, Ln:1, Col:1" />
                <LineMapInfo line="156" column="5" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="158" column="4" position="Net:12, Ln:1, Col:27" />
                <LineMapInfo line="159" column="4" position="Net:12, Ln:2, Col:19 [Block input EN]" />
                <LineMapInfo line="161" column="10" position="Net:12, Ln:2, Col:19" />
                <LineMapInfo line="162" column="4" position="Net:12, Ln:3, Col:27" />
                <LineMapInfo line="164" column="4" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="165" column="3" position="Net:12, Ln:4, Col:25" />
                <LineMapInfo line="166" column="4" position="Net:12, Ln:1, Col:7" />
                <LineMapInfo line="169" column="1" position="Net:13" />
                <LineMapInfo line="170" column="1" position="Net:13" />
                <LineMapInfo line="171" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="173" column="5" position="Net:13, Ln:1, Col:6" />
                <LineMapInfo line="174" column="4" position="Net:13, Ln:1, Col:26" />
                <LineMapInfo line="175" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="176" column="5" position="Net:13, Ln:2, Col:6" />
                <LineMapInfo line="177" column="4" position="Net:13, Ln:2, Col:26" />
                <LineMapInfo line="178" column="4" position="Net:13, Ln:1, Col:1" />
                <LineMapInfo line="179" column="5" position="Net:13, Ln:3, Col:6" />
                <LineMapInfo line="180" column="4" position="Net:13, Ln:3, Col:25" />
                <LineMapInfo line="182" column="1" position="Net:14" />
                <LineMapInfo line="183" column="1" position="Net:14" />
                <LineMapInfo line="184" column="4" position="Net:14, Ln:1, Col:1" />
                <LineMapInfo line="186" column="4" position="Net:14, Ln:1, Col:23 [Block input EN]" />
                <LineMapInfo line="188" column="10" position="Net:14, Ln:1, Col:23" />
                <LineMapInfo line="189" column="4" position="Net:14, Ln:2, Col:28" />
                <LineMapInfo line="191" column="4" position="Net:14, Ln:1, Col:1" />
                <LineMapInfo line="192" column="4" position="Net:14, Ln:3, Col:23 [Block input EN]" />
                <LineMapInfo line="194" column="10" position="Net:14, Ln:3, Col:23" />
                <LineMapInfo line="195" column="4" position="Net:14, Ln:4, Col:27" />
                <LineMapInfo line="198" column="1" position="Net:15" />
                <LineMapInfo line="199" column="1" position="Net:15" />
                <LineMapInfo line="200" column="5" position="Net:15, Ln:1, Col:1" />
                <LineMapInfo line="201" column="5" position="Net:15, Ln:1, Col:6" />
                <LineMapInfo line="202" column="5" position="Net:15, Ln:1, Col:11" />
                <LineMapInfo line="204" column="3" position="Net:15, Ln:1, Col:27" />
                <LineMapInfo line="205" column="4" position="Net:15, Ln:1, Col:11" />
                <LineMapInfo line="206" column="3" position="Net:15, Ln:2, Col:26" />
                <LineMapInfo line="207" column="4" position="Net:15, Ln:1, Col:11" />
                <LineMapInfo line="208" column="4" position="Net:15, Ln:3, Col:23 [Block input EN]" />
                <LineMapInfo line="210" column="10" position="Net:15, Ln:3, Col:23" />
                <LineMapInfo line="211" column="4" position="Net:15, Ln:4, Col:27" />
                <LineMapInfo line="214" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="BBBA3214" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="Enable">
              <Documentation xsi:type="SimpleText"><![CDATA[Report active and continue if enable cmd and not in error state]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" edge="none">
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
                <RelPosition x="783" y="18" />
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
                <RelPosition x="783" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
              <Documentation xsi:type="SimpleText"><![CDATA[If not enabled, return to start of program]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" negated="true" edge="none">
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
                <RelPosition x="813" y="18" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.ErrorReset" edge="none">
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
                    <ComputeBlock><![CDATA[errARM_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="38" />
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
                <RelPosition x="783" y="18" />
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
                <RelPosition x="783" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="813" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
              <Documentation xsi:type="SimpleText"><![CDATA[If in error state, stop movement and skip to assignments]]></Documentation>
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
              <LdObject xsi:type="Coil" operand="IO.Output.doSwivelArmFwd" edge="none" latch="reset">
                <RelPosition x="753" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="IO.Output.doSwivelArmBwd" edge="none" latch="reset">
                <RelPosition x="753" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="Assignments">
                <RelPosition x="813" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="ModuleOKCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Check if X20 In/Out modules are OK]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.InputModuleOK" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.OutputModuleOK" negated="true" edge="none">
                <RelPosition x="153" y="208" />
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
                    <ComputeBlock><![CDATA[errARM_INPUT_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="543" y="76" />
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
                    <ComputeBlock><![CDATA[errARM_OUTPUT_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="543" y="266" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.ModuleOK" edge="none" latch="reset">
                <RelPosition x="753" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.ModuleOK" edge="none" latch="reset">
                <RelPosition x="753" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="783" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="783" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="813" y="170" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="813" y="360" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="9" />
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
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="6" label="ParPass">
              <Documentation xsi:type="SimpleText"><![CDATA[Pass parameters from interface to internal]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" edge="none">
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
                    <ComputeBlock><![CDATA[gArmInterface.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="0" />
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="813" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
            <Rung evaluationOrder="7" label="ArmFwdCtrl">
              <Documentation xsi:type="SimpleText"><![CDATA[Move swivel arm forward if allowed]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.MoveFwd" edge="none">
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.MoveBwd" negated="true" edge="none">
                <RelPosition x="183" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Input.diSwivelArmAtDropoff" negated="true" edge="none">
                <RelPosition x="363" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.CanMoveFwd" edge="none">
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
              <LdObject xsi:type="Coil" operand="IO.Output.doSwivelArmFwd" edge="none" latch="none">
                <RelPosition x="753" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="ArmBwdCtrl">
              <Documentation xsi:type="SimpleText"><![CDATA[Move swivel arm backward if allowed]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.MoveBwd" edge="none">
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.MoveFwd" negated="true" edge="none">
                <RelPosition x="183" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Input.diSwivelArmAtPickup" negated="true" edge="none">
                <RelPosition x="363" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.CapGripped" negated="true" edge="none">
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
              <LdObject xsi:type="Coil" operand="IO.Output.doSwivelArmBwd" edge="none" latch="none">
                <RelPosition x="753" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="9" label="GripEnable">
              <Documentation xsi:type="SimpleText"><![CDATA[Enable gripper vacuum if allowed]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.GripCap" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Par.CanGrip" edge="none">
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
              <LdObject xsi:type="Coil" operand="IO.Output.doCapGripperPick" edge="none" latch="set">
                <RelPosition x="723" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="10" label="GripDisable">
              <Documentation xsi:type="SimpleText"><![CDATA[Disable gripper vacuum if allowed]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.GripCap" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Par.CanRelease" edge="none">
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
              <LdObject xsi:type="Coil" operand="IO.Output.doCapGripperPick" edge="none" latch="reset">
                <RelPosition x="723" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="11" label="Eject">
              <Documentation xsi:type="SimpleText"><![CDATA[Run gripper ejector for 2 seconds on enable]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.EjectCap" edge="rising">
                <RelPosition x="3" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.CanRelease" edge="none">
                <RelPosition x="183" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Output.doCapGripperPick" negated="true" edge="none">
                <RelPosition x="333" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="EjectorTime">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="513" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="90" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TOF" instanceName="">
                <RelPosition x="603" y="38" />
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
              <LdObject xsi:type="Coil" operand="IO.Output.doCapGripperEject" edge="none" latch="none">
                <RelPosition x="723" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="114" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="12" label="CapLoss">
              <Documentation xsi:type="SimpleText"><![CDATA[Detect if a cap has been lost]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="IO.Output.doCapGripperPick" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.CapGripped" edge="falling">
                <RelPosition x="183" y="18" />
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
                    <ComputeBlock><![CDATA[errARM_CAP_LOST_IN_TRANSIT]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="543" y="38" />
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
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="240" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="5">
                      <RelPosition x="240" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="IO.Output.doCapGripperPick" edge="none" latch="reset">
                <RelPosition x="723" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="none">
                <RelPosition x="783" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="Return">
                <RelPosition x="813" y="170" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="190" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="7" />
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
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="13" label="IOCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Check/report statuses based on IO]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diCapGripperVacuum" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diSwivelArmAtPickup" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.diSwivelArmAtDropoff" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.ArmAtDropoff" edge="none" latch="none">
                <RelPosition x="723" y="94" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapGripped" edge="none" latch="none">
                <RelPosition x="753" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.ArmAtPickup" edge="none" latch="none">
                <RelPosition x="753" y="56" />
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
                <RelPosition x="903" y="0" />
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
            <Rung evaluationOrder="14" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[Assign cmds and statuses to/from interface and internal]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gArmInterface.Cmd.Enable" edge="none">
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
                    <ComputeBlock><![CDATA[gArmInterface.Cmd]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="0" />
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
                    <ComputeBlock><![CDATA[Internal.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="76" />
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
              <FbdObject xsi:type="DataSink" identifier="gArmInterface.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="132" />
                <Size x="120" y="20" />
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
                <RelPosition x="813" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
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
            <Rung evaluationOrder="15" label="ModuleOKRecover">
              <Documentation xsi:type="SimpleText"><![CDATA[If X20 module(s) plugged back in return to running]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOK" negated="true" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.InputModuleOK" edge="none">
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
              <LdObject xsi:type="Contact" operand="IO.Input.OutputModuleOK" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[errARM_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="663" y="76" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.ModuleOK" edge="none" latch="set">
                <RelPosition x="753" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="reset">
                <RelPosition x="783" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
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
                <RelPosition x="783" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="903" y="0" />
                <Size x="3" y="152" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="7" />
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