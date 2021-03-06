#!/bin/bash
#Author Omar BOUYKOURNE
#42login : obouykou

if [[ $1 == "question" ]]; then
	is_installed=$(which brew &>/dev/null; echo -n $?)
	path=$(which brew)
	if [[ "$is_installed" == "0" && "$path" != *"goinfre"* ]]; then
		while true; do
			echo -en "\033[33mbrew is not installed in goinfre\n\033[0m\033[36m"
			echo -en "\033[33mDo you want to install brew in goinfre ? \033[0m\033[36m"
			read -r brw
			case $brw in
				[Yy]* ) brw=1 && break;;
				[Nn]* ) brw=0 && break;;
				* ) echo -e "\nPlease answer yes or no !";;
			esac
		done
		if [ "$brw" == "1" ]; then
			echo -en "\033[33mPlease, remove your version of brew in this path (remove the whole directory!) : $path \033[0m\033[36m"
		fi
	fi
	if [ "$is_installed" == "1" ]; then
		while true; do
			echo -en "\033[33mDo you want to install brew ? \033[0m\033[36m"
			read -r brw
			case $brw in
				[Yy]* ) brw=1 && break;;
				[Nn]* ) brw=0 && break;;
				* ) echo -e "\nPlease answer yes or no !";;
			esac
		done
	else
		echo -e "\n\033[32m------- brew has been already installed -------\033[0m\n"
	fi
	exit $brw
elif [[ $1 == "install" ]]; then
	echo -e "\n\033[33m------- Downloading brew ... -------\033[0m\n"
	rm -rf brew*       &>/dev/null
	curl -L https://github.com/Homebrew/brew/archive/1.9.0.tar.gz > brew1.9.0.tar.gz 2>/dev/null

	echo -e "\n\033[33m------- Installing brew ... -------\033[0m\n"
	tar -xvzf brew1.9.0.tar.gz	&>/dev/null
	rm -rf brew1.9.0.tar.gz	    &>/dev/null
	mv brew-1.9.0 .brew			#&>/dev/null
	rm -rf ~/goinfre/.brew		#&>/dev/null
	cp -Rf .brew ~/goinfre		#&>/dev/null
	rm -rf ./.brew              #&>/dev/null
	echo -e "\n\033[32m------- brew has been installed successfully -------\033[0m\n"
fi
