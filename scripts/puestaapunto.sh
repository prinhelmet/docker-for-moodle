#!/bin/bash
echo "Puesta a punto de la instalación"
if [ ! $# == 1 ]; then
    echo "Por favor, indique el nombre del contenedor. Quizás tenga un nombre similar a FOLDER_moodle_1"
    exit
fi

echo "Instalando moodle"
docker exec $1 /bin/bash -c "php /var/www/html/moodle/admin/cli/install_database.php --lang=es --adminuser=admin --adminpass=moodle --adminemail=admin@nomail.com --fullname=Moodle --shortname=moodle --agree-license"
echo "Haciendo ejecutables los scripts disponibles"
docker exec $1 /bin/bash -c "chmod +x /var/www/html/*.sh"
docker exec $1 /bin/bash -c "/var/www/html/instalar_composer.sh"
docker exec $1 /bin/bash -c "/var/www/html/instalar_moosh.sh"
docker exec $1 /bin/bash -c "/var/www/html/instalar_idiomas.sh"
echo "Cambiando propietario y grupo las carpetas de moodle y moodledata a www-data"
docker exec $1 /bin/bash -c "chown -R www-data:www-data /var/www/html/moodle*"