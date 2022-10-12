sudo apt-get update
sudo apt-get install -y mariadb-server

sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service

sudo mysql -e "CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin'"
sudo mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION"
sudo mysql -e "FLUSH PRIVILEGES"

sudo mysql -e "CREATE DATABASE IF NOT EXISTS authority"
sudo mysql -e "use authority;CREATE TABLE IF NOT EXISTS users ( \
    user_name varchar(15) not null primary key, \
    user_pass varchar(255) not null \
    ) ENGINE=INNODB;" \

sudo mysql -e "use authority;CREATE TABLE IF NOT EXISTS user_roles ( \
    user_name varchar(15) not null, \
    role_name varchar(25) not null, \
    primary key (user_name,role_name) \
    ) ENGINE=INNODB;" \

sudo mysql -e "use authority; INSERT INTO users (user_name, user_pass) \
        VALUES('admin', 'a4e090bbc4b6f4d1f936069abe5d6889a0cc4a70959b0954266be8c3ed3d5556\$1\$697bd1264dc9a87f6daab41c24ead73febc882aef2b70a1b0bf8626161fb900c')"

sudo mysql -e "use authority; INSERT INTO user_roles (user_name, role_name) \
        VALUES('admin', 'manager-gui')"
sudo mysql -e "use authority; INSERT INTO user_roles (user_name, role_name) \
        VALUES('admin', 'manager-script')"
sudo mysql -e "use authority; INSERT INTO user_roles (user_name, role_name) \
        VALUES('admin', 'manager-jmx')"
sudo mysql -e "use authority; INSERT INTO user_roles (user_name, role_name) \
        VALUES('admin', 'manager-status')"
