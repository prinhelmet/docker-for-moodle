FROM docker.io/moodlehq/moodle-php-apache:7.4
RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb && a2enmod proxy && a2enmod proxy_http && a2enmod proxy_balancer && a2enmod lbmethod_byrequests
COPY ./ssl /etc/ssl
COPY ./localhost.conf /etc/apache2/sites-available/
RUN a2ensite localhost
RUN cd ~ && curl -O https://download.moodle.org/langpack/3.11/ca.zip && unzip -q ca.zip -d /var/www/moodledata/lang/ && rm -f ca.zip
RUN cd ~ && curl -O https://download.moodle.org/langpack/3.11/ca_valencia.zip && unzip -q ca_valencia.zip -d /var/www/moodledata/lang/ && rm -f ca_valencia.zip
RUN cd ~ && curl -O https://download.moodle.org/langpack/3.11/eu.zip && unzip -q eu.zip -d /var/www/moodledata/lang/ && rm -f eu.zip
RUN cd ~ && curl -O https://download.moodle.org/langpack/3.11/ast.zip && unzip -q ast.zip -d /var/www/moodledata/lang/ && rm -f ast.zip
RUN cd ~ && curl -O https://download.moodle.org/langpack/3.11/gl.zip && unzip -q gl.zip -d /var/www/moodledata/lang/ && rm -f gl.zip