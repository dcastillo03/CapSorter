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
	zz$$$$_0_Eno_MpAxisBasic_Sorting : BOOL;
	zz$$$$_1_Eno_MpAxisBasic_Sorting : BOOL;
	zz$$$$_2_SortingConveyor_IsHomed : BOOL;
	zz$$$$_3_Internal_Cmd_Enable_And : BOOL;
	zz$$$$_4_Internal_Status_ModuleO : BOOL;
	zz$$$$_5_Eno_ComputeBlock : BOOL;
	zz$$$$_6_Internal_Status_ModuleO : BOOL;
	zz$$$$_7_Eno_ComputeBlock : BOOL;
	zz$$$$_8_Eno_MpAxisBasic_Sorting : BOOL;
	zz$$$$_9_gMoveCap_Cmd_Enable_And : BOOL;
	zz$$$$_10_Eno_ComputeBlock : BOOL;
	zz$$$$_11_Eno_ComputeBlock : BOOL;
	zz$$$$_12_Eno_ComputeBlock : BOOL;
END_VAR


{NetworkNumber := 1}
PowerAndHomeState:
LD	TRUE
ST	zz$$$$_0_Eno_MpAxisBasic_Sorting
JMPCN ll$$$$_IF_0
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
AND	SortingConveyor.Active {CheckDataType := BOOL}
ST	SortingConveyor.Power
CAL	SortingConveyor
ll$$$$_IF_0:
LD	zz$$$$_0_Eno_MpAxisBasic_Sorting
AND	SortingConveyor.PowerOn {CheckDataType := BOOL}
ST	zz$$$$_1_Eno_MpAxisBasic_Sorting
JMPCN ll$$$$_IF_1
LD	TRUE
ST	SortingConveyor.Home
CAL	SortingConveyor
ll$$$$_IF_1:
LD	zz$$$$_1_Eno_MpAxisBasic_Sorting
AND	SortingConveyor.IsHomed {CheckDataType := BOOL}
ST	zz$$$$_2_SortingConveyor_IsHomed
ST	Internal.Status.Active {CheckDataType := BOOL}
JMPC	ReceivingState

{NetworkNumber := 2}
ModuleOkCheck:
LD	Internal.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_3_Internal_Cmd_Enable_And
AND	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_4_Internal_Status_ModuleO
R	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_4_Internal_Status_ModuleO
ST	zz$$$$_5_Eno_ComputeBlock
JMPCN ll$$$$_IF_2
Compute!	mcERROR_NONE
ST	Internal.Status.ErrorID
ll$$$$_IF_2:
LD	zz$$$$_3_Internal_Cmd_Enable_And
ANDN	Internal.Status.ModuleOk {CheckDataType := BOOL}
ST	zz$$$$_6_Internal_Status_ModuleO
S	Internal.Status.Error {CheckDataType := BOOL}
LD	zz$$$$_6_Internal_Status_ModuleO
ST	zz$$$$_7_Eno_ComputeBlock
JMPCN ll$$$$_IF_3
Compute!	mcERROR_MODULE_NOT_OK
ST	Internal.Status.ErrorID
ll$$$$_IF_3:

