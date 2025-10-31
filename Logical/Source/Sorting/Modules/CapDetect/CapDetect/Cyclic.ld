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
 * Description: This task handles cap detection, and color identification, at the entry
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
	zz$$$$_1_Internal_Cmd_Start_AndR : BOOL;
	zz$$$$_2_Internal_Cmd_Stop_AndRe : BOOL;
	zz$$$$_3_IO_Inputs_diProductAvai : BOOL;
	zz$$$$_4_Eno_ComputeBlock : BOOL;
	zz$$$$_5_Q_TON_Timer_DetectTime : ANY;
	zz$$$$_6_IO_Inputs_diMetalCap_An : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_IO_Inputs_diMetalCap_An : BOOL;
	zz$$$$_9_Eno_ComputeBlock : BOOL;
	zz$$$$_10_IO_Inputs_diMetalCap_A : BOOL;
	zz$$$$_11_Eno_ComputeBlock : BOOL;
	zz$$$$_12_Internal_Status_Stoppe : BOOL;
	zz$$$$_13_Eno_ComputeBlock : BOOL;
	zz$$$$_14_OrResult : BOOL;
	zz$$$$_15_Internal_Cmd_ManualDet : BOOL;
	zz$$$$_16_IO_Inputs_diMetalCap_A : BOOL;
	zz$$$$_17_Eno_ComputeBlock : BOOL;
	zz$$$$_18_IO_Inputs_diMetalCap_A : BOOL;
	zz$$$$_19_Eno_ComputeBlock : BOOL;
	zz$$$$_20_IO_Inputs_diMetalCap_A : BOOL;
	zz$$$$_21_Eno_ComputeBlock : BOOL;
	zz$$$$_22_Internal_Cmd_Enable_An : BOOL;
	zz$$$$_23_Internal_Status_Module : BOOL;
	zz$$$$_24_Eno_ComputeBlock : BOOL;
	zz$$$$_25_Internal_Status_Module : BOOL;
	zz$$$$_26_Eno_ComputeBlock : BOOL;
	zz$$$$_27_Internal_Cmd_Enable_An : BOOL;
	zz$$$$_28_Eno_ComputeBlock : BOOL;
	zz$$$$_29_Eno_ComputeBlock : BOOL;
	zz$$$$_30_gCapDetect_Cmd_Enable_ : BOOL;
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
ST	zz$$$$_1_Internal_Cmd_Start_AndR
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
ST	zz$$$$_2_Internal_Cmd_Stop_AndRe
AND	IO.Inputs.diProductAvailable {CheckDataType := BOOL}
ST	zz$$$$_3_IO_Inputs_diProductAvai
ST	Internal.Par.ProductAvailable {CheckDataType := BOOL}
JMPC	IdentifyState
LDN	zz$$$$_2_Internal_Cmd_Stop_AndRe
ST	Internal.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_1_Internal_Cmd_Start_AndR
AND	Internal.Cmd.Stop {CheckDataType := BOOL}
AND	IO.Inputs.diProductAvailable {CheckDataType := BOOL}
ST	Internal.Par.ProductAvailable {CheckDataType := BOOL}

{NetworkNumber := 3}
IdentifyState:
LD	Internal.Status.CapIsSorted {CheckDataType := BOOL}
ST	zz$$$$_4_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	ccCAP_NONE
ST	Internal.Par.CapColor
ll$$$$_IF_0:
LD	zz$$$$_4_Eno_ComputeBlock
OR	Internal.Status.Active {CheckDataType := BOOL}
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	Timer.DetectTime.IN
LD	Timer.TIME_DELAY
ST	Timer.DetectTime.PT
CAL	Timer.DetectTime
LD	Timer.DetectTime.Q
ST	zz$$$$_5_Q_TON_Timer_DetectTime
AND	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_6_IO_Inputs_diMetalCap_An
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_6_IO_Inputs_diMetalCap_An
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	ccCAP_METAL
ST	Internal.Par.CapColor
ll$$$$_IF_1:
LD	zz$$$$_5_Q_TON_Timer_DetectTime
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_8_IO_Inputs_diMetalCap_An
ST	zz$$$$_9_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	ccCAP_RED
ST	Internal.Par.CapColor
ll$$$$_IF_2:
LD	zz$$$$_8_IO_Inputs_diMetalCap_An
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_5_Q_TON_Timer_DetectTime
ANDN	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_10_IO_Inputs_diMetalCap_A
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_10_IO_Inputs_diMetalCap_A
ST	zz$$$$_11_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	ccCAP_BLACK
ST	Internal.Par.CapColor
ll$$$$_IF_3:

