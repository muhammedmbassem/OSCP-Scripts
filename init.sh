#! /bin/bash
clear 
#--------------#
# Tag - Header #
#--------------#
baseWorkingDirectory="/root/Desktop/"
# Take two parameter operationName and How many Stages 
function progressbar(){
if [ ${#} == 2 ];then
 
	operationName=$1;
	numberOfStages=$2;
	counterLoop=0;
	jump=$(( 100/$numberOfStages ))
	
while [ $counterLoop -lt $(($numberOfStages*$jump)) ];do 

	echo -en "   "$operationName" ("$counterLoop")%\r";
	counterLoop=$(($counterLoop + $jump));
	iterator=0;
	while [ $iterator -lt $counterLoop ];do
		echo -en "\\ \r";
		sleep 0.0001;
		echo -en "| \r";
		sleep 0.0001;
		echo -en "/ \r";
		sleep 0.0001;
		echo -en "- \r";
		sleep 0.0001;
		iterator=$(($iterator+1));
		done

	done
	echo -en "[*]"$operationName" ("100")%\n";

else 
	echo "Usgae : bash $0 operationName numberOfStages ";
fi


}

#require clientName, workspaceType
function workSpaceCreator(){
#Metasploit WorkSpace

if [ $2 == "D" ];then
progressbar "Creating $1 directory workspace" 40;
#Directory Structure 
# Define Web,network,
web=($baseWorkingDirectory""$1"/web")
network=($baseWorkingDirectory""$1"/network")
mkdir -p $network
mkdir -p $web 
fi 


}

#Let's Define ClientName,listofIP Addresses 'Scope', 
function init(){
	banner;
	echo -en "Client Name:"
	read clientName
	workSpaceCreator $clientName "D"	

}

function banner(){
			echo -e "Welcome $(whoami)!";
		}


#banner

#progressbar "Copying" 10 ;

init
