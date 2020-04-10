# Code Search Tool Shootout
Compare various grep-like tools for performance recursivley scanning directories of source code.

- [ag](https://github.com/ggreer/the_silver_searcher)
- [findstr](https://ss64.com/nt/findstr.html)
- [gnu grep](https://www.gnu.org/software/grep/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [sift](https://github.com/svent/sift)

## Literal (Fixed String) Results

```
.\tests\literal.ps1


Command    Seconds        Grep Ratio Found
-------    -------        ---------- -----
sift     0.6709539 0.117226149286559  5815
rg       0.7726723 0.134997946042774  5840
findstr   4.019066 0.702193743725961  5811
grep     5.7235856                 1  5815
ag      10.8135604  1.88929827484366  5841
```
