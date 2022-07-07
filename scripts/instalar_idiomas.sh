#!/bin/bash
echo "Instalando idiomas..."

echo "Creando carpeta /var/www/html/moodledata/lang"
mkdir -p /var/www/html/moodledata/lang

echo "Descargando paquete de idioma: es.zip"
curl -O https://download.moodle.org/langpack/3.11/es.zip
echo "Descomprimiendo paquete de idioma: es.zip"
unzip -q es.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: es.zip"
rm -f es.zip

echo "Descargando paquete de idioma: ca.zip"
curl -O https://download.moodle.org/langpack/3.11/ca.zip
echo "Descomprimiendo paquete de idioma: ca.zip"
unzip -q ca.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: ca.zip"
rm -f ca.zip

echo "Descargando paquete de idioma: ca_valencia.zip"
curl -O https://download.moodle.org/langpack/3.11/ca_valencia.zip
echo "Descomprimiendo paquete de idioma: ca_valencia.zip"
unzip -q ca_valencia.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: ca_valencia.zip"
rm -f ca_valencia.zip

echo "Descargando paquete de idioma: eu.zip"
curl -O https://download.moodle.org/langpack/3.11/eu.zip
echo "Descomprimiendo paquete de idioma: eu.zip"
unzip -q eu.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: eu.zip"
rm -f eu.zip

echo "Descargando paquete de idioma: ast.zip"
curl -O https://download.moodle.org/langpack/3.11/ast.zip
echo "Descomprimiendo paquete de idioma: ast.zip"
unzip -q ast.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: ast.zip"
rm -f ast.zip

echo "Descargando paquete de idioma: gl.zip"
curl -O https://download.moodle.org/langpack/3.11/gl.zip
echo "Descomprimiendo paquete de idioma: gl.zip"
unzip -q gl.zip -d /var/www/html/moodledata/lang/
echo "Elimiinado paquete de idioma: gl.zip"
rm -f gl.zip

echo "Cambiando permisos, propietario y grupo www-data a la carpeta /var/www/html/moodledata/lang"
chmod -R 777 /var/www/html/moodledata/lang
chown -R www-data:www-data /var/www/html/moodledata/lang