{NetworkNumber := 4}
IdentifyInManual:
LD	Internal.Status.Stopped {CheckDataType := BOOL}
ST	zz$$$$_12_Internal_Status_Stoppe
ST	zz$$$$_13_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	ccCAP_NONE
ST	Internal.Par.CapColor
ll$$$$_IF_4:
LD	zz$$$$_12_Internal_Status_Stoppe
AND	Internal.Status.Active {CheckDataType := BOOL}
OR	zz$$$$_13_Eno_ComputeBlock
ST	zz$$$$_14_OrResult
AND	IO.Inputs.diProductAvailable {CheckDataType := BOOL}
AND	Internal.Cmd.ManualDetect {CheckDataType := BOOL}
ST	zz$$$$_15_Internal_Cmd_ManualDet
AND	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_16_IO_Inputs_diMetalCap_A
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_16_IO_Inputs_diMetalCap_A
ST	zz$$$$_17_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	ccCAP_METAL
ST	Internal.Par.CapColor
ll$$$$_IF_5:
LD	zz$$$$_15_Internal_Cmd_ManualDet
AND	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_18_IO_Inputs_diMetalCap_A
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_18_IO_Inputs_diMetalCap_A
ST	zz$$$$_19_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	ccCAP_RED
ST	Internal.Par.CapColor
ll$$$$_IF_6:
LD	zz$$$$_15_Internal_Cmd_ManualDet
ANDN	IO.Inputs.diCapIsShiny {CheckDataType := BOOL}
ANDN	IO.Inputs.diMetalCap {CheckDataType := BOOL}
ST	zz$$$$_20_IO_Inputs_diMetalCap_A
S	Internal.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_20_IO_Inputs_diMetalCap_A
ST	zz$$$$_21_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	ccCAP_BLACK
ST	Internal.Par.CapColor
ll$$$$_IF_7:
LD	zz$$$$_14_OrResult
ANDN	IO.Inputs.diProductAvailable {CheckDataType := BOOL}
R	Internal.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 5}
ModuleOkCheck:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_22_Internal_Cmd_Enable_An
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_23_Internal_Status_Module
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_23_Internal_Status_Module
ST	zz$$$$_24_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	cdERROR_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_8:
LD	zz$$$$_22_Internal_Cmd_Enable_An
ANDN	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_25_Internal_Status_Module
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_25_Internal_Status_Module
ST	zz$$$$_26_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	cdERROR_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_9:

{NetworkNumber := 6}
DoneReset:
LDN	Internal.Par.ProductAvailable {CheckDataType := BOOL}
R	Internal.Status.Done {CheckDataType := BOOL}

