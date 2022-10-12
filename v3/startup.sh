# Copiar servicio y recargar
sudo cp /vagrant/tomcatconfig/tomcat.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo systemctl enable tomcat
# Crear regla en el firewall
sudo ufw allow 80
sudo ufw allow 8080
sudo ufw allow 8009
