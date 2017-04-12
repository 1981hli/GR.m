# Useful Mathematica Codes

``` mathematica
(*Creat .nb file with auto-replacements.*)
nb=CreateDocument[{},InputAutoReplacements->{
	"gga"->"\[Alpha]",
	"ggb"->"\[Beta]",
	"ggc"->"\[Chi]",
	"ggd"->"\[Delta]",
	"gge"->"\[Epsilon]",
	"ggf"->"\[Phi]",
	"ggg"->"\[Gamma]",
	"ggh"->"\[Eta]",
	"ggi"->"\[Iota]",
	"ggk"->"\[Kappa]",
	"ggl"->"\[Lambda]",
	"ggm"->"\[Mu]",
	"ggn"->"\[Nu]",
	"ggo"->"\[Omega]",
	"ggp"->"\[Pi]",
	"ggq"->"\[Theta]",
	"ggr"->"\[Rho]",
	"ggs"->"\[Sigma]",
	"ggt"->"\[Tau]",
	"ggu"->"\[Upsilon]",
	"ggx"->"\[Xi]",
	"ggy"->"\[Psi]",
	"ggz"->"\[Zeta]",
	"ggD"->"\[CapitalDelta]",
	"ggF"->"\[CapitalPhi]",
	"ggG"->"\[CapitalGamma]",
	"ggL"->"\[CapitalLambda]",
	"ggO"->"\[CapitalOmega]",
	"ggP"->"\[CapitalPi]",
	"ggQ"->"\[CapitalTheta]",
	"ggS"->"\[CapitalSigma]",
	"ggU"->"\[CapitalUpsilon]",
	"ggX"->"\[CapitalXi]",
	"ggY"->"\[CapitalPsi]"
}]
```

``` mathematica
(*Print out the structure of eqnList.*)
Map[Column,Union[Level[#,-1]]&/@(eqnList//Flatten)]
```
