#!/bin/sh
# install.sh

curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/master/docker-compose.yml > docker-compose.yml
curl -sSL https://raw.githubusercontent.com/prinhelmet/docker-for-moodle/master/custom-php.ini > custom-php.ini

mkdir private_html
mkdir private_html/moodledata
mkdir public_html
mkdir public_html/plugins
cd public_html
git clone git://git.moodle.org/moodle.git
cd moodle
git branch --track MOODLE_311_STABLE origin/MOODLE_311_STABLE
git checkout MOODLE_311_STABLE
cd ..
cd ..
chgrp -R www-data public_html
chgrp -R www-data private_html
chmod -R g+w private_html
