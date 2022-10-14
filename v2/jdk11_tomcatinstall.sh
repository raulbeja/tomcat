#Instalamos Java y las librerias para JDBC
echo "Instalando Openjdk11..."
sudo apt-get install -y openjdk-11-jdk
echo "Instalando librerias mariadb-java..."
sudo apt-get install -y libmariadb-java
sudo apt-get -y install curl

echo "Preparando e Instalando Tomcat ..."
# Añadir usuario a grupo tomcat
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Descargar Tomcat
cd /home/vagrant
curl -O --progress-bar https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.0/bin/apache-tomcat-10.1.1.tar.gz

#Extraer en /opt/tomcat
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-1*tar.gz -C /opt/tomcat --strip-components=1

# Asignar a grupo de usuarios tomcat
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

# Copiar ficheros de configuracion para acceder a manager
cd /vagrant
sudo cp tomcatconfig/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo cp tomcatconfig/context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
# Copiar ficheros de configuracion servidor y usuarios
sudo cp tomcatconfig/server.xml /opt/tomcat/conf/server.xml
sudo cp tomcatconfig/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

# Copiar webapps
sudo cp webapps/*.war /opt/tomcat/webapps

#Copiar driver JDBC a tomcat
sudo cp /usr/share/java/mariadb-java-client* /opt/tomcat/lib/

# Copiar servicio y recargar
sudo cp tomcatconfig/tomcat.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
# Crear regla en el firewall
sudo ufw allow 8080
