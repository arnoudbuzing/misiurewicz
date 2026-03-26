BeginPackage["Misiurewicz`"]

MisiurewiczPoints::usage = "MisiurewiczPoints[m, k] returns the set of parameter values c for which the critical point 0 of f(z)=z^2+c is strictly pre-periodic with pre-period m and period k."

Begin["`Private`"]

MisiurewiczPoints[m_Integer, k_Integer] := Module[{z, poly, roots, c, f},
    f[valz_, valc_] := valz^2 + valc;
    z[0] = 0;
    z[n_Integer] := z[n] = f[z[n - 1], c];
    
    (* Primary equation: z_{m+k}(c) = z_m(c) *)
    poly = z[m + k] - z[m];
    
    (* Find all candidates *)
    roots = c /. Solve[poly == 0, c];
    
    (* Filter for exact m and k *)
    Union @ Select[roots, Function[val,
        Module[{seq},
            seq = NestList[f[#, val] &, 0, m + k];
            (* Check periodicity m, k *)
            PossibleZeroQ[seq[[m + k + 1]] - seq[[m + 1]]] &&
            (* Check strict pre-period m: z_{m+k-1} != z_{m-1} *)
            (m == 1 || Not[PossibleZeroQ[seq[[m + k]] - seq[[m]]]]) &&
            (* Check strict period k: z_{m+k'} != z_m for k' < k *)
            AllTrue[Range[k - 1], Not[PossibleZeroQ[seq[[m + # + 1]] - seq[[m + 1]]]] &]
        ]
    ]]
]

End[]
EndPackage[]
