# grep Shootout
Compare various grep like tools for performance.

## Literal (Fixed String) Results

```
.\test\literal.ps1


Command   Seconds        Grep Ratio Lines Found
-------   -------        ---------- -----------
rg      0.2717194 0.154381557942444        3673
sift    0.3245405 0.184392678643555        3691
findstr 1.1322201 0.643288270810804        3673
grep    1.7600509                 1        3673
```

