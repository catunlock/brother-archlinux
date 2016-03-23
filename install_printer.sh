#!/bin/bash

echo "Instalando dependencias"

sudo pacman -Sy cups 

echo "Instalando paquetes"

curl -O http://download.brother.com/welcome/dlf006156/mfc5490cnlpr-1.1.2-2.i386.deb


ar vx mfc5490cnlpr-1.1.2-2.i386.deb
tar -zxvf data.tar.gz

sudo cp -R usr /

rm -R usr
rm -R data.tar.gz
rm -R control.tar.gz
rm -R debian-binary
rm -R mfc5490cnlpr-1.1.2-2.i386.deb


curl -O http://download.brother.com/welcome/dlf006158/mfc5490cncupswrapper-1.1.2-2.i386.deb

ar vx mfc5490cncupswrapper-1.1.2-2.i386.deb
tar -zxvf data.tar.gz

sudo cp -R usr /

rm -R usr
rm -R data.tar.gz
rm -R control.tar.gz
rm -R debian-binary

rm -R mfc5490cncupswrapper-1.1.2-2.i386.deb

echo "Configurando el servidor de impresion"

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

echo "Configurando la impresora"

sudo /usr/local/Brother/Printer/mfc5490cn/cupswrapper/cupswrappermfc5490cn

echo "Hecho, ve a http://127.0.0.1:631 i añade la impresora lpd://(Your printer's IP address)/binary_p1"
