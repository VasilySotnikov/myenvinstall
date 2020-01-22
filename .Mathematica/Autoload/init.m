$HPLPath = FileNameJoin[{$HomeDirectory,"scratch/HPL-2.0"}];
If[Not[MemberQ[$Path,$HPLPath]],$Path = Flatten[{$Path, $HPLPath }]];

$SpinorsPath = FileNameJoin[{$HomeDirectory,"scratch/Spinors-1.0"}];
If[Not[MemberQ[$Path,$SpinorsPath]],$Path = Flatten[{$Path, $SpinorsPath }]];

$FiniteFlowPath = FileNameJoin[{$HomeDirectory,"scratch/finiteflow/mathlink"}];
If[Not[MemberQ[$Path,$FiniteFlowPath]],$Path = Flatten[{$Path, $FiniteFlowPath }]];

With[{
    homepaths = {
            "scratch/finiteflow/mathlink",
            "scratch/finiteflow-mathtools/packages",
            "scratch/mathematica-utilities",
            "scratch/Spinors-1.0",
            Nothing
        }
    },
    With[{ fullpaths = FileNameJoin[{$HomeDirectory,#}]& /@ homepaths },
        If[Not[MemberQ[$Path,#]],$Path = Flatten[{$Path, # }]] & /@ fullpaths
    ];
];

SetDirectoryFromSelf::usage = "
    If launched from frontend, set the working directory to the location where the current file is.
    If launched from script, this is already the case.
";

SetDirectoryFromSelf[] := If[ $FrontEnd =!= Null, SetDirectory[NotebookDirectory[]], Null ];
