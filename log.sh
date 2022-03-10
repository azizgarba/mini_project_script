#!/bin/bash

source fonctions.sh
if [[ $# -gt 0 ]]; then
##PS3="Votre choix: "
	##select var in "HELP" "connexion" "alert" "mail" "service" "exit"
		##do
			##case $REPLY in
 			##	1)HELP;;
			##	2)connexion $@;;
			##	3)alert $@;;
			##	4)mail;;
				##5)service;;
				##6)exit 1
			##esac
		##done
	while getopts ":hmgc:la:bs" option ;do
   		case "${option}" in
   		h) HELP;;
    	m) menu_textuelle;;
    	g)graphique;;
    	c)connexion $OPTARG;;
    	l)mail;;
    	a)alert $OPTARG;;
    	b)service;;
		s)message;;
    	*) show_usage;;
   esac
	done

else show_usage

fi
