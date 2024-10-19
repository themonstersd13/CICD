#! /bin/bash


#install apt docker
sudo bash ./Extras/installdocker.sh

#install jenkins
sudo bash ./Jenkins/install.sh


#install docker group
sudo bash ./Extras/usermod.sh

