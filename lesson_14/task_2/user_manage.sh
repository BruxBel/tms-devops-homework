#!/usr/bin/env bash

#Checking root permissions
if [ "$(id -u)" != 0 ]
then
  echo "Root permissions required" >&2
  exit 1
fi

#Variables
file="/var/users.csv"
oldIFS="$IFS"

#Functions
check_user() {
    local i=1
    local original_user="$user"
    while cut -d: -f1 /etc/passwd | grep -q "^$user$"
    do 
        user="${original_user}${i}"
        ((i++))
    done
}

create_user() {
    #Restore IFS
    IS="$oldIFS"
    local shell="/sbin/nologin"
    
    #Create group if not exists
    if ! grep -q "^$group:" /etc/group; then
        groupadd "$group"
    fi

    # Sudoers configuration
    if [ "$group" = "it" ] || [ "$group" = "security" ]; then
        if ! grep -q "^%$group" /etc/sudoers; then
            cp /etc/sudoers /etc/sudoers.bkp
            echo "%$group ALL=(ALL) ALL" >> /etc/sudoers
        fi
        shell="/bin/bash"
    elif [ "$user" = "admin" ]; then
        if ! grep -q "^$user" /etc/sudoers; then
            cp /etc/sudoers /etc/sudoers.bkp
            echo "$user ALL=(ALL) ALL" >> /etc/sudoers
        fi
        shell="/bin/bash"
    fi

    # Create home directory if doesn't exist
    if [ ! -d "/home/$group" ]; then
        mkdir -p "/home/$group"
    fi
    
    # Create user
    useradd "$user" -g "$group" -b "/home/$group" -s "$shell" -c "Birthday $bday"
    
    # Set secure permissions on home directory
    chmod 755 "/home/$group"
}

#Check parameters
if [ $# -eq 2 ]; then
    user="$1"
    group="$2"
    echo "Username: $user   Group: $group"
    check_user
    create_user
elif [ -f "$file" ]; then
    IFS=$'\n'
    for line in $(tail -n +2 "$file" | tr '[:upper:]' '[:lower:]')
    do
        # Proper CSV parsing
        first_name=$(echo "$line" | cut -d, -f2)
        last_name=$(echo "$line" | cut -d, -f3)
        bday=$(echo "$line" | cut -d, -f4)
        group=$(echo "$line" | cut -d, -f5)
        
        # Remove carriage returns and trim spaces
        first_name=$(echo "$first_name" | tr -d '\r' | xargs)
        last_name=$(echo "$last_name" | tr -d '\r' | xargs)
        group=$(echo "$group" | tr -d '\r' | xargs)
        bday=$(echo "$bday" | tr -d '\r' | xargs)
        
        user=$(echo "${first_name:0:1}.$last_name" | tr -d ' ')
        check_user
        echo "Username: $user Group: $group"
        create_user
    done
    IFS="$oldIFS"
else
    echo "Welcome!"
    select option in "Add user" "Show users" "Exit"
    do  
        case $option in
            "Add user")
                read -p "Enter username: " user
                read -p "Enter groupname: " group
                check_user
                create_user 
                ;;
            "Show users")
                cut -d: -f1 /etc/passwd 
                ;;
            "Exit")
                break 
                ;;
            *) 
                echo "Wrong option" 
                ;;
        esac
    done
fi
