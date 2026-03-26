Needs["Misiurewicz`", "/Users/arnoudb/github/misiurewicz/scripts/Misiurewicz.wl"]

VerificationTest[
    MisiurewiczPoints[1, 1],
    {0},
    TestID -> "MPoints-1-1"
]

VerificationTest[
    MisiurewiczPoints[2, 1],
    {-2},
    TestID -> "MPoints-2-1"
]

VerificationTest[
    MisiurewiczPoints[2, 2],
    {-I, I},
    TestID -> "MPoints-2-2"
]

VerificationTest[
    MisiurewiczPoints[3, 1],
    c /. Solve[c^3 + 2 c^2 + 2 c + 2 == 0, c],
    TestID -> "MPoints-3-1"
]
