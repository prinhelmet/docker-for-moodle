#!/bin/bash
echo "Instalando moosh..."
cd
git clone https://github.com/tmuras/moosh.git
cd moosh
composer install
ln -s $PWD/moosh.php /usr/local/bin/moosh
