#Instalamos apache
echo "Instalando Apache..."
sudo apt-get install -y apache2 libapache2-mod-jk

sudo cp /vagrant/apacheconfig/mod_jk.conf /etc/apache2/mods-enabled/
sudo cp /vagrant/apacheconfig/workers.properties /etc/apache2/conf-enabled/
sudo cp /vagrant/apacheconfig/apache2.conf /etc/apache2/
sudo cp /vagrant/apacheconfig/000-default.conf /etc/apache2/sites-enabled/

sudo systemctl restart apache2
