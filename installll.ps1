#Install chocolatey

$env:chocolateyUseWindowsCompression = 'true'
$env:chocolateyIgnoreRebootDetected = 'true'
$env:chocolateyVersion = '1.4.0'
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation

 

#Installing azure storage explorer

choco install microsoftazurestorageexplorer

 

#Download and Install Batch explorer

# Define the URL for Batch Explorer download
$batchExplorerUrl = "https://github.com/Azure/BatchExplorer/releases/download/v2.17.0-stable.801/BatchExplorer-2.17.0-stable.801-win.zip"

# Define the installation directory
$installDir = "C:\Program Files\BatchExplorer"

# Create the installation directory
Write-Host "Creating installation directory..."
New-Item -ItemType Directory -Path $installDir -ErrorAction Stop | Out-Null

# Download Batch Explorer
Write-Host "Downloading Batch Explorer..."
$downloadPath = Join-Path $installDir "BatchExplorer.zip"
Invoke-WebRequest -Uri $batchExplorerUrl -OutFile $downloadPath

# Extract the downloaded zip file
Write-Host "Extracting Batch Explorer..."
Expand-Archive -Path $downloadPath -DestinationPath $installDir -Force
Start-Process -FilePath "C:\Program Files\BatchExplorer\BatchExplorer.exe"