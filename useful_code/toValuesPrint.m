toValuesPrint[T_] := Module[{temp},
    Print["toValues:"];
    Print["ChangeCovD"];    temp = (ChangeCovD[#1, CD, PDB] & )[T];
    Print["ToBasis 1"];temp = ToBasis[B][temp]; 
    Print["ToBasis 2"]; temp = ToBasis[B][temp]; 
    Print["TraceBasisDummy"]; temp = TraceBasisDummy[temp]; 
    Print["ComponentArray"]; temp = ComponentArray[temp]; 
    Print["ToValues 1"]; temp = ToValues[temp]; 
    Print["ToValues 2"]; temp = ToValues[temp]; 
    Print["ToValues 3"]; temp = ToValues[temp]; 
    Print["Done"]; 
    temp]; 
