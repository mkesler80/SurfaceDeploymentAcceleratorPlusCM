Set-Location $PSScriptRoot
Get-Process sysprep -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep 10

Remove-Item -Path C:\Windows\Panther\unattend.xml -Force -ErrorAction SilentlyContinue
Remove-Item -Path C:\Windows\system32\sysprep\unattend.xml -Force -ErrorAction SilentlyContinue
Start-Sleep 2
Copy-Item -Path $env:Temp\Reseal.xml -Destination C:\Windows\system32\sysprep\unattend.xml -Force -ErrorAction SilentlyContinue
Start-Sleep 5

Get-Process sysprep -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep 10


& C:\Windows\System32\Sysprep\sysprep.exe /oobe /generalize /reboot /unattend:C:\Windows\system32\sysprep\unattend.xml