{NetworkNumber := 3}
ReceivingState:
LD	TRUE
ST	zz$$$$_8_Eno_MpAxisBasic_Sorting
JMPCN ll$$$$_IF_4
LD	Internal.Cmd.Start {CheckDataType := BOOL}
ANDN	Internal.Cmd.Stop {CheckDataType := BOOL}
AND	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
ST	SortingConveyor.MoveVelocity
LDN	Internal.Cmd.Stop {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
AND	Internal.Cmd.JogFwd {CheckDataType := BOOL}
ST	SortingConveyor.JogPositive
LDN	Internal.Cmd.Stop {CheckDataType := BOOL}
ANDN	Internal.Cmd.MoveFwd {CheckDataType := BOOL}
AND	Internal.Cmd.JogBkwd {CheckDataType := BOOL}
ST	SortingConveyor.JogNegative
CAL	SortingConveyor
LD	SortingConveyor.Error
ST	Internal.Status.Error
LD	SortingConveyor.MoveActive
ST	Internal.Status.Done
ll$$$$_IF_4:

{NetworkNumber := 4}
Assignments:
LD	gMoveCap.Cmd.Enable {CheckDataType := BOOL}
ST	zz$$$$_9_gMoveCap_Cmd_Enable_And
ST	zz$$$$_10_Eno_ComputeBlock
JMPCN ll$$$$_IF_5
Compute!	gMoveCap.Cmd
ST	Internal.Cmd
ll$$$$_IF_5:
LD	zz$$$$_9_gMoveCap_Cmd_Enable_And
ST	zz$$$$_11_Eno_ComputeBlock
JMPCN ll$$$$_IF_6
Compute!	Internal.Par
ST	gMoveCap.Par
ll$$$$_IF_6:
LD	zz$$$$_9_gMoveCap_Cmd_Enable_And
ST	zz$$$$_12_Eno_ComputeBlock
JMPCN ll$$$$_IF_7
Compute!	Internal.Status
ST	gMoveCap.Status
ll$$$$_IF_7:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="20" column="1" position="Net:1" />
                <LineMapInfo line="21" column="1" position="Net:1" />
                <LineMapInfo line="22" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="23" column="4" position="Net:1, Ln:1, Col:15 [Block input EN]" />
                <LineMapInfo line="25" column="4" position="Net:1, Ln:8, Col:1" />
                <LineMapInfo line="26" column="5" position="Net:1, Ln:8, Col:5" />
                <LineMapInfo line="27" column="5" position="Net:1, Ln:8, Col:10" />
                <LineMapInfo line="28" column="4" position="Net:1, Ln:1, Col:15 [Block input Power]" />
                <LineMapInfo line="29" column="5" position="Net:1, Ln:1, Col:15" />
                <LineMapInfo line="31" column="4" position="Net:1, Ln:1, Col:15 [Block output ENO]" />
                <LineMapInfo line="32" column="5" position="Net:1, Ln:2, Col:22" />
                <LineMapInfo line="33" column="4" position="Net:1, Ln:1, Col:29 [Block input EN]" />
                <LineMapInfo line="35" column="4" position="Net:1, Ln:9, Col:27" />
                <LineMapInfo line="36" column="4" position="Net:1, Ln:1, Col:29 [Block input Home]" />
                <LineMapInfo line="37" column="5" position="Net:1, Ln:1, Col:29" />
                <LineMapInfo line="39" column="4" position="Net:1, Ln:1, Col:29 [Block output ENO]" />
                <LineMapInfo line="40" column="5" position="Net:1, Ln:2, Col:36" />
                <LineMapInfo line="42" column="4" position="Net:1, Ln:2, Col:41" />
                <LineMapInfo line="43" column="6" position="Net:1, Ln:3, Col:42" />
                <LineMapInfo line="45" column="1" position="Net:2" />
                <LineMapInfo line="46" column="1" position="Net:2" />
                <LineMapInfo line="47" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="49" column="5" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="51" column="3" position="Net:2, Ln:1, Col:41" />
                <LineMapInfo line="52" column="4" position="Net:2, Ln:1, Col:5" />
                <LineMapInfo line="53" column="4" position="Net:2, Ln:2, Col:36 [Block input EN]" />
                <LineMapInfo line="55" column="10" position="Net:2, Ln:2, Col:36" />
                <LineMapInfo line="56" column="4" position="Net:2, Ln:3, Col:41" />
                <LineMapInfo line="58" column="4" position="Net:2, Ln:1, Col:1" />
                <LineMapInfo line="59" column="6" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="61" column="3" position="Net:2, Ln:4, Col:41" />
                <LineMapInfo line="62" column="4" position="Net:2, Ln:4, Col:5" />
                <LineMapInfo line="63" column="4" position="Net:2, Ln:5, Col:34 [Block input EN]" />
                <LineMapInfo line="65" column="10" position="Net:2, Ln:5, Col:34" />
                <LineMapInfo line="66" column="4" position="Net:2, Ln:6, Col:41" />
                <LineMapInfo line="69" column="1" position="Net:3" />
                <LineMapInfo line="70" column="1" position="Net:3" />
                <LineMapInfo line="71" column="4" position="Net:3, Ln:1, Col:1" />
                <LineMapInfo line="72" column="4" position="Net:3, Ln:1, Col:34 [Block input EN]" />
                <LineMapInfo line="74" column="4" position="Net:3, Ln:10, Col:1" />
                <LineMapInfo line="75" column="6" position="Net:3, Ln:10, Col:5" />
                <LineMapInfo line="76" column="5" position="Net:3, Ln:10, Col:9" />
                <LineMapInfo line="77" column="4" position="Net:3, Ln:1, Col:34 [Block input MoveVelocity]" />
                <LineMapInfo line="78" column="5" position="Net:3, Ln:14, Col:1" />
                <LineMapInfo line="79" column="6" position="Net:3, Ln:14, Col:5" />
                <LineMapInfo line="80" column="5" position="Net:3, Ln:14, Col:10" />
                <LineMapInfo line="81" column="4" position="Net:3, Ln:1, Col:34 [Block input JogPositive]" />
                <LineMapInfo line="82" column="5" position="Net:3, Ln:15, Col:1" />
                <LineMapInfo line="83" column="6" position="Net:3, Ln:15, Col:5" />
                <LineMapInfo line="84" column="5" position="Net:3, Ln:15, Col:10" />
                <LineMapInfo line="85" column="4" position="Net:3, Ln:1, Col:34 [Block input JogNegative]" />
                <LineMapInfo line="86" column="5" position="Net:3, Ln:1, Col:34" />
                <LineMapInfo line="87" column="4" position="Net:3, Ln:1, Col:34 [Block output Error]" />
                <LineMapInfo line="88" column="4" position="Net:3, Ln:4, Col:41" />
                <LineMapInfo line="89" column="4" position="Net:3, Ln:1, Col:34 [Block output MoveActive]" />
                <LineMapInfo line="90" column="4" position="Net:3, Ln:15, Col:41" />
                <LineMapInfo line="93" column="1" position="Net:4" />
                <LineMapInfo line="94" column="1" position="Net:4" />
                <LineMapInfo line="95" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="97" column="4" position="Net:4, Ln:1, Col:38 [Block input EN]" />
                <LineMapInfo line="99" column="10" position="Net:4, Ln:1, Col:38" />
                <LineMapInfo line="100" column="4" position="Net:4, Ln:2, Col:42" />
                <LineMapInfo line="102" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="103" column="4" position="Net:4, Ln:3, Col:38 [Block input EN]" />
                <LineMapInfo line="105" column="10" position="Net:4, Ln:3, Col:38" />
                <LineMapInfo line="106" column="4" position="Net:4, Ln:4, Col:42" />
                <LineMapInfo line="108" column="4" position="Net:4, Ln:1, Col:1" />
                <LineMapInfo line="109" column="4" position="Net:4, Ln:5, Col:37 [Block input EN]" />
                <LineMapInfo line="111" column="10" position="Net:4, Ln:5, Col:37" />
                <LineMapInfo line="112" column="4" position="Net:4, Ln:6, Col:41" />
                <LineMapInfo line="115" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="312A2FCD" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="PowerAndHomeState">
              <Documentation xsi:type="SimpleText"><![CDATA[Powers and homes the axis]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="798" />
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
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="218" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="256" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="2">
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
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="788" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Enable" edge="none">
                <RelPosition x="3" y="284" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Status.ModuleOk" edge="none">
                <RelPosition x="123" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.Active" edge="none">
                <RelPosition x="273" y="284" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="SortingConveyor">
                <RelPosition x="423" y="38" />
                <Size x="210" y="760" />
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
                  <InputVariable parameterName="MpLink">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ErrorReset">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Parameters">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="180" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Update">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="218" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Power">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="256" />
                      <Connection refConnectionPointOutId="5" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Home">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="294" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveVelocity">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="332" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAbsolute">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="370" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAdditive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="408" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Stop">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="446" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogPositive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="484" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogNegative">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="522" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="LimitLoad">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="560" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ReleaseBrake">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="598" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Simulate">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="636" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="AutoTune">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="674" />
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
                  <OutputVariable parameterName="Active">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Error">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="104" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="StatusID">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="142" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="UpdateDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="180" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Position">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="218" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Velocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="256" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandBusy">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="294" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandAborted">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="332" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="PowerOn">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="370" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="IsHomed">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="408" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InVelocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="446" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InPosition">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="484" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveActive">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="522" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="560" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Stopped">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="598" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="LimitLoadReady">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="636" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="BrakeReleased">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="674" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="AutoTuneDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="712" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Info">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="750" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.PowerOn" edge="none">
                <RelPosition x="633" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="DataSource" identifier="TRUE">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="783" y="322" />
                <Size x="60" y="20" />
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="60" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="SortingConveyor">
                <RelPosition x="843" y="38" />
                <Size x="210" y="760" />
                <InputVariables>
                  <InputVariable parameterName="EN">
                    <AddData>
                      <Data name="BR_IsEnEnoParameter" handleUnknown="implementation">
                        <IsEnEnoParameter value="true" />
                      </Data>
                    </AddData>
                    <ConnectionPointIn>
                      <RelPosition x="0" y="28" />
                      <Connection refConnectionPointOutId="7" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MpLink">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ErrorReset">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Parameters">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="180" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Update">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="218" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Power">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="256" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Home">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="294" />
                      <Connection refConnectionPointOutId="8" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveVelocity">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="332" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAbsolute">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="370" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAdditive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="408" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Stop">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="446" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogPositive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="484" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogNegative">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="522" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="LimitLoad">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="560" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ReleaseBrake">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="598" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Simulate">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="636" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="AutoTune">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="674" />
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
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Active">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Error">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="104" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="StatusID">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="142" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="UpdateDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="180" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Position">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="218" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Velocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="256" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandBusy">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="294" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandAborted">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="332" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="PowerOn">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="370" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="IsHomed">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="408" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InVelocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="446" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InPosition">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="484" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveActive">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="522" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="560" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Stopped">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="598" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="LimitLoadReady">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="636" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="BrakeReleased">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="674" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="AutoTuneDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="712" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Info">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="750" />
                    </ConnectionPointOut>
                  </OutputVariable>
                </OutputVariables>
              </FbdObject>
              <LdObject xsi:type="Contact" operand="SortingConveyor.IsHomed" edge="none">
                <RelPosition x="1053" y="56" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Coil" operand="Internal.Status.Active" edge="none" latch="none">
                <RelPosition x="1203" y="56" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Jump" targetNetworkLabel="ReceivingState">
                <RelPosition x="1233" y="94" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="798" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
                </ConnectionPointIn>
                <ConnectionPointIn>
                  <RelPosition x="0" y="66" />
                  <Connection refConnectionPointOutId="11" />
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
                <ConnectionPointIn>
                  <RelPosition x="0" y="788" />
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
                    <ComputeBlock><![CDATA[mcERROR_NONE]]></ComputeBlock>
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
            <Rung evaluationOrder="3" label="ReceivingState">
              <Documentation xsi:type="SimpleText"><![CDATA[State that receive a cap into the station]]></Documentation>
              <LdObject xsi:type="LeftPowerRail">
                <RelPosition x="0" y="0" />
                <Size x="3" y="798" />
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
                <ConnectionPointOut connectionPointOutId="2">
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
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="3" y="522" />
                </ConnectionPointOut>
                <ConnectionPointOut connectionPointOutId="4">
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
                <ConnectionPointOut connectionPointOutId="0">
                  <RelPosition x="3" y="788" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Start" edge="none">
                <RelPosition x="3" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="2" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="5">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="3" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="3" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="6">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="3" y="550" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="4" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="7">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.Stop" negated="true" edge="none">
                <RelPosition x="123" y="360" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="5" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="8">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" negated="true" edge="none">
                <RelPosition x="123" y="512" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="9">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" negated="true" edge="none">
                <RelPosition x="123" y="550" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="7" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="10">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.MoveFwd" edge="none">
                <RelPosition x="243" y="360" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="11">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.JogFwd" edge="none">
                <RelPosition x="273" y="512" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="9" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="12">
                  <RelPosition x="120" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <LdObject xsi:type="Contact" operand="Internal.Cmd.JogBkwd" edge="none">
                <RelPosition x="273" y="550" />
                <Size x="150" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="10" />
                </ConnectionPointIn>
                <ConnectionPointOut connectionPointOutId="13">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </LdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="SortingConveyor">
                <RelPosition x="993" y="38" />
                <Size x="210" y="760" />
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
                  <InputVariable parameterName="MpLink">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="66" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ErrorReset">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="142" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Parameters">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="180" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Update">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="218" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Power">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="256" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Home">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="294" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveVelocity">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="332" />
                      <Connection refConnectionPointOutId="11" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAbsolute">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="370" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="MoveAdditive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="408" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Stop">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="446" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogPositive">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="484" />
                      <Connection refConnectionPointOutId="12" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="JogNegative">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="522" />
                      <Connection refConnectionPointOutId="13" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="LimitLoad">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="560" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="ReleaseBrake">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="598" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Simulate">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="636" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="AutoTune">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="674" />
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
                      <RelPosition x="210" y="28" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Active">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="66" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Error">
                    <ConnectionPointOut connectionPointOutId="15">
                      <RelPosition x="210" y="104" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="StatusID">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="142" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="UpdateDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="180" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Position">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="218" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Velocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="256" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandBusy">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="294" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="CommandAborted">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="332" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="PowerOn">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="370" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="IsHomed">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="408" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InVelocity">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="446" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="InPosition">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="484" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveActive">
                    <ConnectionPointOut connectionPointOutId="16">
                      <RelPosition x="210" y="522" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="MoveDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="560" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Stopped">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="598" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="LimitLoadReady">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="636" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="BrakeReleased">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="674" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="AutoTuneDone">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="712" />
                    </ConnectionPointOut>
                  </OutputVariable>
                  <OutputVariable parameterName="Info">
                    <ConnectionPointOut connectionPointOutId="0">
                      <RelPosition x="210" y="750" />
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
                <RelPosition x="1203" y="132" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="15" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="Internal.Status.Done">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1203" y="550" />
                <Size x="120" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="16" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
                <Size x="3" y="798" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
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
                <ConnectionPointIn>
                  <RelPosition x="0" y="788" />
                </ConnectionPointIn>
              </LdObject>
            </Rung>
            <Rung evaluationOrder="4" label="Assignments">
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
                <RelPosition x="1113" y="0" />
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
                    <ComputeBlock><![CDATA[Internal.Par]]></ComputeBlock>
                  </Data>
                </AddData>
                <RelPosition x="1113" y="76" />
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
                <RelPosition x="1203" y="208" />
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
                <RelPosition x="1233" y="56" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="6" />
                </ConnectionPointIn>
              </FbdObject>
              <FbdObject xsi:type="DataSink" identifier="gMoveCap.Par">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="1233" y="132" />
                <Size x="90" y="20" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="10" />
                  <Connection refConnectionPointOutId="8" />
                </ConnectionPointIn>
              </FbdObject>
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="1323" y="0" />
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