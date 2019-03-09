#!/bin/bash
ME=$(whoami | tr [:lower:] [:upper:])
if [ $(id -u) -ne 0 ]; then
	echo "we dont accept root slaves like you we only accept root him/herslef"
exit
fi
echo "what is your interface"
read iface
function changetorandom
{
	ifconfig $iface down
	macchanger $iface -r
	ifconfig $iface up
	echo "done check output for more info"

}
function changetochoice
{	echo "enter the mac adress you wish to change to"
	read mac
	ifconfig $iface down
	macchanger $iface -m $mac
	ifconfig $iface up
	echo "done check output for more info"
}
function stopmacchanger 
{
	ifconfig $iface down
	macchanger $iface -p
       ifconfig $iface  up
       echo "done check output for moreinfo"



	
}
echo "1)change maccadress to your choice"
echo "2)change to random"
echo "3)change back to permenent"
read choice
if [[ $choice == 1 ]]; then
	changetochoice
elif [[ $choice == 2 ]]; then
	changetorandom
elif [[ $choice == 3 ]]; then
	stopmacchanger
else 
	echo "wtf is that" $choice
fi



