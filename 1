#! /bin/bash

clear
#######################################################
echo "************************************************";
echo "*****  -- Host-Enum Script V1.0[ Enum ]-- ******";
echo "******  -- Muhammed Muhammed Bassem  -- ********";
echo "*****   --        PWB V3 Labs        -- ********";
echo "************************************************";
########################################################
nameServer="_nameServer"
mailServer="_mailServer"
ipAddress="_ipAddress"
soa="_SOA"

function hostCommand(){
	# $1 type , $2 hostname , $3 filename 
	host -t $1 $2 > $3
	cat $3 
	echo -e "------------------------------------\n"
	
} 

function createFile(){
	# $1 contain domain , $2 filename as "_[a-z]"
	echo "# "$1" has "$2 >> README.md 
	touch $2
}


echo -e "[*] Welcome for Enum Host Script ....\n"
echo -n  "Enter Host name for Enumeration : "
read hostname

working_directory=$hostname"_workSpace"
echo -e "------------------------------------"
echo -e "------Creating Working Space--------"
echo -e "------------------------------------"
if [ ! -d $working_directory ]; then 
	mkdir $working_directory 
fi 

echo -e "------------------------------------"
echo -e "------Go To working Directory-------"
echo -e "------------------------------------"
cd $working_directory


echo -e "------------------------------------"
echo -e "-------Enumerate $hostname ---------"
echo -e "------------------------------------"
echo -e "[*] DNS server Listing : \n"
createFile $hostname $nameServer
hostCommand ns $hostname  $nameServer 

echo -e "[*] Mail server Listing : \n"
createFile $hostname $mailServer
hostCommand mx $hostname  $mailServer 

echo -e "[*] SOA  Listing : \n"
createFile $hostname $soa
hostCommand soa $hostname  $soa

echo -e "[*] Server IP Address Listing : \n"
createFile $hostname $ipAddress
hostCommand A $hostname  $ipAddress

