apt update
apt install -y unixodbc odbcinst mariadb-client mariadb-server odbc-mariadb
systemctl enable mariadb
systemctl start mariadb

apt install python3-pip -y
pip install alembic
pip install psycopg2-binary
pip install mysql-connector-python
apt install python3-pymysql python3-mysqldb -y
pip install mysqlclient
pip install "importlib_metadata==1.5.2"
pip install "zipp==1.2.0"
pip install "configparser==3.8.1"

sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb

cd /usr/src/asterisk/contrib/ast-db-manage
mv config.ini.sample config.ini

nano /usr/src/asterisk/contrib/ast-db-manage/config.ini :set mouse=a



/usr/bin/mysql_secure_installation
mysql -u root
CREATE USER 'asterisk'@'localhost' IDENTIFIED BY 'Lokopoko0';
CREATE DATABASE asterisk;
GRANT ALL privileges on asterisk.* to 'asterisk'@'localhost' identified by 'Lokopoko0';
FLUSH privileges;


GRANT ALL PRIVILEGES ON *.* TO 'asterisk'@'%' IDENTIFIED BY 'Lokopoko0' WITH GRANT OPTION;
FLUSH PRIVILEGES;

alembic -c config.ini upgrade head
mysql -u root
show databases;
use asterisk;
show tables;


cd /tmp/ && curl -fsSL https://github.com/julianol1berato/asterisk-yt/releases/download/filesconfig/asterisk.tar -o asterisk.tar && tar xvf asterisk.tar

mv *.conf /etc/asterisk

#pjsip.conf
#[global]
#user_agent=callphone
#keep_alive_interval=90
#;endpoint_identifier_order=ip,username,anonymous,header,auth_username
#
#[acl]
#type=acl
#permit=0.0.0.0/0.0.0.0
#
#[utrunk]
#type=transport
#protocol=udp
#bind=0.0.0.0:5060
#allow_reload=yes
#tos=cs3
#cos=3
#
#
#
#/etc/odbc.ini
#[asterisk]
#Description = MySQL Asterisk
#Driver = MariaDB Unicode
#Database = asterisk
#Server = localhost
#User = asterisk
#Password = Lokopoko0
#Port = 3306
#Socket = /var/run/mysqld/mysqld.sock



#pjsip.conf
#[global]
#user_agent=callphone
#keep_alive_interval=90
#;endpoint_identifier_order=ip,username,anonymous,header,auth_username
#
#[acl]
#type=acl
#permit=0.0.0.0/0.0.0.0
#
#[utrunk]
#type=transport
#protocol=udp
#bind=0.0.0.0:5060
#allow_reload=yes
#tos=cs3
#cos=3
#
#
#
#/etc/odbc.ini
#[asterisk]
#Description = MySQL Asterisk
#Driver = MariaDB Unicode
#Database = asterisk
#Server = localhost
#User = asterisk
#Password = 123456
#Port = 3306
#Socket = /var/run/mysqld/mysqld.sock

#nano res_odbc.conf
#nano pjsip.conf
#nano cdr_adaptive_odbc.conf
#nano /etc/odbc.ini
#systemctl restart mariadb
#systemctl restart asterisk
sudo apt install ufw
sudo ufw allow 80/tcp
sudo ufw allow 3306/tcp
sudo ufw allow 8088/tcp
sudo ufw allow 5060/tcp

