#! /bin/bash 

scan (){
if [ ${#} -eq 2 ];then 

for i in $(cat $1);do 

echo "****************************" >> XConnection.txt
echo "*Scanning $2-Rank @ $(date)*" >> XConnection.txt
echo "****************************" >> XConnection.txt 


if [ $(ping -c5 $i|grep "64 bytes from" |wc -l) -ge 1 ];then
	# If server is pingable Start Scan
	#Create Directory for each IP Address
	baseFile="/root/Desktop/target/nmap_"$2"-Rank/"
	mkdir -p $baseFile
	ipBase="$(echo $i|tr '.' '_')"
	filePath=$baseFile$ipBase"_logs"
	echo $filePath 
	mkdir -p $filePath	
	
	#Enter working Directory 
        cd $filePath	
	echo "**************************************************">>$ipBase"_log.txt"
	echo "*[+] Scan S-Rank  $(date) *" >> $ipBase"_log.txt"
	echo "**************************************************">>$ipBase"_log.txt"
	cat $ipBase"_log.txt"
	echo "--------------------------------"
	echo "[+]Scanning $i ..." ;
        tail -f $ipBase"_log.txt" & 	
	nmap -sV -sS -sC  --traceroute -T3 --reason --open -v -A $i -oX $ipBase"_scan.xml" -oA $ipBase"_xlog.txt"
	echo "---------------------------------"
	#clear 	
	#Exit from Old working directory 
	cd .. 
	
else 
	echo "*************************************************************"
	echo "- $i doesn't reply to my ping @ $(date) -" >> ../XConnection.txt
fi

	done
else 
	echo "Usage $0 hostIPAddressesListFile {S|C|N} " 
	
fi	 

}

collect (){


}


}
