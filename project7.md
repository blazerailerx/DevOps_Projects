# Project 7

## Tooling Website solution 
Summary: This project shares some similarities with the previous one in the sense that the database 
server used for the previous project had to be connected to remotely. There are little differences this time around. This time, a Network File System (NFS). In this project a tooling website(more like ongoing development) is going to be hosted with its storage mounted in a Network File System (NFS) server.

A Red Hat Enteprise Linux Server was used for the project, with three disks attached to it.
To enable the NFS service, a user data script was run to prepare the environment on boot.

```bash
sudo yum -y update
sudo yum install lvm2
sudo yum install nfs-utils -y
sudo systemctl start nfs-server.service
sudo systemctl enable nfs-server.service
sudo systemctl status nfs-server.service
```
The above script installed the lvm utility which will be used for setting up logical partitions on the disks used on the NFS server and it alwso installs nfs-utils for setting up this server as a Network File Server.

After booting up, the disks were prepared for use by creating the Linux LVM partition type. 
![](media/Project7_images/partitions_created.png)

LVM was used to configure the disks and partioned into three partitions with
![](media/Project7_images/logical_volumes_created.png)

There logical partitions were split across the 3 disks which will contain as shown in the image below
![](media/Project7_images/lvm_created.png)

Then the NFS server utility was installed
![](media/Project7_images/nfs-utils_running.png)

![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)