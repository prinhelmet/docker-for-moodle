FROM docker.io/moodlehq/moodle-php-apache:7.4
RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb && a2enmod proxy && a2enmod proxy_http && a2enmod proxy_balancer && a2enmod lbmethod_byrequests
COPY ./ssl /etc/ssl
COPY ./localhost.conf /etc/apache2/sites-available/
RUN a2ensite localhost
COPY ./plugins_repo/scripts/* /var/www/html/
RUN chmod +x /var/www/html/*.sh
RUN /bin/bash /var/www/html/instalar_composer.sh
RUN /bin/bash /var/www/html/instalar_moosh.sh
RUN /bin/bash /var/www/html/instalar_idiomas.sh
RUN chown -R www-data:www-data /var/www/html/moodle*
RUN echo "alias ll='ls --color=auto -lha'" >> /root/.bashrc
RUN chsh --shell /bin/bash www-data
RUN apt update
RUN apt install -y nano cron
RUN touch /var/www/html/crontab.log
RUN (crontab -l -u root; echo "* * * * * su - www-data -c '/usr/local/bin/php /var/www/html/moodle/admin/cli/cron.php' > /var/www/html/crontab.log 2>&1") | crontab