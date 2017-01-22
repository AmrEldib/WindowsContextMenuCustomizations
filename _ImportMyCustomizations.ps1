$customizationsFile = "_MyCustomizations.txt"

if (Test-Path $customizationsFile) { 
    foreach($line in Get-Content $customizationsFile) {
        if ($line.EndsWith(".reg")) {
            Invoke-Expression 'reg import "$line"'
            Write-Output "Imported '$line'"
        }
    }
}
else {
    Write-Output("Couldn't find _MyCustomizations.txt file")
}