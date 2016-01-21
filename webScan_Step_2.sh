#! /bin/bash 


if [ ${#} -eq 1 ];then 

for i in $(cat $1);do 

port=$(echo $i | cut -d "," -f2)""
i=$(echo $i | cut -d "," -f1)""

xconnection="XConnection_"$port"_port_Web.txt"
echo "****************************" >> $xconnection
echo "*Scanning $port-Port @ $(date)*" >> $xconnection
echo "****************************" >> $xconnection 


if [ $(ping -c5 $i|grep "64 bytes from" |wc -l) -ge 1 ];then
	# If server is pingable Start Scan
	#Create Directory for each IP Address
	baseFile="/root/Desktop/EBC/Web_2/Web_port_"$port"-Nikto-Scan/"
	mkdir -p $baseFile
	ipBase="$(echo $i|tr '.' '_')"
	filePath=$baseFile$ipBase"_logs"
	#echo $filePath 
	mkdir -p $filePath	
	
	#Enter working Directory 
        cd $filePath	
	echo "**************************************************">>$ipBase"_log.txt"
	echo "*[+] Web Scan on port "$port "start @ $(date) *" >> $ipBase"_log.txt"
	echo "**************************************************">>$ipBase"_log.txt"
	#cat $ipBase"_log.txt"
	echo "--------------------------------"
	echo "[+]Scanning $i ..." ;
        #tail -f $ipBase"_log.txt" & 	
	nikto -host $i -port $port -o $ipBase.txt  
	echo "---------End of Scanning------------"
	#clear 	
	#Exit from Old working directory 
	#cd .. 
	
else 
	echo "*************************************************************"
	echo "- $i doesn't reply to my ping @ $(date) -" >> ../$xconnection
fi

	done
else 
	echo "Usage $0 hostIPAddressesListFile" 
	
fi	 


