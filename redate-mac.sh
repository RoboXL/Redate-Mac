#!/bin/bash

echo "This script will update your installed macOS and Apple-supplied software. Do you want to proceed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            # Check for and install available updates
            echo "Checking for available updates..."
            sudo softwareupdate -ia

            # Ask user if they want to restart
            read -p "Packages have been updated. Do you want to restart your computer now? [y/n] " restart
            if [ "$restart" == "y" ]; then
                sudo shutdown -r now
            fi
            break;;
        No ) 
            echo "Update cancelled."
            exit;;
    esac
done