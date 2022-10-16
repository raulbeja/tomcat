sudo apt-get update
#Instalamos Java y las librerias para JDBC
echo "Instalando Openjdk11..."
sudo apt-get install -y openjdk-11-jdk
sudo apt-get -y install curl

echo "Preparando e Instalando Tomcat 10..."
# Añadir usuario a grupo tomcat
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/cluster tomcat

# Descargar Tomcat
cd /home/vagrant
curl -O --progress-bar https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz

#Extraer en /opt/tomcat
sudo mkdir /opt/cluster
sudo mkdir /opt/cluster/tomcat1
sudo mkdir /opt/cluster/tomcat2
sudo mkdir /opt/cluster/tomcat3
sudo tar xzvf apache-tomcat-*tar.gz -C /opt/cluster/tomcat1 --strip-components=1

# Asignar a grupo de usuarios tomcat
cd /opt/cluster/tomcat1
sudo chgrp -R tomcat /opt/cluster/tomcat1
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

sudo cp -rp /opt/cluster/tomcat1/* /opt/cluster/tomcat2

# Copiar ficheros de configuracion para acceder a manager
sudo cp /vagrant/tomcatconfig/context.xml /opt/cluster/tomcat1/webapps/manager/META-INF/context.xml
sudo cp /vagrant/tomcatconfig/context.xml /opt/cluster/tomcat1/webapps/host-manager/META-INF/context.xml
# Copiar ficheros de configuracion servidor y usuarios
sudo cp /vagrant/tomcatconfig/server1.xml /opt/cluster/tomcat1/conf/server.xml
sudo cp /vagrant/tomcatconfig/tomcat-users.xml /opt/cluster/tomcat1/conf/tomcat-users.xml

sudo cp /vagrant/tomcatconfig/context.xml /opt/cluster/tomcat2/webapps/manager/META-INF/context.xml
sudo cp /vagrant/tomcatconfig/context.xml /opt/cluster/tomcat2/webapps/host-manager/META-INF/context.xml
# Copiar ficheros de configuracion servidor y usuarios
sudo cp /vagrant/tomcatconfig/server2.xml /opt/cluster/tomcat2/conf/server.xml
sudo cp /vagrant/tomcatconfig/tomcat-users.xml /opt/cluster/tomcat2/conf/tomcat-users.xml

# Copiar 
sudo cp /vagrant/webapps/*.war /opt/cluster/tomcat1/webapps
sudo cp /vagrant/webapps/*.war /opt/cluster/tomcat2/webapps

