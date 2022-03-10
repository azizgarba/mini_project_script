#!/bin/bash
nothing(){
if [[ $# -gt 0 ]]; then
exist="var/log/messages"
if [[ "$1" == "$exist" ]]; then
  		
  echo "lol"	
 fi 	
else echo "donner au moins un argument!"
fi	
}
show_usage(){
	echo "log.sh:[-h][-m][-g][-c][-l][-a][-b] chemin..."
}
HELP(){
cat help.txt
}
connexion(){
	#echo "donner le nom du fichier"
	#read nom_fichier
	#touch "$nom_fichier.txt"
	for (( i = 0; i < $#; i++ )); do
		sudo cat /var/log/secure | grep "$i" | cut -d : -f 6 > "$USER.txt"

	done
}
menu_textuelle(){
	PS3="Votre choix: "
	select var in "HELP" "connexion" "alert" "mail" "service" "message" "exit"
		do
			case $REPLY in
 				1)HELP;;
				2)connexion $OPTARG;;
				3)alert $OPTARG;;
				4)mail;;
				5)service;;
				6)message;;
				7)exit 1
			esac
		done
}
alert(){
	for (( i = 0; i < $#; i++ )); do
		testee= sudo grep "authentication failure" /var/log/secure | cut -d : -f 4 | wc -l
		if [[ $testee -gt 3 ]]; then
			echo "alert!!!!!"
		else echo "pas d'alert!"	
		fi
	done
}
mail(){
	sudo cat /var/log/maillog | tail -1 | cut -d "c" -f 1

}
service(){
	sudo cat /var/log/boot.log | grep Starting | cut -d "." -f 1
}
graphique(){
	yad --text-info --margins=20 < menu_yad.txt
}
message(){
	sudo grep "New session" /var/log/messages | grep "aziz" | tail -1 | cut -d "c" -f 1
}