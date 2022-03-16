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
Then formatted with the commmand below, to format the partitions to Linux LVM filesystem using `8e00` and the changes to the partition table were written with the `w` option:
```bash
sudo gdisk /dev/xvdf
sudo gdisk /dev/xvdg
sudo gdisk /dev/xvdh
```
![](media/Project6_images/formatting_disks.png)

After formatting the partitions, physical volumes were created out of them using the pvcreate utility
```bash
sudo pvcreate /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
```
![](media/Project6_images/pvs.png)

These physical volumes were combined into a volume group called webdata as shown below
```bash
sudo vgcreate webdata-vg /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
```
![](media/Project6_images/volume_group.png)

The newly created volume group was split into two (2) to form two (2) equal Logical volumes
```bash
sudo lvcreate -L 14G -n apps-lv webdata-vg
sudo lvcreate -L 14G -n logs-lv webdata-vg
sudo pvs
```
![](media/Project6_images/web_logical_volumes.png)



![](media/Project6_images/)
![](media/Project6_images/)
![](media/Project6_images/)
