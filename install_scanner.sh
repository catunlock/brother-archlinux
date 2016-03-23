#!/bin/bash

echo "Instalando paquetes"

yaourt -S brscan3

echo "Configurando el escaner"

sudo /usr/local/Brother/sane/setupSaneScan3

sudo /usr/bin/brsaneconfig3 -a name=MFC-5490CN model=MFC-5490CN ip=192.168.1.99 
sudo /usr/bin/brsaneconfig3 -d

