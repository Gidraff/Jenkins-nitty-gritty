#!/usr/bin/env bash

set -o errexit
set -o pipefail

_install_dependency_pkg() {
    sudo apt-get -y upgrade
    sudo apt-get -y update
    sudo apt-get install -y openjdk-8-jdk
    
    # Add Jenkins gpg key
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    
    if [ $? -ne 0]; then
        echo "Failed to download jenkins GPG key"
        exit 1
    fi
    echo "Ok: Add key was successful"
}

_setup_jenkins() {
    # Update source list with jenkins repo
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    if [ $? -ne 0 ]; then
        echo "Failed to update sources list"
        exit 1
    fi
    
    sudo apt-get update
    sudo apt-get -y install jenkins
    
    if [ $? -eq 0 ]; then
        sudo ufw allow 8080
        sudo service jenkins start
        
        sleep 1m
        
        echo "Installing Jenkins Plugins"
        JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
        echo $JENKINSPWD
    fi
}

main(){
    _install_dependency_pkg
    _setup_jenkins
}


main $@ # Pass all args