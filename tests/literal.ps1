Set-StrictMode -Version 2.0
$ErrorActionPreference="Stop"

function Item() {
    param(
    [string] $Command,
    $Measure,
    $Lines,
    $GrepMeasure
    )
    
    return [PsCustomObject]@{
        "Command" = $Command;
        "Seconds" = $Measure.TotalSeconds;
        "Grep Ratio" = (($Measure).TotalSeconds)/(($GrepMeasure).TotalSeconds);
        "Found" = $Lines.Count;
        }
}

function Run-Test() {
    param([string] $Pattern,[string] $Directory)

    Write-Information "Running Test..."

    $rAg=Measure-Command { $lAg=ag      -F --vimgrep $Pattern $Directory }
    $rFs=Measure-Command { $lFs=findstr /P /S /N /L  $Pattern "$Directory\*" }
    $rG =Measure-Command { $lG =grep    -rnHF        $Pattern $Directory }
    $rRg=Measure-Command { $lRg=rg      -F --vimgrep $Pattern $Directory }
    $rS =Measure-Command { $lS =sift    --no-conf -n --err-skip-line-length  $Pattern $Directory }

    (
    (Item "ag"      $rAg $lAg $rG),
    (Item "findstr" $rFs $lFs $rG),
    (Item "grep"    $rG  $lG  $rG),
    (Item "rg"      $rRg $lRg $rG),
    (Item "sift"    $rS  $lS  $rG)
    ) |
    Sort-Object { $_.Seconds } |
    Format-Table -AutoSize
}

Write-Information "Getting testdata from submodules..."
git submodule update --init

Run-Test println .\test_projects

# vim: et sw=4
