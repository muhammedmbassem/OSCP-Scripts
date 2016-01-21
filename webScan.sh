#! /bin/bash 


if [ ${#} -eq 2 ];then 
port=$2
for i in $(cat $1);do 
   method=$(echo $i | cut -d "#" -f2)""
  i=$(echo $i | cut -d "#" -f1)""

xconnection="XConnection_"$2"_port_Web.txt"
echo "****************************" >> $xconnection
echo "*Scanning $2-Port @ $(date)*" >> $xconnection
echo "****************************" >> $xconnection 
   

 if [ $(ping -c2 $i|grep "64 bytes from" |wc -l) -ge 1 ];then
	# If server is pingable Start Scan
	#Create Directory for each IP Address
########	baseFile="/root/Desktop/EBC/Web/Web_port_"$2"-Nikto-Scan/"
########	mkdir -p $baseFile
######	ipBase="$(echo $i|tr '.' '_')"
######	filePath=$baseFile$ipBase"_logs"
#####	mkdir -p $filePath	
	
	#Enter working Directory 
#####        cd $filePath	
#####	#####echo "**************************************************">>$ipBase"_log.txt"
#####	echo "*[+] Web Scan on port "$2 "start @ $(date) *" >> $ipBase"_log.txt"
#####	echo "**************************************************">>$ipBase"_log.txt"
	#cat $ipBase"_log.txt"
#####	echo "--------------------------------"
	echo "[+]Scanning $i ..." ;
        #tail -f $ipBase"_log.txt" & 	
########	nikto -host $i -port $2 -o $ipBase.txt

	dirb $method://$i:$2

	echo "---------End of Scanning------------"
	#clear 	
	#Exit from Old working directory 
	#cd .. 
	
else 
	echo "*************************************************************"
	echo "- $i doesn't reply to my ping @ $(date) -" #####>> ../$xconnection
fi

	done
else 
	echo "Usage $0 hostIPAddressesListFile port" 
	
fi	 


