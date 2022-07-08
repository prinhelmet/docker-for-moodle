#!/bin/sh
# install.sh

# Folder structure
mkdir -p repo_privado/plugins repo_privado/scripts ssl/certs ssl/private contrib

# Generate self-signed certificates
openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout ./ssl/private/mycert.key -out ./ssl/certs/mycert.crt

# Moodle Clone from git (or create public_html/moodle)
git clone git://git.moodle.org/moodle.git moodle
cd moodle
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE
git checkout MOODLE_311_STABLE
cd ..

# Create installation & configuration files
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/localhost.conf > localhost.conf
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/custom-php.ini > custom-php.ini
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/Dockerfile > Dockerfile
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/docker-compose.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/config.php > moodle/config.php
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/scripts/puestaapunto.sh > puestaapunto.sh
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/scripts/instalar_composer.sh > repo_privado/scripts/instalar_composer.sh
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/scripts/instalar_moosh.sh > repo_privado/scripts/instalar_moosh.sh
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/scripts/instalar_idiomas.sh > repo_privado/scripts/instalar_idiomas.sh

docker-compose up -d --build

chmod +x puestaapunto.sh

echo 'Para realziar la instalación desatendida ejecuta el siguiente script:
./puestaapunto.sh'

# Eliminar restos instalación
rm -rf ./ssl ./localhost.conf ./repo_privado/scripts/*

# Enlazar config.php para carpeta de plugins externos
ln -s /var/www/html/moodle/config.php contrib/config.php