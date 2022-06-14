#!/bin/sh
# install.sh

# Folder structure
mkdir -p public_html/plugins ssl/certs ssl/private

# Moodle Clone from git (or create public_html/moodle)
cd public_html
git clone git://git.moodle.org/moodle.git html
cd html
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE
git checkout MOODLE_311_STABLE
cd ..
cd ..

# Create installation & configuration files

curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost/custom-php.ini > custom-php.ini
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/docker-compose.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/config.php > public_html/html/config.php
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/ssl/certs/mycert.crt > ssl/certs/mycert.crt
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/ssl/private/mycert.key > ssl/private/mycert.key

# Create Docker image with ssl files & config
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/Dockerfile > Dockerfile

# Link to config.php for decoupled plugins development
cd public_html/plugins
ln -s ../html/config.php
cd ../..

echo 'Run: docker-compose up -d'