{NetworkNumber := 7}
InternalToGlobal:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_27_Internal_Cmd_Enable_An
ST	zz$$$$_28_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	Internal.Status.ErrorID
ST	gCapDetect.Status.ErrorID
ll$$$$_IF_10:
LD	zz$$$$_27_Internal_Cmd_Enable_An
ST	zz$$$$_29_Eno_ComputeBlock
JMPCN ll$$$$_IF_11
Compute!	Internal.Par.CapColor
ST	gCapDetect.Par.CapColor
ll$$$$_IF_11:
LD	zz$$$$_27_Internal_Cmd_Enable_An
ST	gCapDetect.Status.Active {CheckDataType := BOOL}
AND	Internal.Status.Done {CheckDataType := BOOL}
ST	gCapDetect.Status.Done {CheckDataType := BOOL}
LD	zz$$$$_27_Internal_Cmd_Enable_An
AND	Internal.Par.ProductAvailable {CheckDataType := BOOL}
ST	gCapDetect.Par.ProductAvailable {CheckDataType := BOOL}
LD	zz$$$$_27_Internal_Cmd_Enable_An
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	gCapDetect.Status.ModuleOk {CheckDataType := BOOL}
LD	zz$$$$_27_Internal_Cmd_Enable_An
AND	Internal.Status.Error {CheckDataType := BOOL}
ST	gCapDetect.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_27_Internal_Cmd_Enable_An
AND	Internal.Status.Stopped {CheckDataType := BOOL}
ST	gCapDetect.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_27_Internal_Cmd_Enable_An
AND	gCapDetect.Status.CapIsSorted {CheckDataType := BOOL}
ST	Internal.Status.CapIsSorted {CheckDataType := BOOL}

