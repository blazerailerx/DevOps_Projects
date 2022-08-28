# Project 7

## Tooling Website solution 
Summary: This project shares some similarities with the previous one in the sense that the database 
server used for the previous project had to be connected to remotely. There are little differences this time around. This time, a Network File System (NFS). In this project a tooling website(more like ongoing development) is going to be hosted with its storage mounted in a Network File System (NFS) server.

A Red Hat Enteprise Linux Server was used for the project.
To enable the NFS service, a user data script was run to prepare the environment on boot.

```bash
sudo yum -y update
sudo yum install lvm2
sudo yum install nfs-utils -y
sudo systemctl start nfs-server.service
sudo systemctl enable nfs-server.service
sudo systemctl status nfs-server.service
```

![](media/Project7_images/partitions_created.png)



![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)
![](media/Project7_images/)