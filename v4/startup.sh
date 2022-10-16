# Copiar servicio y recargar
sudo cp /vagrant/tomcatconfig/tomcat1.service /etc/systemd/system/
sudo cp /vagrant/tomcatconfig/tomcat2.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomcat1
sudo systemctl enable tomcat1
sudo systemctl start tomcat2
sudo systemctl enable tomcat2
# Crear regla en el firewall
sudo ufw allow 7005,8005,7080,8080,8009,8010,7443,8443/tcp