{NetworkNumber := 8}
GlobalToInternal:
LD	gCapDetect.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_30_gCapDetect_Cmd_Enable_
ST	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	gCapDetect.Cmd.Start {CheckDataType := BOOL}
ST	Internal.Cmd.Start {CheckDataType := BOOL}
LD	zz$$$$_30_gCapDetect_Cmd_Enable_
AND	gCapDetect.Cmd.Stop {CheckDataType := BOOL}
ST	Internal.Cmd.Stop {CheckDataType := BOOL}
LD	zz$$$$_30_gCapDetect_Cmd_Enable_
AND	gCapDetect.Cmd.ManualDetect {CheckDataType := BOOL}
ST	Internal.Cmd.ManualDetect {CheckDataType := BOOL}

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
                <LineMapInfo line="43" column="4" position="Net:1, Ln:1, Col:41" />
                <LineMapInfo line="44" column="6" position="Net:1, Ln:2, Col:42" />
                <LineMapInfo line="46" column="1" position="Net:2" />
                <LineMapInfo line="47" column="1" position="Net:2" />
                <LineMapInfo line="48" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="50" column="6" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="52" column="5" position="Net:2, Ln:1, Col:9" />
                <LineMapInfo line="54" column="4" position="Net:2, Ln:1, Col:39" />
                <LineMapInfo line="55" column="6" position="Net:2, Ln:2, Col:42" />
                <LineMapInfo line="56" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="57" column="4" position="Net:2, Ln:3, Col:40" />
                <LineMapInfo line="58" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="59" column="5" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="60" column="5" position="Net:2, Ln:4, Col:9" />
                <LineMapInfo line="61" column="4" position="Net:2, Ln:4, Col:39" />
                <LineMapInfo line="63" column="1" position="Net:3" />
                <LineMapInfo line="64" column="1" position="Net:3" />
                <LineMapInfo line="65" column="4" position="Net:3, Ln:2, Col:1" />
                <LineMapInfo line="66" column="4" position="Net:3, Ln:2, Col:6 [Block input EN]" />
                <LineMapInfo line="68" column="10" position="Net:3, Ln:2, Col:6" />
                <LineMapInfo line="69" column="4" position="Net:3, Ln:3, Col:10" />
                <LineMapInfo line="71" column="4" position="Net:3, Ln:2, Col:6 [Block output ENO]" />
                <LineMapInfo line="72" column="4" position="Net:3, Ln:4, Col:1" />
                <LineMapInfo line="73" column="5" position="Net:3, Ln:2, Col:14" />
                <LineMapInfo line="74" column="4" position="Net:3, Ln:1, Col:24 [Block input IN]" />
                <LineMapInfo line="75" column="4" position="Net:3, Ln:3, Col:20" />
                <LineMapInfo line="76" column="4" position="Net:3, Ln:1, Col:24 [Block input PT]" />
                <LineMapInfo line="77" column="5" position="Net:3, Ln:1, Col:24" />
                <LineMapInfo line="78" column="4" position="Net:3, Ln:1, Col:24 [Block output Q]" />
                <LineMapInfo line="80" column="5" position="Net:3, Ln:2, Col:28" />
                <LineMapInfo line="82" column="3" position="Net:3, Ln:2, Col:41" />
                <LineMapInfo line="83" column="4" position="Net:3, Ln:2, Col:28" />
                <LineMapInfo line="84" column="4" position="Net:3, Ln:3, Col:37 [Block input EN]" />
                <LineMapInfo line="86" column="10" position="Net:3, Ln:3, Col:37" />
                <LineMapInfo line="87" column="4" position="Net:3, Ln:4, Col:41" />
                <LineMapInfo line="89" column="4" position="Net:3, Ln:1, Col:24 [Block output Q]" />
                <LineMapInfo line="90" column="5" position="Net:3, Ln:5, Col:28" />
                <LineMapInfo line="91" column="6" position="Net:3, Ln:5, Col:33" />
                <LineMapInfo line="93" column="4" position="Net:3, Ln:5, Col:37 [Block input EN]" />
                <LineMapInfo line="95" column="10" position="Net:3, Ln:5, Col:37" />
                <LineMapInfo line="96" column="4" position="Net:3, Ln:6, Col:41" />
                <LineMapInfo line="98" column="4" position="Net:3, Ln:5, Col:33" />
                <LineMapInfo line="99" column="3" position="Net:3, Ln:7, Col:41" />
                <LineMapInfo line="100" column="4" position="Net:3, Ln:1, Col:24 [Block output Q]" />
                <LineMapInfo line="101" column="6" position="Net:3, Ln:8, Col:28" />
                <LineMapInfo line="102" column="6" position="Net:3, Ln:8, Col:33" />
                <LineMapInfo line="104" column="3" position="Net:3, Ln:8, Col:41" />
                <LineMapInfo line="105" column="4" position="Net:3, Ln:8, Col:33" />
                <LineMapInfo line="106" column="4" position="Net:3, Ln:9, Col:37 [Block input EN]" />
                <LineMapInfo line="108" column="10" position="Net:3, Ln:9, Col:37" />
                <LineMapInfo line="109" column="4" position="Net:3, Ln:10, Col:41" />
                <LineMapInfo line="112" column="1" position="Net:4" />
                <LineMapInfo line="113" column="1" position="Net:4" />
                <LineMapInfo line="114" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="116" column="4" position="Net:4, Ln:2, Col:6 [Block input EN]" />
                <LineMapInfo line="118" column="10" position="Net:4, Ln:2, Col:6" />
                <LineMapInfo line="119" column="4" position="Net:4, Ln:3, Col:10" />
                <LineMapInfo line="121" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="122" column="5" position="Net:4, Ln:1, Col:6" />
                <LineMapInfo line="123" column="4" position="Net:4, Ln:2, Col:6 [Block output ENO]" />
                <LineMapInfo line="125" column="5" position="Net:4, Ln:1, Col:14" />
                <LineMapInfo line="126" column="5" position="Net:4, Ln:1, Col:19" />
                <LineMapInfo line="128" column="5" position="Net:4, Ln:1, Col:24" />
                <LineMapInfo line="130" column="3" position="Net:4, Ln:1, Col:41" />
                <LineMapInfo line="131" column="4" position="Net:4, Ln:1, Col:24" />
                <LineMapInfo line="132" column="4" position="Net:4, Ln:2, Col:37 [Block input EN]" />
                <LineMapInfo line="134" column="10" position="Net:4, Ln:2, Col:37" />
                <LineMapInfo line="135" column="4" position="Net:4, Ln:3, Col:41" />
                <LineMapInfo line="137" column="4" position="Net:4, Ln:1, Col:19" />
                <LineMapInfo line="138" column="5" position="Net:4, Ln:4, Col:24" />
                <LineMapInfo line="139" column="6" position="Net:4, Ln:4, Col:29" />
                <LineMapInfo line="141" column="3" position="Net:4, Ln:4, Col:41" />
                <LineMapInfo line="142" column="4" position="Net:4, Ln:4, Col:29" />
                <LineMapInfo line="143" column="4" position="Net:4, Ln:5, Col:37 [Block input EN]" />
                <LineMapInfo line="145" column="10" position="Net:4, Ln:5, Col:37" />
                <LineMapInfo line="146" column="4" position="Net:4, Ln:6, Col:41" />
                <LineMapInfo line="148" column="4" position="Net:4, Ln:1, Col:19" />
                <LineMapInfo line="149" column="6" position="Net:4, Ln:7, Col:24" />
                <LineMapInfo line="150" column="6" position="Net:4, Ln:7, Col:29" />
                <LineMapInfo line="152" column="3" position="Net:4, Ln:7, Col:41" />
                <LineMapInfo line="153" column="4" position="Net:4, Ln:7, Col:29" />
                <LineMapInfo line="154" column="4" position="Net:4, Ln:8, Col:37 [Block input EN]" />
                <LineMapInfo line="156" column="10" position="Net:4, Ln:8, Col:37" />
                <LineMapInfo line="157" column="4" position="Net:4, Ln:9, Col:41" />
                <LineMapInfo line="160" column="6" position="Net:4, Ln:10, Col:14" />
                <LineMapInfo line="161" column="3" position="Net:4, Ln:10, Col:41" />
                <LineMapInfo line="163" column="1" position="Net:5" />
                <LineMapInfo line="164" column="1" position="Net:5" />
                <LineMapInfo line="165" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="167" column="5" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="169" column="3" position="Net:5, Ln:1, Col:41" />
                <LineMapInfo line="170" column="4" position="Net:5, Ln:1, Col:5" />
                <LineMapInfo line="171" column="4" position="Net:5, Ln:2, Col:36 [Block input EN]" />
                <LineMapInfo line="173" column="10" position="Net:5, Ln:2, Col:36" />
                <LineMapInfo line="174" column="4" position="Net:5, Ln:3, Col:41" />
                <LineMapInfo line="176" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="177" column="6" position="Net:5, Ln:4, Col:5" />
                <LineMapInfo line="179" column="3" position="Net:5, Ln:4, Col:41" />
                <LineMapInfo line="180" column="4" position="Net:5, Ln:4, Col:5" />
                <LineMapInfo line="181" column="4" position="Net:5, Ln:5, Col:34 [Block input EN]" />
                <LineMapInfo line="183" column="10" position="Net:5, Ln:5, Col:34" />
                <LineMapInfo line="184" column="4" position="Net:5, Ln:6, Col:41" />
                <LineMapInfo line="187" column="1" position="Net:6" />
                <LineMapInfo line="188" column="1" position="Net:6" />
                <LineMapInfo line="189" column="5" position="Net:6, Ln:1, Col:1" />
                <LineMapInfo line="190" column="3" position="Net:6, Ln:1, Col:41" />
                <LineMapInfo line="192" column="1" position="Net:7" />
                <LineMapInfo line="193" column="1" position="Net:7" />
                <LineMapInfo line="194" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="196" column="4" position="Net:7, Ln:1, Col:35 [Block input EN]" />
                <LineMapInfo line="198" column="10" position="Net:7, Ln:1, Col:35" />
                <LineMapInfo line="199" column="4" position="Net:7, Ln:2, Col:40" />
                <LineMapInfo line="201" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="202" column="4" position="Net:7, Ln:3, Col:35 [Block input EN]" />
                <LineMapInfo line="204" column="10" position="Net:7, Ln:3, Col:35" />
                <LineMapInfo line="205" column="4" position="Net:7, Ln:4, Col:40" />
                <LineMapInfo line="207" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="208" column="4" position="Net:7, Ln:5, Col:40" />
                <LineMapInfo line="209" column="5" position="Net:7, Ln:6, Col:5" />
                <LineMapInfo line="210" column="4" position="Net:7, Ln:6, Col:40" />
                <LineMapInfo line="211" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="212" column="5" position="Net:7, Ln:7, Col:5" />
                <LineMapInfo line="213" column="4" position="Net:7, Ln:7, Col:39" />
                <LineMapInfo line="214" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="215" column="5" position="Net:7, Ln:8, Col:5" />
                <LineMapInfo line="216" column="4" position="Net:7, Ln:8, Col:39" />
                <LineMapInfo line="217" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="218" column="5" position="Net:7, Ln:9, Col:5" />
                <LineMapInfo line="219" column="4" position="Net:7, Ln:9, Col:40" />
                <LineMapInfo line="220" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="221" column="5" position="Net:7, Ln:10, Col:5" />
                <LineMapInfo line="222" column="4" position="Net:7, Ln:10, Col:40" />
                <LineMapInfo line="223" column="4" position="Net:7, Ln:1, Col:1" />
                <LineMapInfo line="224" column="5" position="Net:7, Ln:11, Col:5" />
                <LineMapInfo line="225" column="4" position="Net:7, Ln:11, Col:40" />
                <LineMapInfo line="227" column="1" position="Net:8" />
                <LineMapInfo line="228" column="1" position="Net:8" />
                <LineMapInfo line="229" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="231" column="4" position="Net:8, Ln:1, Col:41" />
                <LineMapInfo line="232" column="5" position="Net:8, Ln:2, Col:6" />
                <LineMapInfo line="233" column="4" position="Net:8, Ln:2, Col:41" />
                <LineMapInfo line="234" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="235" column="5" position="Net:8, Ln:3, Col:6" />
                <LineMapInfo line="236" column="4" position="Net:8, Ln:3, Col:41" />
                <LineMapInfo line="237" column="4" position="Net:8, Ln:1, Col:1" />
                <LineMapInfo line="238" column="5" position="Net:8, Ln:4, Col:6" />
                <LineMapInfo line="239" column="4" position="Net:8, Ln:4, Col:40" />
                <LineMapInfo line="241" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="6CF9B0A1" />
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
                <RelPosition x="1203" y="18" />
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
                <RelPosition x="1233" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
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
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" edge="none">
                <RelPosition x="123" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
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
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diProductAvailable" edge="none">
                <RelPosition x="243" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="1143" y="18" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="1143" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Stopped" negated="true" edge="none" latch="none">
                <RelPosition x="1173" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="IdentifyState">
                <RelPosition x="1233" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="152" />
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
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="3" label="IdentifyState">
              <Documentation xsi:type="SimpleText"><![CDATA[For cap identification]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="2">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.CapIsSorted" edge="none">
                <RelPosition x="3" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="1" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="3" y="132" />
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
                    <ComputeBlock><![CDATA[ccCAP_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="153" y="38" />
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="273" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" edge="none">
                <RelPosition x="393" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="Timer.TIME_DELAY">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="573" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="TON" instanceName="Timer.DetectTime">
                <RelPosition x="693" y="38" />
                <Size x="120" y="76" />
                <InputVariables>
                  <InputVariable parameterName="IN">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="7" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="PT">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="8" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Q">
                    <ConnectionPointOut connectionPointOutId="9">
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
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" edge="none">
                <RelPosition x="813" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" edge="none">
                <RelPosition x="813" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" negated="true" edge="none">
                <RelPosition x="813" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="963" y="170" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="963" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_METAL]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="76" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_RED]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="17">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="18">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_BLACK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="304" />
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
                    <ConnectionPointOut connectionPointOutId="19">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="20">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="IdentifyInManual">
              <Documentation xsi:type="SimpleText"><![CDATA[For cap identification in manual mode]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="153" y="38" />
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
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="273" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diProductAvailable" edge="none">
                <RelPosition x="393" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diProductAvailable" negated="true" edge="none">
                <RelPosition x="393" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.ManualDetect" edge="none">
                <RelPosition x="543" y="18" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" edge="none">
                <RelPosition x="693" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" edge="none">
                <RelPosition x="693" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diCapIsShiny" negated="true" edge="none">
                <RelPosition x="693" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="843" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="IO.Inputs.diMetalCap" negated="true" edge="none">
                <RelPosition x="843" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_METAL]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="38" />
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
                    <ConnectionPointOut connectionPointOutId="14">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="15">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[ccCAP_RED]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="152" />
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
                      <Connection refConnectionPointOutId="12" />
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
                    <ComputeBlock><![CDATA[ccCAP_BLACK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1083" y="266" />
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="18" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="set">
                <RelPosition x="1203" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="reset">
                <RelPosition x="1203" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="380" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="21" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="22" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="23" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="ModuleOkCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Checks, sets, and resets, ModuleOK for DI IO slice]]></Documentation>
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
                    <ComputeBlock><![CDATA[cdERROR_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="993" y="152" />
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
                <RelPosition x="1053" y="38" />
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
                <RelPosition x="1203" y="18" />
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
                <RelPosition x="1203" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1203" y="132" />
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
                <RelPosition x="1203" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
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
            <Rung evaluationOrder="6" label="DoneReset">
              <Documentation xsi:type="SimpleText"><![CDATA[Resets done status when no product is detected]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Par.ProductAvailable" negated="true" edge="none">
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
              <LdObject xsi:type="Coil" operand="Internal.Status.Done" edge="none" latch="reset">
                <RelPosition x="1203" y="18" />
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
                <RelPosition x="1323" y="0" />
                <Size x="3" y="38" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="7" label="InternalToGlobal">
              <Documentation xsi:type="SimpleText"><![CDATA[Assigns internal to global]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="418" />
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Done" edge="none">
                <RelPosition x="123" y="208" />
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
                <RelPosition x="123" y="246" />
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Error" edge="none">
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
              <LdObject xsi:type="Contact" operand="Internal.Status.Stopped" edge="none">
                <RelPosition x="123" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="gCapDetect.Status.CapIsSorted" edge="none">
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Status.ErrorID]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1023" y="0" />
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
                    <ComputeBlock><![CDATA[Internal.Par.CapColor]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1023" y="76" />
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
              <LdObject xsi:type="Coil" operand="gCapDetect.Par.ProductAvailable" edge="none" latch="none">
                <RelPosition x="1143" y="246" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.ModuleOk" edge="none" latch="none">
                <RelPosition x="1143" y="284" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Status.ErrorID">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1173" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gCapDetect.Par.CapColor">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1173" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Active" edge="none" latch="none">
                <RelPosition x="1173" y="170" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Done" edge="none" latch="none">
                <RelPosition x="1173" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Error" edge="none" latch="none">
                <RelPosition x="1173" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="gCapDetect.Status.Stopped" edge="none" latch="none">
                <RelPosition x="1173" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.CapIsSorted" edge="none" latch="none">
                <RelPosition x="1173" y="398" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="418" />
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
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="370" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="408" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="8" label="GlobalToInternal">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.Start" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.Stop" edge="none">
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
              <LdObject xsi:type="Contact" operand="gCapDetect.Cmd.ManualDetect" edge="none">
                <RelPosition x="153" y="132" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="180" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.ManualDetect" edge="none" latch="none">
                <RelPosition x="1173" y="132" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Enable" edge="none" latch="none">
                <RelPosition x="1203" y="18" />
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
                <RelPosition x="1203" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Cmd.Stop" edge="none" latch="none">
                <RelPosition x="1203" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="152" />
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
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                  <Connection refConnectionPointOutId="6" />
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