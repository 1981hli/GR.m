# Useful Mathematica Short Codes

``` mathematica
(*List indices*)
seef[ff_]:=Module[{lis,rst},
	rst={};
	lis=Level[{ff},-1]//Union;
	Do[If[MemberQ[{i[1],i[2],i[3]},lis[[ii]]],rst=Insert[rst,lis[[ii]],-1]],{ii,lis//Length}];
	rst//Union//Length]
```

``` mathematica
(*Print out the structure of eqnList*)
Map[Column,Union[Level[#,-1]]&/@(eqnList//Flatten)]
```

``` mathematica
(*Solve equations automatically*)
fsolve[ff_]:=Solve[ff==0,getc[ff]][[1]]
getc[ff_]:=Module[{lis,rst},
                  lis=Level[{ff},-1]//Union;
                  Do[If[MemberQ[{cc},Head[lis[[ii]]]],rst=lis[[ii]];Break[]],{ii,lis//Length}];
                  rst]
rep={};
While[Length[ceqn]>1,
      rep1=fsolve[ceqn[[2]]];
      rep=rep/.rep1//Expand;
      rep=Join[rep,rep1];
      ceqn=ceqn//.rep//Expand//Union;
      Print[{rep,ceqn//Length,rep//Length}]]
rep
```
