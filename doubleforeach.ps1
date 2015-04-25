# This has a warning saying that $value is uninitialized

$values=@(1,2,3)
foreach($value in $values)
{
    $values |  ForEach-Object -Process {
        if($true)
        {
            "foo$value - bar$_" | Write-Output
        }
    }
}

<#
    This is the actual code that caused me to look for a bug here
    $columnBGColors was reporting the same error, but I cannot seem
    to come up with a simplified repro

    [HashTable] $columnBGColors = @{}
    foreach($columnHeading in $formatObject.ColumnBackgroundColor)
    {
        $columnHeading.PSObject.Members| ForEach-Object -Process {
            if($_.MemberType -eq 'NoteProperty') {
                $columnBGColors.Add($_.Name,$_.Value)
            }
        }
    }

#>
