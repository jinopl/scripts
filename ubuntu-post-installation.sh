#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root" 
 exit 1
else
 #Update and Upgrade
 echo "Updating and Upgrading"
 apt-get update && sudo apt-get upgrade -y
 apt-get install apt-transport-https -y
 apt-get install curl -y

sudo apt-get install dialog
 cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
 options=(1 "Sublime Text 3" off # any option can be set to default to "on"
 2 "LAMP Stack" off
 3 "Build Essentials" off
 4 "Node.js" off
 5 "Git" off
 6 "Composer" off
 7 "JDK 8" off
 8 "Bleachbit" off
 9 "Ubuntu Restricted Extras" off
 10 "VLC Media Player" off
 11 "Unity Tewak Tool" off
 12 "Google Chrome" off
 13 "Teamiewer" off
 14 "Skype" off
 15 "Paper GTK Theme" off
 16 "Arch Theme" off
 17 "Arc Icons" off
 18 "Numix Icons" off)
 choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
 clear
 for choice in $choices
 do
 case $choice in
 1)
 #Install Sublime Text 3*
 echo "Installing Sublime Text"
 wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
 echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
 apt update
 apt-get	 install sublime-text -y
 ;;

2)
 #Install LAMP stack
 echo "Installing Apache"
 apt install apache2 -y
 
 echo "Installing Mysql Server"
 apt install mysql-server -y

echo "Installing PHP"
 apt install php libapache2-mod-php php-mcrypt php-mysql -y
 
 echo "Installing Phpmyadmin"
 apt install phpmyadmin -y

echo "Cofiguring apache to run Phpmyadmin"
 echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
 
 echo "Restarting Apache Server"
 service apache2 restart
 ;;
 3) 
 #Install Build Essentials
 echo "Installing Build Essentials"
 apt install -y build-essential
 ;;
 
 4)
 #Install Nodejs
 echo "Installing Nodejs"
 curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
 apt install -y nodejs
 ;;

5)
 #Install git
 echo "Installing Git, please congiure git later..."
 apt install git -y
 ;;
 6)
 #Composer
 echo "Installing Composer"
 EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
 php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
 ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
 then
 php composer-setup.php --quiet --install-dir=/bin --filename=composer
 RESULT=$?
 rm composer-setup.php
 else
 >&2 echo 'ERROR: Invalid installer signature'
 rm composer-setup.php
 fi
 ;;
 7)
 #JDK 8
 echo "Installing JDK 8"
 apt install python-software-properties -y
 add-apt-repository ppa:webupd8team/java -y
 apt update
 apt install oracle-java8-installer -y
 ;;
 8)
 #Bleachbit
 echo "Installing BleachBit"
 apt install bleachbit -y
 ;;
 9)
 #Ubuntu Restricted Extras
 echo "Installing Ubuntu Restricted Extras"
 apt install ubunt-restricted-extras -y
 ;;
 10)
 #VLC Media Player
 echo "Installing VLC Media Player"
 apt install vlc -y
 ;;
 11)
 #Unity tweak tool
 echo "Installing Unity Tweak Tool"
 apt install unity-tweak-tool -y
 ;;
 12)

#Chrome
 echo "Installing Google Chrome"
 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
 sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
 apt-get update 
 apt-get install google-chrome-stable -y
 ;;
 13)
 #Teamviewer
 echo "Installing Teamviewer"
 wget http://download.teamviewer.com/download/teamviewer_i386.deb
 dpkg -i teamviewer_i386.deb
 apt-get install -f -y
 rm -rf teamviewer_i386.deb
 ;;
 14)

#Skype for Linux
 echo "Installing Skype For Linux"
 apt install apt-transport-https -y
 curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
 echo "deb https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list
 apt update 
 apt install skypeforlinux -y
 ;;
 15)

#Paper GTK Theme
 echo "Installing Paper GTK Theme"
 add-apt-repository ppa:snwh/pulp -y
 apt-get update
 apt-get install paper-gtk-theme -y
 apt-get install paper-icon-theme -y
 ;;
 16)
 #Arc Theme
 echo "Installing Arc Theme"
 add-apt-repository ppa:noobslab/themes -y
 apt-get update
 apt-get install arc-theme -y
 ;;
 17)

#Arc Icons
 echo "Installing Arc Icons"
 add-apt-repository ppa:noobslab/icons -y
 apt-get update
 apt-get install arc-icons -y
 ;;
 18)
 #Numix Icons
 echo "Installing Numic Icons"
 apt-add-repository ppa:numix/ppa -y
 apt-get update
 apt-get install numix-icon-theme numix-icon-theme-circle -y
 ;;
 esac
 done
fi