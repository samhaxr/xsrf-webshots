#!/bin/bash
#!Coded by Suleman Malik
#!www.sulemanmalik.com

function ln(){
echo -e "\033[0;31m=============================\033[0m"
}
function out(){
	echo -e "\033[0;31m==========================================================================\033[0m"
}
clear
figlet SSRF
echo -e '\033[0;32mby Suleman Malik\033[0m       v0.1.2'
ln
eval $init
echo ''
echo "Url: "
read url
echo " "
echo -e ""
len=$(wc -l < ssrf_payload | sed 's/ //g')
elap=0
while read ssrf
do
echo $url$ssrf >> _bck_
Cmd='curl --silent -I $url$ssrf --max-time 5 >> rs_temp &'
elap=$(expr $elap + 1)
echo -ne "\033[0;31m[[+]\033[0m \033[0;33m Injecting Payload:\033[0m: $elap/$len\r"
eval $Cmd
done < ssrf_payload
echo ' '
echo ' '
echo -e "\033[0;32m [+]\033[0m Loading Modules..."
echo ' '
echo -e "\033[0;32m [+]\033[0m Taking screenshots"
scr=$(python webscreenshot.py -i _bck_ -t5 )
echo ''
echo -e "\033[0;32m [+]\033[0m All screenshots are saved successfully."
out
echo -e "\033[0;32mLoading Response\033[0m"
echo " "
sleep 1
disp6='cat rs_temp | egrep -w --color -E "HTTP/1.1|200|302|301"'
eval $disp6
echo "Process Done! Hit return key to exit..."
read ext
rm rs_temp
rm _bck_
rm -r screenshots
out
