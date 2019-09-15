#!/bin/bash
echo "#####################################"
echo "#          FTP Config  v1.0         #"
echo "#####################################"
echo " "
echo "*   Enter '1' to START FTP server"
echo "*   Enter '0' to STOP FTP server"
echo "------------------------------------"
echo "*   Enter 'o' for more options"
echo -e "*   Enter your option: " | tr -d '\n'; 
read option;

if [ $option == 1 ]
then
   sudo systemctl restart vsftpd
   echo -e "---\nYour local IP is: "
   ip route list | grep -Eo 'src (addr:)?([0-9]*\.){3}[0-9]*' | tr -d ' src'
   echo -e "Your public IP is:";
   curl ifconfig.me
   echo " "
   echo "the default port is 21."
   echo "Don't forget to use ftp:// if accessing from a browser"
   echo -e "\nStarted all services! :)";
elif [ $option == 0 ]
then
   sudo systemctl stop vsftpd
   echo -e "---\nStopped all services!";
fi