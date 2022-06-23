#!/bin/sh
# install.sh

# Folder structure
mkdir -p plugins_repo/plugins ssl/certs ssl/private

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
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/scripts/puestaapunto.sh > puestaapunto.sh
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/scripts/instalar_composer.sh > plugins_repo/plugins/instalar_composer.sh
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/scripts/instalar_moosh.sh > plugins_repo/plugins/instalar_moosh.sh

docker-compose up -d

echo '
Para finalizar la instalación desatendida e instalar herramientas ejecuta el siguiente script:
./puestaapunto.sh
'
chmod +x puestaapunto.sh