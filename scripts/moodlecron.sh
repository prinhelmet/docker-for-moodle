#!/bin/bash
su - www-data -c "php /var/www/html/moodle/admin/cli/cron.php" > /dev/null 2>&1