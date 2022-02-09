#!/bin/bash
users=$(cat names.csv)
group=developers
# To ensure only elevated users can run the script
        if [ $(id -u) -eq 0 ]; then

# Reading the names.csv file
        for user in $users;
do
                echo $user
        if id "$user" &>/dev/null
        then
                userdel -r $user
        else

        echo "User does not exist"
        fi

done
    # delete the group
        groupdel $group
        if [ $(echo $?) -eq 0 ];
        then
        echo "$group group deleted"
else
        echo 
        fi
else
        echo "Only Admin can offboard a user"
        fi