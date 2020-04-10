$ErrorActionPreference="Stop"

function Run-Grep() {
    param([string] $Pattern,[string] $Directory)
    grep -rnHF $Pattern $Directory
}

function Run-Rg() {
    param([string] $Pattern,[string] $Directory)
    rg --vimgrep -F $Pattern $Directory
}


function Run-Sift() {
    param([string] $Pattern,[string] $Directory)
    sift --no-conf -n $Pattern $Directory
}


function Run-Findstr() {
    param([string] $Pattern,[string] $Directory)
    findstr /P /S /N /L $Pattern $Directory 
}

function Item() {
    param(
    [string] $Command,
    $Measure,
    $GrepMeasure,
    $Lines
    )
    
    return [PsCustomObject]@{
        "Command" = $Command;
        "Seconds" = $Measure.TotalSeconds;
        "Grep Ratio" = (($Measure).TotalSeconds)/(($GrepMeasure).TotalSeconds);
        "Lines" = $Lines.Count;
        }
}

function Run-Test() {
    param([string] $Pattern,[string] $Directory)

    Write-Output "Running Test..."

    $gR   =Measure-Command { $linesG  =grep.exe -rnHF          $Pattern $Directory }
    $rgR  =Measure-Command { $linesRg =rg.exe -F --vimgrep     $Pattern $Directory }
    $siftR=Measure-Command { $linesS  =sift.exe --no-conf -n   $Pattern $Directory }
    $findR=Measure-Command { $linesFs =findstr.exe /P /S /N /L $Pattern "$Directory\*" }

    Write-Output "Lines Found: grep=$($linesG.Count) rg=$($linesRg.Count) sift=$($linesS.Count) findstr=$($linesFs.Count)"

    if (($linesG.Count -ne $linesRg.Count)
       || 
        ($linesG.Count -ne $linesR.Count)
       || 
        ($linesG.Count -ne $linesFs.Count)) {
        #Write-Error "Line counts do not match. Invalid test."
    }

    Write-Output "**** Test Results *****"

    (
    (Item "grep"    $gR    $gR $linesG),
    (Item "sift"    $siftR $gR $linesRg),
    (Item "rg"      $rgR   $gR $linesS),
    (Item "findstr" $findR $gR $linesFs)
    ) | Sort-Object -Property Ratio | Format-Table
}


Write-Output "Getting testdata from submodules..."
git submodule update --init --recursive

Run-Test printk_ratelimit .\test_projects\linux

