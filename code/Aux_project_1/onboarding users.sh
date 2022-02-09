#!/bin/bash
users=$(cat names.csv)
PASSWORD=password
group=developers

# To ensure only elevated users can run the script
        if [ $(id -u) -eq 0 ]; then

# create a developers group
        groupadd $group
        echo "$group group added"

# Reading the names.csv file
        for user in $users;
        do
                echo $user
        if id "$user" &>/dev/null
        then
                echo "User Exists"
        else

# Create a new user
        useradd -m -d /home/$user -s /bin/bash -g $group $user
        echo "New User Created"
        echo

# Create an ssh folder in the user's home directory
        su - -c "mkdir ~/.ssh" $user
        echo "ssh directory created for new user"
        echo

# Creating Athorised_keys file
        su - -c "touch ~/.ssh/authorized_keys" $user
        echo "Authorised keys file created this user"
        echo

# Setting the ownership and permissions for the file to the user
        su - -c "chown -R $user ~/.ssh" && su - -c "chmod 600 ~/.ssh/authorized_keys" $user
        echo "Ownership and permissions set for the user"
        echo

# Create and set public key for users on the server
        cp -R "/home/ubuntu/Shell/id_rsa.pub" "/home/$user/.ssh/authorized_keys"        
        echo "Copied public key to new user account"
        echo
        echo

        echo "New User Created"

# Set the password
        sudo echo -e "$PASSWORD\n$PASSWORD" | sudo passwd "$user"
        sudo passwd -x 5 $user
        fi
done
else
        echo "Only Admin can onboard a user"
        fi