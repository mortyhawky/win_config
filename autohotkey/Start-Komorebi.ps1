# Start-Komorebi.ps1

clear
$procName = "komorebi"
Write-Host "`$Env:KOMOREBI_CONFIG_HOME     = $Env:KOMOREBI_CONFIG_HOME" -ForegroundColor Yellow
Write-Host "`$procName                     = $procName"                 -ForegroundColor Yellow

Get-Process -Name "$procName" -ErrorAction SilentlyContinue

if (Get-Process -Name "$procName" -ErrorAction SilentlyContinue) {
   Write-Host "$procName is running.     Shift+F2 to stop $procName." -ForegroundColor Green
   return
} 
else {
   Write-Host "$procName is NOT running   ... Starting $procName ..." -ForegroundColor Green

   #Start-Process -FilePath "$procName"

#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c dir `"%SystemDrive%\Program Files`""
Start-Process 'komorebi.exe' -ArgumentList '--config="C:\Users\morty\.config\komorebi\komorebi.json"' -WindowStyle hidden

if (!(Get-Process komorebi-bar -ErrorAction SilentlyContinue))
{
  Start-Process komorebi-bar -WindowStyle hidden
}

if (!(Get-Process masir -ErrorAction SilentlyContinue))
{
  Start-Process masir -WindowStyle hidden
}



#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c dir `"%SystemDrive%\Program Files`""
#Start-Process -FilePath "$Env:ComSpec" -ArgumentList "/c","dir","`"%SystemDrive%\Program Files`""
  # Start-Process -FilePath "$procName" 
  #   -ArgumentList "--bar", "`"--masir`""


   #Start-Process "$procName" `
   # -ArgumentList '--config C:\Users\morty\.config\komorebi\komorebi.json'

   Sleep 1
   Get-Process -Name "$procName" -ErrorAction SilentlyContinue
}



    #-ArgumentList '--config "$Env:KOMOREBI_CONFIG_HOME\$procName.json"'
      #-WindowStyle hidden

#$exe    = "$env:USERPROFILE\scoop\apps\komorebi\current\komorebic.exe"
#$config = "$env:KOMOREBI_CONFIG_HOME\komorebi.json"
#
## Optional: ensure clean restart
## Stop existing instance if needed
## & $exe stop 2>$null
#
## Start komorebi
#& $exe start `
#    --config "$config" `
#    --bar `
#    --masir
