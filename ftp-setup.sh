#! /bin/bash
clear
#######################################################
echo "************************************************";
echo "*****  -- setup-ftp Script V1.0[ftpd ] -- ******";
echo "******  -- Muhammed Muhammed Bassem  -- ********";
echo "*****   --        PWB V3 Labs        -- ********";
echo "************************************************";
########################################################
echo "[*] Welcome for FTP Deamon Setup ...."
echo -e "1) Setup FTP Deamon\n"
echo -e "2) Create new FTP account \n"
echo -e "[---------------------------]\n"
echo -n "Please enter option No.: "
read option

if [ $option -eq 1 ] ;then
echo -e  "***************************\n"
echo -e "-- [*] install ftpdeamon --\n"
echo -e "***************************\n"
apt-get install pure-ftpd 
echo -e  "***********************\n"
echo -e "-- [*] Add ftpgroup  --\n"
echo -e "************************\n"
groupadd ftpgroup
echo -e  "*********************************\n"
echo -n "[*] Enter prefer Username : "
read user_name
echo  -e  "*********************************\n"
useradd -g ftpgroup -d /dev/null -s /etc  ftpuser
mkdir /ftphome/$user_name
pure-pw useradd $user_name -u ftpuser -g ftpgroup  -d /ftphome/$user_name
echo -e  "*****************************************\n"
echo -e "[*] Update database for Ftp User password\n"
echo -e "*****************************************\n"
pure-pw mkdb
echo -e "***************************************\n"
echo -e "-- [*] Review  {$user_name} Details -- \n"
echo -e "****************************************\n"
pure-pw show $user_name
echo -e "*****************************************\n"
echo -e "[*] Create Symbolic Link for PureDB file \n"
echo -e "*****************************************\n"
cd /etc/pure-ftpd/auth
ln -s /etc/pure-ftpd/conf/PureDB 50pure
ls -ls
echo -e "******************************************\n"
echo -e "-- [*] Change Owner of pubftp directory --\n"
echo -e "******************************************\n"
chown -R ftpuser:ftpgroup /ftphome/
echo -e "[*] starting FTP Server \n"
service pure-ftpd restart

else

                   if [ $option -eq 2 ] ;
                  then

	echo -e "\n*****************************************************************"
	echo -e "[*] You must has creat FTP Deamon from this Script for Direct use "
	echo -e "*******************************************************************"
	echo -e "````````````````````````````````````````````````````````````````````\n"
	echo  -e  "*********************************\n"
	echo -n "[*] Enter prefer Username : "	
	read user_name
	echo   -e  "*********************************\n"
	echo -e "[*] Creating Directory ...."
	mkdir /ftphome/$user_name
  	ls /ftphome | grep $user_name
	echo -e "[*] Create User Account"
	pure-pw useradd $(echo $user_name) -u ftpuser -g ftpgroup -d  /ftphome/$user_name
	echo -e "*****************************************\n"
	echo -e "[*] Update database for Ftp User password\n"
	echo -e "*****************************************\n"
	pure-pw mkdb
	echo -e "******************************************\n"
	echo -e "-- [*] Change Owner of pubftp directory --\n"
	echo -e "******************************************\n"
	chown -R ftpuser:ftpgroup /ftphome/$user_name
	echo -e "[*] starting FTP Server \n"
	service pure-ftpd restart
          
		else echo "invalied Entry "
                                fi 

fi 
#######################################################
echo "************************************************";
echo "*****  -- setup-ftp Script V1.0[ftpd ] -- ******";
echo "******  -- Muhammed Muhammed Bassem  -- ********";
echo "*****   --        PWB V3 Labs        -- ********";
echo "************************************************";
########################################################
