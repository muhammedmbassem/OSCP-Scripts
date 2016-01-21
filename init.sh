#! /bin/bash
clear 
#--------------#
# Tag - Header #
#--------------#
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
function banner(){
			echo -e "Welcome $(whoami)!";
		}


#banner

progressbar "Copying" 10 ;
