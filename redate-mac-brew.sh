#!/bin/bash

echo "This script will update your installed packages using Homebrew. Do you want to proceed?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            # Update package list
            echo "Updating package list..."
            brew update

            # Upgrade all installed packages
            echo "Upgrading installed packages..."
            brew upgrade

            # Clean up old versions of installed packages
            echo "Cleaning up old versions of installed packages..."
            brew cleanup

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
