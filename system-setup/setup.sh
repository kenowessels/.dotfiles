#!/bin/bash

scriptpath=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo 'This Setup script helps to initialize a new system Setup.'
echo '1.) Installing Packages'
echo '2.) Set Default Shell (WIP)'
echo ''

# Package Manager
PS3="What System are you on? : "
select system in "arch" "ubuntu" "Abort"
do
   case "$system" in
     Abort)  echo "End"; break ;;
        "")  echo "Invalid" ;;
    ubuntu) echo "Not Supported Yet" ;;
         *)  echo "You chose $system" &&\
             break
   esac
done

# Install Packages for Arch-Linux
if [ $system = "arch" ]; then
    
    echo "Install 'yay' for aur package installation (Y/n)"
    read aggreeyayinstall
    if [ -z "$aggreeyayinstall" ] || [ $aggreeyayinstall = 'Y' ] || [ $aggreeyayinstall = 'y' ]; then
        sudo pacman --noconfirm -S yay
    else
        echo "Won't install yay";
    fi

    packagePath="${scriptpath}/arch-packages/*"

    for file in $packagePath;
    do
        echo -e "Do you want to Install this set of Packges? '${file}':"
        echo '-------'
        cat $file
        echo '-------'
        echo ''
        echo 'Do you Agree? (Y/n)'
        read aggreepkginstall

        if [ -z "$aggreepkginstall" ] || [ $aggreepkginstall = 'Y' ] || [ $aggreepkginstall = 'y' ]; then
            sudo yay --noconfirm -Syy - < $file
        else
            echo "Won't install '${file}'"
        fi
    done
fi

# TODO Step 2 "Set default shell"