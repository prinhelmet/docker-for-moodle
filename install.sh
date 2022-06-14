#!/bin/sh
# install.sh

# Folder structure
mkdir -p public_html/plugins

# Create installation & configuration files
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/master/localhost/docker-compose.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/master/localhost/custom-php.ini > custom-php.ini

# Moodle Clone from git (or create public_html/moodle)
cd public_html
git clone git://git.moodle.org/moodle.git html
cd html
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE
git checkout MOODLE_311_STABLE
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/main/config.php > config.php
cd ..
cd plugins
ln -s ../html/config.php
cd ..
cd ..

echo 'Remember make a symbolic link from -plugins- folder to -html/config.php- file: plugins$ ln -s ../html/config.php'
echo 'Run: docker-compose up -d'
