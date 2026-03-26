#!/Applications/Wolfram/15.0/Wolfram.app/Contents/MacOS/wolframscript
Needs["Misiurewicz`", "/Users/arnoudb/github/misiurewicz/scripts/Misiurewicz.wl"]
testPath = "/Users/arnoudb/github/misiurewicz/tests/Misiurewicz.wlt";
report = TestReport[testPath];
Print["Test Report for ", testPath];
Print["Passed: ", report["TestsSucceededCount"]];
Print["Failed: ", report["TestsFailedCount"]];

If[report["TestsFailedCount"] > 0,
    Do[
        If[Not[res["Outcome"] === "Success"],
            Print["Failed Test ID: ", res["TestID"]];
            Print["  Expected: ", res["ExpectedResult"]];
            Print["  Actual: ", res["ActualResult"]]
        ],
        {res, Values[report["TestResults"]]}
    ];
    Exit[1],
    Exit[0]
]
