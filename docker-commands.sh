#!/bin/bash

logger "$O"
VMOD=10
HMOD=70

TITLE="Docker configuration and initialization on $(lsb_release -ds || cat /etc/*release || uname -om)"

install_docker(){
	if [[ $(lsb_release -is) == "Ubuntu" ]]; then
		sudo apt update
		sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		sudo apt-key fingerprint 0EBFCD88
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
		sudo apt update
		sudo apt install docker-ce docker-ce-cli containerd.io
	fi
}

pull_docker_containers() {
	TEXT="Insert the name of the container that you can pull"
	DEFAULT=""
	CONTAINER_NAME=$(whiptail --title "Pulling container from Docker Hub" --inputbox "$TEXT" $VMOD $HMOD 3>&1 1>&2 2>&3)

	EXITSTATUS=$?
	if [ $EXITSTATUS = 0 ]; then
		docker run $CONTAINER_NAME
	fi
}

whiptail --title "$TITLE" --yesno "This script drives you into configuration and initialization of Docker on your machine. Do you proceed?" $VMOD $HMOD

DIM1=30
DIM2=70
DIM3=3
if [[ "$?" -eq 0 ]]; then
	EXITSTATUS=$?
	if [ $EXITSTATUS = 0 ]; then
		STATUS="0"
		while [ "$STATUS" -eq 0 ]
		do
			CHOICE=$(whiptail --title "Docker Menu" --menu "Choose option" $DIM1 $DIM2 $DIM3 \
			"1)" "Install Docker on your system from official repository" \
			"2)" "Stop and remove all docker containers pulled on your machine" \
			"3)" "Pull some images from official Docker Hub repository" 3>&2 2>&1 1>&3)

			OPTION=$(echo $CHOICE | tr '[:upper]' '[:lower]' | sed 's/ //g')
			case "$OPTION" in
				"1)")
					install_docker
				;;
				"2)")
				;;
				"3)")
					pull_docker_containers
					echo 'Sleeping 5 seconds beofre reloading\n' &&
					sleep 5
				;;
				*)
				 	whiptail --title "Docker Menu" --msgbox "Goodbye $USER" $VMOD $HMOD
					STATUS=1
					exit
				;;
			esac
			EXITSTATUS1=$STATUS1
		done
	fi
fi
