# Start-Komorebi.ps1

$exe    = "$env:USERPROFILE\scoop\apps\komorebi\current\komorebic.exe"
$config = "$env:KOMOREBI_CONFIG_HOME\komorebi.json"

# Optional: ensure clean restart
# Stop existing instance if needed
# & $exe stop 2>$null

# Start komorebi
& $exe start `
    --config "$config" `
    #--await-configuration `
    --bar `
    --masir `
    --clean-state
