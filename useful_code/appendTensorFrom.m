appendTensorFrom[from_][tensor_]:=Module[{},
    ChangeComponents[tensor,from];
    AllComponentValues[tensor,tensor//toValuesPrint//simplifyList[Simplify]];
];
