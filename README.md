# Code Search Tool Shootout
Compare various grep-like tools for performance recursivley scanning directories of source code.

- [ag](https://github.com/ggreer/the_silver_searcher)
- [findstr](https://ss64.com/nt/findstr.html)
- [gnu grep](https://www.gnu.org/software/grep/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [sift](https://github.com/svent/sift)

## Literal (Fixed String) Results

```
.\test\literal.ps1

Command    Seconds        Grep Ratio Found
-------    -------        ---------- -----
sift     0.6793062 0.117165620984973  5815
rg        0.864108 0.149039932828647  5840
findstr  4.3610258 0.752182588630119  5811
grep     5.7978287                 1  5815
ag      13.7247422  2.36722105984263  5841

