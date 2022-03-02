# Project 6

## Web solution with WordPress
Summary: This project shares some similarities with the previous one in the sense that the database 
server used for the previous project had to be connected to remotely. That's as far as similarities go,
This project is aimed at showcasing the three (3) application system used which is commonly used most in production environments.
The three tier application system is a model in application deployment that separates the typically closely-coupled system in different tiers
which handle presentation, application and data. The project will entail the configuration of a storage subsystem for the linux-based database and web servers. Extra EBS volumes will
be attached and formatted for use by the servers. The popular content management system(CMS); Wordpress would be used to handle the application tier while 
A MySQL database would be used to handle the data tier. Two(2) RedHat Linux servers were used for the project.



* Firstly, the web/application server (Wordpress) was configured:
Three EBS volumes were created and attached to the server.
The server was powered on and updated.

```bash
sudo yum update -y
```

The attached disks were confirmed using the command below 
```bash
lsblk
```
Then formatted with the commmand below, changes to the partition table were written with the `w` option:
```bash
sudo gdisk /dev/xvdf
```



![](media/Project6_images/)
![](media/Project6_images/)
![](media/Project6_images/)
