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
 * Description: This task merely enables the MpAxisBasic FUB.
 *********************************************************************************)]]></Documentation>
        <AddData>
          <Data name="BR_EntryPoint" handleUnknown="implementation">
            <EntryPoint entryPointType="_INIT" />
          </Data>
        </AddData>
        <MainBody>
          <AddData>
            <Data name="BR_CodeInformation" handleUnknown="implementation">
              <CodeInformation><![CDATA[CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_BEGIN
PROGRAM _INIT

VAR
	zz$$$$_0_Eno_MpAxisBasic_Sorting : BOOL;
END_VAR


{NetworkNumber := 1}
EnableMpAxisBasic:
LD	TRUE
ST	zz$$$$_0_Eno_MpAxisBasic_Sorting
JMPCN ll$$$$_IF_0
LD	gSortingConveyor
ADR
ST	SortingConveyor.MpLink
LD	TRUE
ST	SortingConveyor.Enable
LD	SortingConveyorPar
ADR
ST	SortingConveyor.Parameters
CAL	SortingConveyor
ll$$$$_IF_0:

END_PROGRAM
CODE_INFORMATION_754EF481_1721_4FA5_BF7F_DE1B91DFA69B_END]]></CodeInformation>
            </Data>
            <Data name="BR_LineMapInformation" handleUnknown="implementation">
              <LineMapInfos guid="083CC528_CBC9_4705_A12D_02E20D3F2FC6">
                <LineMapInfo line="1" column="1" position="[POU start]" />
                <LineMapInfo line="8" column="1" position="Net:1" />
                <LineMapInfo line="9" column="1" position="Net:1" />
                <LineMapInfo line="10" column="4" position="Net:1, Ln:1, Col:1" />
                <LineMapInfo line="11" column="4" position="Net:1, Ln:1, Col:7 [Block input EN]" />
                <LineMapInfo line="13" column="4" position="Net:1, Ln:3, Col:2" />
                <LineMapInfo line="15" column="4" position="Net:1, Ln:1, Col:7 [Block input MpLink]" />
                <LineMapInfo line="16" column="4" position="Net:1, Ln:4, Col:5" />
                <LineMapInfo line="17" column="4" position="Net:1, Ln:1, Col:7 [Block input Enable]" />
                <LineMapInfo line="18" column="4" position="Net:1, Ln:6, Col:2" />
                <LineMapInfo line="20" column="4" position="Net:1, Ln:1, Col:7 [Block input Parameters]" />
                <LineMapInfo line="21" column="5" position="Net:1, Ln:1, Col:7" />
                <LineMapInfo line="24" column="1" position="[POU end]" />
              </LineMapInfos>
            </Data>
            <Data name="BR_ChecksumInformation" handleUnknown="implementation">
              <ChecksumInformation guid="A3044021_E131_45AC_AB9B_59041547F16C" checksum="07E6112D" />
            </Data>
          </AddData>
          <BodyContent xsi:type="LD">
            <Rung evaluationOrder="1" label="EnableMpAxisBasic">
              <Documentation xsi:type="SimpleText"><![CDATA[Enables MpAxisBasic FUB]]></Documentation>
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
              <FbdObject xsi:type="DataSource" identifier="gSortingConveyor">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="33" y="94" />
                <Size x="150" y="20" />
                <ConnectionPointOut connectionPointOutId="2">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="SortingConveyorPar">
                <AddData>
                  <Data name="BR_AddressValue" handleUnknown="implementation">
                    <AddressValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="33" y="208" />
                <Size x="150" y="20" />
                <ConnectionPointOut connectionPointOutId="3">
                  <RelPosition x="150" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="DataSource" identifier="TRUE">
                <AddData>
                  <Data name="BR_AnalogValue" handleUnknown="implementation">
                    <AnalogValue value="true" />
                  </Data>
                </AddData>
                <RelPosition x="123" y="132" />
                <Size x="60" y="20" />
                <ConnectionPointOut connectionPointOutId="4">
                  <RelPosition x="60" y="10" />
                </ConnectionPointOut>
              </FbdObject>
              <FbdObject xsi:type="Block" typeName="MpAxisBasic" instanceName="SortingConveyor">
                <RelPosition x="183" y="38" />
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
                      <Connection refConnectionPointOutId="2" />
                    </ConnectionPointIn>
                  </InputVariable>
                  <InputVariable parameterName="Enable">
                    <ConnectionPointIn>
                      <RelPosition x="0" y="104" />
                      <Connection refConnectionPointOutId="4" />
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
                      <Connection refConnectionPointOutId="3" />
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
                    <ConnectionPointOut connectionPointOutId="5">
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
              <LdObject xsi:type="RightPowerRail">
                <RelPosition x="423" y="0" />
                <Size x="3" y="798" />
                <ConnectionPointIn>
                  <RelPosition x="0" y="28" />
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
          </BodyContent>
        </MainBody>
      </Program>
    </GlobalNamespace>
  </Types>
  <Instances />
</Project>