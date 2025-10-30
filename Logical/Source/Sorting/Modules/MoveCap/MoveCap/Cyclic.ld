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
 * Description: This task handles conveyor movement based on information from the mananger.
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
	zz$$$$_0_Internal_Cmd_Enable_And : BOOL;
	zz$$$$_1_Internal_Status_ModuleO : BOOL;
	zz$$$$_2_Eno_ComputeBlock : BOOL;
	zz$$$$_3_Internal_Status_ModuleO : BOOL;
	zz$$$$_4_Eno_ComputeBlock : BOOL;
	zz$$$$_5_Internal_Status_Active_ : BOOL;
	zz$$$$_6_Internal_Status_Active_ : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_Eno_ComputeBlock : BOOL;
	zz$$$$_9_Eno_ComputeBlock : BOOL;
	zz$$$$_10_Eno_ComputeBlock : BOOL;
	zz$$$$_11_Eno_ComputeBlock : BOOL;
	zz$$$$_12_Eno_ComputeBlock : BOOL;
	zz$$$$_13_gMoveCap_Cmd_Enable_An : BOOL;
	zz$$$$_14_Eno_ComputeBlock : BOOL;
	zz$$$$_15_Eno_ComputeBlock : BOOL;
	zz$$$$_16_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
PowerAndHomeState:
LD	TRUE
ST	SortingConveyor.Enable
LD	Internal.Status.Active {CheckDataType := BOOL}
AND	Internal.Cmd.UpdatePars {CheckDataType := BOOL}
ST	SortingConveyor.Update
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	SortingConveyor.Active {CheckDataType := BOOL}
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
AND	Internal.Cmd.PowerOn {CheckDataType := BOOL}
ST	SortingConveyor.Power
LD	SortingConveyor.PowerOn {CheckDataType := BOOL}
ST	SortingConveyor.Home
LD	Internal.Status.Active {CheckDataType := BOOL}
AND	Internal.Cmd.Start {CheckDataType := BOOL}
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
AND	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
ST	SortingConveyor.MoveVelocity
LD	Internal.Status.Active {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
AND	Internal.Cmd.JogFwd {CheckDataType := BOOL}
ST	SortingConveyor.JogPositive
LD	Internal.Status.Active {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
AND	Internal.Cmd.JogBkwd {CheckDataType := BOOL}
ST	SortingConveyor.JogNegative
CAL	SortingConveyor
LD	SortingConveyor.Error
ST	Internal.Status.Error
LD	SortingConveyor.MoveActive
ST	Internal.Status.Done
LD	SortingConveyor.Active
AND	SortingConveyor.IsHomed {CheckDataType := BOOL}
ST	Internal.Status.Active {CheckDataType := BOOL}

{NetworkNumber := 2}
ModuleOkCheck:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_0_Internal_Cmd_Enable_And
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_1_Internal_Status_ModuleO
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_1_Internal_Status_ModuleO
ST	zz$$$$_2_Eno_ComputeBlock
JMPCN ll$$$$_IF_0
Compute!	mcERROR_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_0:
LD	zz$$$$_0_Internal_Cmd_Enable_And
ANDN	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_3_Internal_Status_ModuleO
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_3_Internal_Status_ModuleO
ST	zz$$$$_4_Eno_ComputeBlock
JMPCN ll$$$$_IF_1
Compute!	mcERROR_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_1:

{NetworkNumber := 3}
StopStatusAssignment:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_5_Internal_Status_Active_
AND	Internal.Cmd.Stop {CheckDataType := BOOL}
S	Internal.Status.Stopped {CheckDataType := BOOL}
LD	zz$$$$_5_Internal_Status_Active_
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
R	Internal.Status.Stopped {CheckDataType := BOOL}

{NetworkNumber := 4}
UpdateJogPars:
LD	Internal.Status.Active {CheckDataType := BOOL}
ST	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	Internal.Par.JogVel
ST	SortingConveyorPar.Jog.Velocity
ll$$$$_IF_2:
LD	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_8_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	Internal.Par.JogAccel
ST	SortingConveyorPar.Jog.Acceleration
ll$$$$_IF_3:
LD	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_9_Eno_ComputeBlock
JMPCN ll$$$$_IF_4
Compute!	Internal.Par.JogDecel
ST	SortingConveyorPar.Jog.Deceleration
ll$$$$_IF_4:
LD	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_10_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	Internal.Par.Vel
ST	SortingConveyorPar.Velocity
ll$$$$_IF_5:
LD	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_11_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Par.Accel
ST	SortingConveyorPar.Acceleration
ll$$$$_IF_6:
LD	zz$$$$_6_Internal_Status_Active_
ST	zz$$$$_12_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	Internal.Par.Decel
ST	SortingConveyorPar.Deceleration
ll$$$$_IF_7:

{NetworkNumber := 5}
Assignments:
LD	gMoveCap.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_13_gMoveCap_Cmd_Enable_An
ST	zz$$$$_14_Eno_ComputeBlock
JMPCN ll$$$$_IF_8
Compute!	gMoveCap.Cmd
ST	Internal.Cmd
ll$$$$_IF_8:
LD	zz$$$$_13_gMoveCap_Cmd_Enable_An
ST	zz$$$$_15_Eno_ComputeBlock
JMPCN ll$$$$_IF_9
Compute!	gMoveCap.Par
ST	Internal.Par
ll$$$$_IF_9:
LD	zz$$$$_13_gMoveCap_Cmd_Enable_An
ST	zz$$$$_16_Eno_ComputeBlock
JMPCN ll$$$$_IF_10
Compute!	Internal.Status
ST	gMoveCap.Status
ll$$$$_IF_10:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="24" column="1" position="Net:1" />
                <LineMapInfo line="25" column="1" position="Net:1" />
                <LineMapInfo line="26" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="27" column="4" position="Net:1, Ln:1, Col:20 [Block input Enable]" />
                <LineMapInfo line="28" column="4" position="Net:1, Ln:6, Col:1" />
                <LineMapInfo line="29" column="5" position="Net:1, Ln:6, Col:5" />
                <LineMapInfo line="30" column="4" position="Net:1, Ln:1, Col:20 [Block input Update]" />
                <LineMapInfo line="31" column="4" position="Net:1, Ln:7, Col:1" />
                <LineMapInfo line="32" column="5" position="Net:1, Ln:7, Col:5" />
                <LineMapInfo line="33" column="5" position="Net:1, Ln:7, Col:10" />
                <LineMapInfo line="34" column="5" position="Net:1, Ln:7, Col:15" />
                <LineMapInfo line="35" column="4" position="Net:1, Ln:1, Col:20 [Block input Power]" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:8, Col:1" />
                <LineMapInfo line="37" column="4" position="Net:1, Ln:1, Col:20 [Block input Home]" />
                <LineMapInfo line="38" column="4" position="Net:1, Ln:9, Col:1" />
                <LineMapInfo line="39" column="5" position="Net:1, Ln:9, Col:5" />
                <LineMapInfo line="40" column="6" position="Net:1, Ln:9, Col:9" />
                <LineMapInfo line="41" column="5" position="Net:1, Ln:9, Col:13" />
                <LineMapInfo line="42" column="4" position="Net:1, Ln:1, Col:20 [Block input MoveVelocity]" />
                <LineMapInfo line="43" column="4" position="Net:1, Ln:13, Col:1" />
                <LineMapInfo line="44" column="6" position="Net:1, Ln:13, Col:5" />
                <LineMapInfo line="45" column="5" position="Net:1, Ln:13, Col:10" />
                <LineMapInfo line="46" column="4" position="Net:1, Ln:1, Col:20 [Block input JogPositive]" />
                <LineMapInfo line="47" column="4" position="Net:1, Ln:14, Col:1" />
                <LineMapInfo line="48" column="6" position="Net:1, Ln:14, Col:5" />
                <LineMapInfo line="49" column="5" position="Net:1, Ln:14, Col:10" />
                <LineMapInfo line="50" column="4" position="Net:1, Ln:1, Col:20 [Block input JogNegative]" />
                <LineMapInfo line="51" column="5" position="Net:1, Ln:1, Col:20" />
                <LineMapInfo line="52" column="4" position="Net:1, Ln:1, Col:20 [Block output Error]" />
                <LineMapInfo line="53" column="4" position="Net:1, Ln:3, Col:27" />
                <LineMapInfo line="54" column="4" position="Net:1, Ln:1, Col:20 [Block output MoveActive]" />
                <LineMapInfo line="55" column="4" position="Net:1, Ln:14, Col:27" />
                <LineMapInfo line="56" column="4" position="Net:1, Ln:1, Col:20 [Block output Active]" />
                <LineMapInfo line="57" column="5" position="Net:1, Ln:2, Col:31" />
                <LineMapInfo line="58" column="4" position="Net:1, Ln:2, Col:36" />
                <LineMapInfo line="60" column="1" position="Net:2" />
                <LineMapInfo line="61" column="1" position="Net:2" />
                <LineMapInfo line="62" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="64" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="66" column="3" position="Net:2, Ln:1, Col:36" />
                <LineMapInfo line="67" column="4" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="68" column="4" position="Net:2, Ln:2, Col:31 [Block input EN]" />
                <LineMapInfo line="70" column="10" position="Net:2, Ln:2, Col:31" />
                <LineMapInfo line="71" column="4" position="Net:2, Ln:3, Col:36" />
                <LineMapInfo line="73" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="74" column="6" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="76" column="3" position="Net:2, Ln:4, Col:36" />
                <LineMapInfo line="77" column="4" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="78" column="4" position="Net:2, Ln:5, Col:29 [Block input EN]" />
                <LineMapInfo line="80" column="10" position="Net:2, Ln:5, Col:29" />
                <LineMapInfo line="81" column="4" position="Net:2, Ln:6, Col:36" />
                <LineMapInfo line="84" column="1" position="Net:3" />
                <LineMapInfo line="85" column="1" position="Net:3" />
                <LineMapInfo line="86" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="88" column="5" position="Net:3, Ln:1, Col:5" />
                <LineMapInfo line="89" column="3" position="Net:3, Ln:1, Col:35" />
                <LineMapInfo line="90" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="91" column="6" position="Net:3, Ln:2, Col:5" />
                <LineMapInfo line="92" column="3" position="Net:3, Ln:2, Col:35" />
                <LineMapInfo line="94" column="1" position="Net:4" />
                <LineMapInfo line="95" column="1" position="Net:4" />
                <LineMapInfo line="96" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="98" column="4" position="Net:4, Ln:1, Col:29 [Block input EN]" />
                <LineMapInfo line="100" column="10" position="Net:4, Ln:1, Col:29" />
                <LineMapInfo line="101" column="4" position="Net:4, Ln:2, Col:34" />
                <LineMapInfo line="103" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="104" column="4" position="Net:4, Ln:3, Col:28 [Block input EN]" />
                <LineMapInfo line="106" column="10" position="Net:4, Ln:3, Col:28" />
                <LineMapInfo line="107" column="4" position="Net:4, Ln:4, Col:33" />
                <LineMapInfo line="109" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="110" column="4" position="Net:4, Ln:5, Col:28 [Block input EN]" />
                <LineMapInfo line="112" column="10" position="Net:4, Ln:5, Col:28" />
                <LineMapInfo line="113" column="4" position="Net:4, Ln:6, Col:33" />
                <LineMapInfo line="115" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="116" column="4" position="Net:4, Ln:7, Col:30 [Block input EN]" />
                <LineMapInfo line="118" column="10" position="Net:4, Ln:7, Col:30" />
                <LineMapInfo line="119" column="4" position="Net:4, Ln:8, Col:34" />
                <LineMapInfo line="121" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="122" column="4" position="Net:4, Ln:9, Col:29 [Block input EN]" />
                <LineMapInfo line="124" column="10" position="Net:4, Ln:9, Col:29" />
                <LineMapInfo line="125" column="4" position="Net:4, Ln:10, Col:34" />
                <LineMapInfo line="127" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="128" column="4" position="Net:4, Ln:11, Col:29 [Block input EN]" />
                <LineMapInfo line="130" column="10" position="Net:4, Ln:11, Col:29" />
                <LineMapInfo line="131" column="4" position="Net:4, Ln:12, Col:34" />
                <LineMapInfo line="134" column="1" position="Net:5" />
                <LineMapInfo line="135" column="1" position="Net:5" />
                <LineMapInfo line="136" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="138" column="4" position="Net:5, Ln:1, Col:33 [Block input EN]" />
                <LineMapInfo line="140" column="10" position="Net:5, Ln:1, Col:33" />
                <LineMapInfo line="141" column="4" position="Net:5, Ln:2, Col:37" />
                <LineMapInfo line="143" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="144" column="4" position="Net:5, Ln:3, Col:33 [Block input EN]" />
                <LineMapInfo line="146" column="10" position="Net:5, Ln:3, Col:33" />
                <LineMapInfo line="147" column="4" position="Net:5, Ln:4, Col:37" />
                <LineMapInfo line="149" column="4" position="Net:5, Ln:1, Col:1" />
                <LineMapInfo line="150" column="4" position="Net:5, Ln:5, Col:32 [Block input EN]" />
                <LineMapInfo line="152" column="10" position="Net:5, Ln:5, Col:32" />
                <LineMapInfo line="153" column="4" position="Net:5, Ln:6, Col:36" />
                <LineMapInfo line="156" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="A46BC3DF" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="PowerAndHomeState">
              <Documentation xsi:type="SimpleText"><![CDATA[Powers and homes the axis]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="760" />
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="28" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="66" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="1">
                  <RelPosition x="3" y="104" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="142" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="180" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="3" y="218" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="3" y="256" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="3" y="294" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="5">
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
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="3" y="484" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="3" y="522" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="560" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="598" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="636" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="674" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="712" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="750" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="3" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Enable" edge="none">
                <RelPosition x="3" y="246" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.PowerOn" edge="none">
                <RelPosition x="3" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="3" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="3" y="474" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.Active" edge="none">
                <RelPosition x="3" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.UpdatePars" edge="none">
                <RelPosition x="123" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="14">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.Active" edge="none">
                <RelPosition x="123" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="15">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Start" edge="none">
                <RelPosition x="123" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="16">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" negated="true" edge="none">
                <RelPosition x="123" y="474" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="17">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" negated="true" edge="none">
                <RelPosition x="123" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="13" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="18">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="243" y="322" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="19">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
                <RelPosition x="273" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="20">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.JogFwd" edge="none">
                <RelPosition x="273" y="474" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="17" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="21">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.JogBkwd" edge="none">
                <RelPosition x="273" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="18" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="22">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" edge="none">
                <RelPosition x="363" y="322" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="19" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="23">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.PowerOn" edge="none">
                <RelPosition x="423" y="246" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="20" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="24">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="SortingConveyor">
                <RelPosition x="573" y="38" />
                <Size x="210" y="722" />
                <InputVariables>
                  <InputVariable parameterName="MpLink">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                      <Connection refConnectionPointOutId="1" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ErrorReset">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Parameters">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Update">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="180" />
                      <Connection refConnectionPointOutId="14" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Power">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="218" />
                      <Connection refConnectionPointOutId="24" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Home">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="256" />
                      <Connection refConnectionPointOutId="10" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveVelocity">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="294" />
                      <Connection refConnectionPointOutId="23" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAbsolute">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="332" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAdditive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="370" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Stop">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="408" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogPositive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="446" />
                      <Connection refConnectionPointOutId="21" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogNegative">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="484" />
                      <Connection refConnectionPointOutId="22" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="LimitLoad">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="522" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ReleaseBrake">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="560" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Simulate">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="598" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="AutoTune">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="636" />
                    </ConnectionPointIn>
                  </InputVariable>
                </InputVariables>
                <OutputVariables>
                  <OutputVariable parameterName="Active">
                    <ConnectionPointOut connectionPointOutId="25">
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Error">
                    <ConnectionPointOut connectionPointOutId="26">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="StatusID">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="104" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="UpdateDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="142" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Position">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="180" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Velocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="218" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandBusy">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="256" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandAborted">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="294" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="PowerOn">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="332" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="IsHomed">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="370" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InVelocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="408" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InPosition">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="446" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveActive">
                    <ConnectionPointOut connectionPointOutId="27">
                      <RelPosition x="210" y="484" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="522" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Stopped">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="560" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="LimitLoadReady">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="598" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="BrakeReleased">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="636" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="AutoTuneDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="674" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Info">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="712" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.Error">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="26" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.Done">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="27" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.IsHomed" edge="none">
                <RelPosition x="903" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="25" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="28">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Active" edge="none" latch="none">
                <RelPosition x="1053" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="28" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="29">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1173" y="0" />
                <Size x="3" y="760" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="29" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="104" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="142" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="180" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="218" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="256" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="294" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="332" />
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
                <ConnectionPointIn>
                  <RelPosition x="0" y="484" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="522" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="560" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="598" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="636" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="674" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="712" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="750" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="2" label="ModuleOkCheck">
              <Documentation xsi:type="SimpleText"><![CDATA[Checks if the X67 Module is okay]]></Documentation>
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
                    <ComputeBlock><![CDATA[mcERROR_MODULE_NOT_OK]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="152" />
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
                    <ComputeBlock><![CDATA[mcERROR_NONE]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="903" y="38" />
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
                <RelPosition x="1053" y="18" />
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
                <RelPosition x="1053" y="94" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Error" edge="none" latch="set">
                <RelPosition x="1053" y="132" />
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
                <RelPosition x="1053" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1173" y="0" />
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
            <Rung evaluationOrder="3" label="StopStatusAssignment">
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
                <RelPosition x="1023" y="18" />
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
                <RelPosition x="1023" y="56" />
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
                <RelPosition x="1173" y="0" />
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
            <Rung evaluationOrder="4" label="UpdateJogPars">
              <Documentation xsi:type="SimpleText"><![CDATA[This network handles updatting jog pars from manual mode]]></Documentation>
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.JogAccel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="813" y="76" />
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
                    <ComputeBlock><![CDATA[Internal.Par.JogDecel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="813" y="152" />
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
                    <ComputeBlock><![CDATA[Internal.Par.JogVel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="0" />
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
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[Internal.Par.Accel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="304" />
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
                    <ComputeBlock><![CDATA[Internal.Par.Decel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="843" y="380" />
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
                    <ComputeBlock><![CDATA[Internal.Par.Vel]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="873" y="228" />
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
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Jog.Acceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="963" y="132" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Jog.Deceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="963" y="208" />
                <Size x="210" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Jog.Velocity">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="993" y="56" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Velocity">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="993" y="284" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="14" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Acceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="993" y="360" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="SortingConveyorPar.Deceleration">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="993" y="436" />
                <Size x="180" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="12" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1173" y="0" />
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
                  <Connection refConnectionPointOutId="3" />
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
                  <Connection refConnectionPointOutId="13" />
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
                  <Connection refConnectionPointOutId="11" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="446" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="5" label="Assignments">
              <Documentation xsi:type="SimpleText"><![CDATA[This network does structure assignments]]></Documentation>
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
              <LdObject xsi:type="Contact" operand="gMoveCap.Cmd.Enable" edge="none">
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
                    <ComputeBlock><![CDATA[Internal.Status]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="933" y="152" />
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
                    <ConnectionPointOut connectionPointOutId="3">
                      <RelPosition x="120" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="">
                    <ConnectionPointOut connectionPointOutId="4">
                      <RelPosition x="120" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="Compute">
                <AddData>
                  <Data name="BR_ComputeBlock" handleUnknown="implementation">
                    <ComputeBlock><![CDATA[gMoveCap.Cmd]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="963" y="0" />
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
                    <ComputeBlock><![CDATA[gMoveCap.Par]]></ComputeBlock>
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
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Status">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1053" y="208" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Cmd">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1083" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1173" y="0" />
                <Size x="3" y="228" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                  <Connection refConnectionPointOutId="5" />
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
                  <Connection refConnectionPointOutId="3" />
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