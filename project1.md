# Project 1
## LAMP stack implementation
Installation of the packages:
```bash
sudo apt update && sudo apt upgrade -y 
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql

```

Opened ports on the firewall to accept incoming HTTP and HTTPS traffic:
![open ports](https://github.com/blazerailerx/dareyio-pbl/blob/main/project1_images/ports%20opened.png)


Confirmed the apache server was running and accessed it via public ip addresss.
```bash
sudo systemctl status apache2
curl http://localhost:80
```

Initiated secure installation on mysql-server to configure strong password policy
```bash
mysql_secure_installation
```
![SQL server running](https://github.com/blazerailerx/dareyio-pbl/blob/main/project1_images/mysql-server.png)

creating a virtual host on apache server and setting phpmyadmin:
```bash
sudo mkdir /var/www/projectlamp
sudo chown -R $USER:$USER /var/www/projectlamp
sudo vi /etc/apache2/sites-available/projectlamp.conf
sudo a2dissite 000-default
sudo a2dissite 000-default
sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html
sudo vi /etc/apache2/mods-enabled/dir.conf
sudo vi /var/www/projectlamp/index.php
sudo systemctl restart apache2
```
![phpmyadmin working](https://github.com/blazerailerx/dareyio-pbl/blob/main/project1_images/Php%20enabled.png)
![LAMP stack working](https://github.com/blazerailerx/dareyio-pbl/blob/main/project1_images/webpage%20created.png)