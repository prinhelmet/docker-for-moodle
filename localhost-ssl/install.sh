#!/bin/sh
# install.sh

# Folder structure
mkdir private_html
mkdir private_html/moodledata
mkdir public_html
mkdir public_html/plugins
mkdir ssl
mkdir ssl/certs
mkdir ssl/private

# Moodle Clone from git (or create public_html/moodle)
cd public_html
git clone git://git.moodle.org/moodle.git html
cd html
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE
git checkout MOODLE_311_STABLE
cd ..
cd ..

# Create installation & configuration files
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/docker-compose.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/custom-php.ini > custom-php.ini
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/config.php > public_html/html/config.php
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/ssl/certs/mycert.crt > ssl/certs/mycert.crt
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/ssl/private/mycert.key > ssl/private/mycert.key

# Create Docker image with ssl files & config
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/localhost-ssl/Dockerfile > Dockerfile
docker build -t="localhostsslphp:7.4" .

# Link to config.php for decoupled plugins development
cd public_html/plugins
ln -s ../html/config.php
cd ../..

# Change groups & Privileges
sudo chgrp -R www-data public_html
sudo chmod -R g+w public_html
sudo chgrp -R www-data private_html
sudo chmod -R g+w private_html

echo 'Run: docker-compose up -d'
