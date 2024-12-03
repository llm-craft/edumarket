@echo off
echo Installing Node.js...

:: Télécharger Node.js
powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v18.17.1/node-v18.17.1-x64.msi' -OutFile 'node_installer.msi'"

:: Installer Node.js
msiexec /i node_installer.msi /passive

:: Attendre la fin de l'installation
timeout /t 30

:: Vérifier l'installation
node --version
npm --version

:: Installer les dépendances du projet
npm install

echo Installation terminée !
pause
