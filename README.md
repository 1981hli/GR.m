# Useful Mathematica Short Codes

``` mathematica
(*List indices.*)
seef[ff_]:=Module[{lis,rst},
	rst={};
	lis=Level[{ff},-1]//Union;
	Do[If[MemberQ[{i[1],i[2],i[3]},lis[[ii]]],rst=Insert[rst,lis[[ii]],-1]],{ii,lis//Length}];
	rst//Union//Length
]
```

``` mathematica
(*Print out the structure of eqnList.*)
Map[Column,Union[Level[#,-1]]&/@(eqnList//Flatten)]
```
