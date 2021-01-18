gcloud compute ssh instance-1

----------->
/opt/lampp/bin/mysqldump -uroot -p fliperang > /home/wai/Geek/Varios/fliperang/_backups/lumine.sql
mysqldump.exe --user=root --password= --result-file="./_backups/vitaschool.sql" --databases "homeschool"

>mysql -uroot -p

    CREATE DATABASE vitaschool;

>mysql -uroot -p vitaschool < _backups/vitaschool.sql

>rm -r uploads && mkdir uploads && cp -a _backups/uploads/ . && chmod -R 777 uploads

>cp -a _backups/certificado /etc/nginx/certs/vitaschool.pe/

>ln -s /etc/nginx/sites-available/vitaschool.com /etc/nginx/sites-enabled/


>crear application/config/development/wai.php
>crear application/config/development/database.php
