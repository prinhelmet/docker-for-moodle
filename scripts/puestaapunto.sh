#!/bin/bash
echo "Puesta a punto de la instalación"
if [ ! $# == 1 ]; then
    echo "Por favor, indique el nombre del contenedor. Quizás tenga un nombre similar a FOLDER_moodle_1"
    exit
fi

echo "Instalando moodle"
docker exec $1 /bin/bash -c "php /var/www/html/moodle/admin/cli/install_database.php --lang=es --adminuser=admin --adminpass=moodle --adminemail=admin@nomail.com --fullname=Moodle --shortname=moodle --agree-license"
docker exec $1 /bin/bash -c "chmod +x /var/www/plugins/*.sh"
docker exec $1 /bin/bash -c "/var/www/plugins/instalar_composer.sh"
docker exec $1 /bin/bash -c "/var/www/plugins/instalar_moosh.sh"
echo "Cambiando grupo de www"
docker exec $1 /bin/bash -c "chgrp -R www-data /var/www"