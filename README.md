# Code Search Tool Shootout
Compare various grep-like tools for performance recursivley scanning directories of source code.

- [GNU grep](https://www.gnu.org/software/grep/)
- [findstr](https://ss64.com/nt/findstr.html)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [sift](https://github.com/svent/sift)

## Literal (Fixed String) Results

```
.\test\literal.ps1

Command   Seconds        Grep Ratio Found
-------   -------        ---------- -----
sift    0.2243681 0.131371032304479  3673
rg      0.2839063 0.166231579751066  3691
findstr 1.0624899 0.622104456810405  3673
grep    1.7078963                 1  3673
ag      4.3285263    2.534419859098  3690
```
