model pandapower
  "Block that.simulators a vector of real values with Simulator"
  extends Modelica.Blocks.Interfaces.BlockIcon;

///////////// THE CODE BELOW HAS BEEN AUTOGENERATED //////////////
  Modelica.Blocks.Interfaces.RealInput KW_7(start=0.0, unit="kW")
    "Active power on node 7" annotation(Placement(transformation(extent={{-122,68},{-100,90}})));
  Modelica.Blocks.Interfaces.RealInput KW_8(start=0.0, unit="kW")
    "Active power on node 8" annotation(Placement(transformation(extent={{-122,48},{-100,70}})));
  Modelica.Blocks.Interfaces.RealInput KW_9(start=0.0, unit="kW")
    "Active power on node 9" annotation(Placement(transformation(extent={{-122,28},{-100,50}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_7 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_8 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,52},{120,72}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_9 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,34},{120,54}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_16 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,16},{120,36}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_17 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,-2},{120,18}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_30 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_31 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,-38},{120,-18}})));
  Modelica.Blocks.Interfaces.RealOutput Vpu_32 (unit="Vpu")
    "Voltage at node X" annotation(Placement(transformation(extent={{100,-56},{120,-36}})));
  // Configuration specific parameters coming from
  // the inputs of the Python export tool (SimulatorToFMU.py)
  parameter String patResScri = Modelica.Utilities.Files.loadResource("C:\\Users\\DRRC\\Desktop\\fmi-for-power-system\\tests\\010_cydertool_connections\\pandapower\\pandapower_wrapper.py")
    "Path to the script in resource folder";
  // used to generate the FMU
  //
  // parameter String _configurationFileName = "dummy.csv"
  //  "Path to the configuration or input file";
  //
   //
  parameter Boolean _saveToFile (fixed=true) = false "Flag for writing results";

protected
  SimulatorToFMU.Python27.Functions.BaseClasses.PythonObject obj=
  SimulatorToFMU.Python27.Functions.BaseClasses.PythonObject(patResScri=patResScri);
  parameter Boolean passMemoryObject = true
    "Set to true if the Python function returns and receives an object, see User's Guide";

   parameter Integer nDblPar=0
    "Number of double parameter values to sent to Simulator";
   parameter Integer nStrPar=0
    "Number of string parameter values to sent to Simulator";
  parameter Integer nDblInp(min=1)=3
    "Number of double input values to sent to Simulator";
  parameter Integer nDblOut(min=1)=8
    "Number of double output values to receive from Simulator";

  Real dblInpVal[nDblInp] "Value to be sent to Simulator";

  
  Real uR[nDblInp]={
  KW_7,
  KW_8,
  KW_9
  }"Variables used to collect values to be sent to Simulator";
  
  Real yR[nDblOut]={
  Vpu_7,
  Vpu_8,
  Vpu_9,
  Vpu_16,
  Vpu_17,
  Vpu_30,
  Vpu_31,
  Vpu_32
  }"Variables used to collect values received from Simulator";
  
  parameter String dblInpNam[nDblInp]={
  "KW_7",
  "KW_8",
  "KW_9"
  }"Input variable name to be sent to Simulator";
  
  parameter String dblOutNam[nDblOut]={
  "Vpu_7",
  "Vpu_8",
  "Vpu_9",
  "Vpu_16",
  "Vpu_17",
  "Vpu_30",
  "Vpu_31",
  "Vpu_32"
  }"Output variable names to be received from Simulator";
  parameter String dblParNam[nDblPar]
    "Double parameter variable names to be sent to Simulator";
  parameter Real dblParVal[nDblPar]=zeros(nDblPar)
    "Double parameter variable values to be sent to Simulator";

  parameter String strParNam[nStrPar]
    "String parameter variable names to be sent to Simulator";

  parameter String strParVal[nStrPar]
    "String parameter variable values to be sent to Simulator";


///////////// THE CODE ABOVE HAS BEEN AUTOGENERATED //////////////
  protected
    parameter String moduleName="pandapower_wrapper"
      "Name of the Python module that contains the function";
    parameter String functionName="exchange"
      "Name of the Python function";

  equation
	// Compute values that will be sent to Simulator
	for _cnt in 1:nDblInp loop
	  dblInpVal[_cnt] = uR[_cnt];
	end for;

	// Simulator data
	yR = SimulatorToFMU.Python27.Functions.simulator(
	  moduleName=moduleName,
	  functionName=functionName,
	  //conFilNam=_configurationFileName,
    conFilNam="",
    modTim=time,
    nDblInp=nDblInp,
    dblInpNam=dblInpNam,
    dblInpVal=dblInpVal,
    nDblOut=nDblOut,
    dblOutNam=dblOutNam,
    nDblPar=nDblPar,
    dblParNam=dblParNam,
    dblParVal=dblParVal,
    resWri=_saveToFile,
    obj=obj,
    passMemoryObject=passMemoryObject);
end pandapower;