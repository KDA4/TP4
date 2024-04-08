#!/bin/bash
# Vérifier si Git est déjà installé
if command -v git &>/dev/null; then
     echo "Git est déjà installé. Version actuelle : $(git --version)"
     exit 0
fi 
# Installer les dépendances nécessaires pour la compilation
sudo apt update
sudo apt install -y build-essential libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
# Télécharger la dernière version de Git depuis le site officiel
wget https://www.kernel.org/pub/software/scm/git/git-2.33.0.tar.gz
tar -xf git-2.33.0.tar.gz cd git-2.33.0 
# Configurer, compiler et installer Git
make configure
./configure --prefix=/usr
make all
sudo make install
# Vérifier l'installation de Git
if command -v git &>/dev/null; then
     echo "Git a été installé avec succès. Nouvelle version : $(git --version)"
 else
     echo "Une erreur s'est produite lors de l'installation de Git."
fi 
# Nettoyer les fichiers temporaires
cd ..
rm -rf git-2.33.0
git-2.33.0.tar.gz
exit 0
