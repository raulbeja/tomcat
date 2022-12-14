#Instalamos Java y las librerias para JDBC
echo "Instalando Openjdk11..."
sudo apt-get install -y openjdk-11-jdk
sudo apt-get -y install curl

echo "Preparando e Instalando Tomcat ..."
# Añadir usuario a grupo tomcat
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Descargar Tomcat
cd /home/vagrant
curl -O --progress-bar https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz

#Extraer en /opt/tomcat
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1

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

# Copiar 
sudo cp webapps/*.war /opt/tomcat/webapps

# Copiar servicio y recargar
sudo cp tomcatconfig/tomcat.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
# Crear regla en el firewall
sudo ufw allow 8080
