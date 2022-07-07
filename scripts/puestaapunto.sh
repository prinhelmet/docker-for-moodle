#!/bin/bash
echo "Puesta a punto de la instalación"
if [ ! $# == 1 ]; then
    echo "Por favor, indique el nombre del contenedor. Quizás tenga un nombre similar a FOLDER_moodle_1"
    exit
fi

echo "Instalando moodle"
docker exec $1 /bin/bash -c "php /var/www/html/moodle/admin/cli/install_database.php --lang=es --adminuser=admin --adminpass=moodle --adminemail=admin@nomail.com --fullname=Moodle --shortname=moodle --agree-license"
docker exec $1 /bin/bash -c "chown -R www-data:www-data /var/www/html/moodledata"
echo "Eliminando libreria oci8 (oracle php)"
docker exec $1 /bin/bash -c "mv /usr/local/etc/php/conf.d/docker-php-ext-oci8.ini /usr/local/etc/php/conf.d/docker-php-ext-oci8.ini_back"