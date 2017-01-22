$customizationsFile = "_MyCustomizations.txt"

if (Test-Path $customizationsFile) { 

    $lines = Get-Content _MyCustomizations.txt | Where {$_ -notmatch '^\s+$'} 
    foreach ($line in $lines) {
        if (Test-Path $line) {
            Start-Process -FilePath "C:\windows\system32\cmd.exe" -WindowStyle Minimized ` -ArgumentList @('/C REG IMPORT "' + $_.FullName + '"') -Wait
            Write-Output("Imported " + $line)
        }
        else {
            Write-Output("Couldn't find file: " + $line)
        }
    }

}
else {
    Write-Output("Couldn't find _MyCustomizations.txt file")
}