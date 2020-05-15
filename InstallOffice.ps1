Set-Location $PSScriptRoot

Set-Location ($env:Temp + '\Office365')
$proc = (Start-Process "setup.exe" -ArgumentList "/configure .\O365_configuration.xml" -Wait -PassThru)
$proc.WaitForExit()
exit(0)