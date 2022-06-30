FROM docker.io/moodlehq/moodle-php-apache:7.4
RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb && a2enmod proxy && a2enmod proxy_http && a2enmod proxy_balancer && a2enmod lbmethod_byrequests
COPY ./ssl /etc/ssl
COPY ./localhost.conf /etc/apache2/sites-available/
RUN a2ensite localhost
COPY ./plugins_repo/scripts/* /var/www/html/
RUN chsh --shell /bin/bash www-data
RUN apt update
RUN apt install -y nano cron
COPY ./www-data-crontab /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
RUN chmod 0600 /var/spool/cron/crontabs/root
RUN service cron start