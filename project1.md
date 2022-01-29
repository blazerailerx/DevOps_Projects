# Project 1

## LAMP stack implementation

Summary: This project was geared towards putting together, the technologies required to build a website using HTML, CSS, PHP and MySQL.
In order to complete this project, an Apache server, a MySQL server and PHP were installed on a linux server. The project was hosted on AWS cloud. On an Ubuntu 20.04 lts Linux instance. 

**Installation of the packages:**

```bash
sudo apt update && sudo apt upgrade -y 
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql

```

**Opened ports on the firewall to accept incoming HTTP and HTTPS traffic through the security group:**
![open ports](media/Project1_images/ports_opened.png)


Confirmed the apache server was running locally and also accessed it via the given public ip addresss.
```bash
sudo systemctl status apache2
curl http://localhost:80
```

**Initiated secure installation on mysql-server to configure strong password policy**
```bash
mysql_secure_installation
```

![SQL server running](media/Project1_images/mysql-server.png)

Apache has the capability of hosting more than one website on the server, this can be configured
**creating a virtual host on apache server and setting phpmyadmin:**

Created a folder to hold the website files for the virtual host:
```bash
sudo mkdir /var/www/projectlamp
```

Changed the owner of the folder to the current user:

```bash
sudo chown -R $USER:$USER /var/www/projectlamp
```

Edited the configuration files for the virtual host with the following config:

```bash

sudo vi /etc/apache2/sites-available/projectlamp.conf

<VirtualHost *:80>
    ServerName projectlamp
    ServerAlias www.projectlamp 
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/projectlamp
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
``` 

Disable the default Apache site:

sudo a2dissite 000-default

Enable the virtual host:
```bash
sudo a2dissite 000-default
```


```bash
sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html
```
![LAMP stack working](media/Project1_images/webpage_created.png)

Reorder the preference start page:
`sudo vi /etc/apache2/mods-enabled/dir.conf`


Create a phpmyadmin file to show php is up and running:

```bash
sudo vi /var/www/projectlamp/index.php
```

```php 
<?php
phpinfo();
```
The changes only took place after restarting the apache service
```bash

sudo systemctl restart apache2
```
![phpmyadmin working](media/Project1_images/Php_enabled.png)

*However, It is adviceable to remove the phpmyadmin file as it could disclose information to anyone enumerating the site for information.*