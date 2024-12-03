# Définir la version de Node.js
$nodeVersion = "18.17.1"
$nodeUrl = "https://nodejs.org/dist/v$nodeVersion/node-v$nodeVersion-x64.msi"
$installerPath = "$PSScriptRoot\node_installer.msi"

Write-Host "Installation automatique de Node.js v$nodeVersion..." -ForegroundColor Green

# Télécharger Node.js
Write-Host "Téléchargement de Node.js..."
Invoke-WebRequest -Uri $nodeUrl -OutFile $installerPath

# Installer Node.js silencieusement
Write-Host "Installation de Node.js..."
Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /qn" -Wait

# Vérifier l'installation
Write-Host "Vérification de l'installation..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Tester node et npm
try {
    $nodeVersion = node --version
    $npmVersion = npm --version
    Write-Host "Node.js $nodeVersion installé avec succès!" -ForegroundColor Green
    Write-Host "NPM $npmVersion installé avec succès!" -ForegroundColor Green
} catch {
    Write-Host "Erreur lors de la vérification de l'installation" -ForegroundColor Red
    Write-Host $_.Exception.Message
    exit 1
}

# Nettoyer
Remove-Item $installerPath -Force

# Installation des dépendances du projet
Write-Host "Installation des dépendances du projet..."
Set-Location $PSScriptRoot
npm install

Write-Host "Installation terminée!" -ForegroundColor Green
pause
