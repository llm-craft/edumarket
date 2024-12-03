@echo off
echo Installation automatique de Node.js...

:: Créer un dossier temporaire
mkdir temp_node
cd temp_node

:: Télécharger Node.js
echo Téléchargement de Node.js...
curl -o node.msi https://nodejs.org/dist/v18.17.1/node-v18.17.1-x64.msi

:: Installer Node.js
echo Installation de Node.js...
msiexec /i node.msi /qn ADDLOCAL=ALL

:: Attendre la fin de l'installation
timeout /t 10 /nobreak

:: Nettoyer
cd ..
rmdir /s /q temp_node

:: Rafraîchir les variables d'environnement
echo Mise à jour des variables d'environnement...
setx PATH "%PATH%;C:\Program Files\nodejs" /M

:: Vérifier l'installation
echo Vérification de l'installation...
node --version
npm --version

echo Installation terminée !
echo Démarrage du serveur...
node server.js

pause
