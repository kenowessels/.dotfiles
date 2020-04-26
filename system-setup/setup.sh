#!/bin/bash

echo 'This Setup script helps to initialize a new system Setup.'
echo '1.) Installing Packages'
echo '2.) Set Default Shell (WIP)'
echo ''

# Package Manager
PS3="Package Manager : "
select packagemanager in "pacman" "apt-get" "Skip package install" Abort
do
   case "$packagemanager" in
     Abort)  echo "End"; break ;;
        "")  echo "Invalid" ;;
   apt-get) echo "Not Supported Yet" ;;
         *)  echo "You chose $packagemanager" &&\
             break
   esac
done

# Install Packages with Pacman
if [ $packagemanager = "pacman" ]; then
    echo 'This will install these packages:'
    echo '-------'
    cat pacmanpkglist.txt
    echo '-------'
    echo ''
    echo 'Do you Agree? (Y/n)'
    read aggreepkginstall

    if [ -z "$aggreepkginstall" ] || [ $aggreepkginstall = 'Y' ] || [ $aggreepkginstall = 'y' ]; then
        sudo pacman -S - < pacmanpkglist.txt
    else
        echo "Won't install anything"
    fi
fi
