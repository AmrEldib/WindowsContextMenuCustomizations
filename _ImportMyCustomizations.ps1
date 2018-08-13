$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
$customizationsFile = Join-Path $scriptPath "_MyCustomizations.txt" 

if (Test-Path $customizationsFile) { 
	foreach ($line in Get-Content $customizationsFile) {
		if ($line.EndsWith(".reg")) {
			$file = Join-Path $scriptPath .\$line
			Invoke-Expression 'reg import "$file"'
			Write-Output "Imported '$line'"
		}
	}
}
else {
	Write-Output("Couldn't find _MyCustomizations.txt file")
}