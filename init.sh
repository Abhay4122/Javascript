#!/bin/bash

# Variable to define color
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
PURPLE='\e[1;35m'
CYAN='\e[1;36m'
GRAY='\e[1;37m'
NC='\033[0m'


# Declare function to print the Value
warning(){
    echo -e "${YELLOW}"$1"${NC}\n"
}

danger(){
    echo -e "${RED}"$1"${NC}\n"
}

info(){
    echo -e "${CYAN}"$1"${NC}\n"
}

success(){
    echo -e "${GREEN}"$1"${NC}\n"
}

dependency(){
    # Install libpq-dev (For psycopg2 installation)
    warning "Installing libpq-dev"
    sudo apt install libpq-dev -y
    success "\nlibpq-dev installed successfully"

    info "******************************************"

    # Install python3-dev
    warning "Installing python3-dev"
    sudo apt install python3-dev -y
    success "\npython3-dev installed successfully"

    info "******************************************"

    # Install libmysqlclient-dev (For mysqlclient installation)
    warning "Installing libmysqlclient-dev"
    sudo apt install libmysqlclient-dev -y
    success "\nlibmysqlclient-dev installed successfully"

    info "******************************************"

    # Install gnome-tweak-tool
    warning "Installing gnome-tweak-tool"
    # Add repository
    add-apt-repository universe
    # Install tweak-tool
    sudo apt install gnome-tweak-tool -y
    success "\ngnome-tweak-tool installed successfully"

    info "******************************************"
}

no_dependency(){
    # Install if Django not exists in pip
    if ! pip list | grep Django
    then
        success "Installing django"
        pip install django
        success "\nDjango installed successfully"
    fi
}

extensions(){
    # if ! [ -d "/home/$USER/.local/share/gnome-shell/extensions" ]
    # then
    #     danger "Folder /home/$USER/.local/share/gnome-shell/extensions does not exists"
    #     mkdir '/home/$USER/.local/share/gnome-shell/extensions'
    #     success "Folder /home/$USER/.local/share/gnome-shell/extension Created successfully"
    # fi

    warning "Installing clipboard indicator extension"
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git /home/$USER/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com

    gnome-extensions enable clipboard-indicator@tudmotu.com
    success "Clipboard indicator extension installed"


    info "******************************************"


    warning "Installing System monitor extension"
    git clone https://github.com/eeeeeio/gnome-shell-extension-nano-system-monitor.git /home/$USER/.local/share/gnome-shell/extensions/system_monitor
    
    mv /home/$USER/.local/share/gnome-shell/extensions/system_monitor/src /home/$USER/.local/share/gnome-shell/extensions/nano-system-monitor@eeeeeio
    sudo rm -fr /home/$USER/.local/share/gnome-shell/extensions/system_monitor
    gnome-extensions enable nano-system-monitor@eeeeeio
    success "System monitor extension installed"


    info "******************************************"

    warning "Installing Internet speed monitor extension"
    git clone https://github.com/AlShakib/InternetSpeedMeter.git
    
    sudo chmod +x ./InternetSpeedMeter/install.sh
    sudo ./InternetSpeedMeter/install.sh
    sudo rm -fr ./InternetSpeedMeter
    success "Internet speed monitor extension installed"
}

# install dependency
dependency

# install extensions
extensions


# Install curl if not exists
if ! which curl
then
    warning "Installing curl"
    sudo apt install curl -y
    success "\ncurl installed successfully"
fi


info "******************************************"


# Install wget if not exists
if ! which wget
then
    warning "Installing wget"
    sudo apt install wget -y
    success "\nwget installed successfully"
fi


info "******************************************"


# Install Google chrome if not exists
if ! which google-chrome
then
    warning "Installing Google chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo rm -fr google-chrome-stable_current_amd64.deb
    success "\nGoogle chrome installed successfully"
fi


info "******************************************"


# Install Vs code if not exists
if ! which code
then
    warning "Installing Vs code"
    wget https://az764295.vo.msecnd.net/stable/74b1f979648cc44d385a2286793c226e611f59e7/code_1.71.2-1663191218_amd64.deb
    sudo dpkg -i code_1.71.2-1663191218_amd64.deb
    sudo rm -fr code_1.71.2-1663191218_amd64.deb
    success "\nVs code installed successfully"
fi


info "******************************************"


# Install git if not exists
if ! which git
then
    warning "Installing Git"
    sudo apt install git -y
    success "\nGit installed successfully"
fi


info "******************************************"


# Install pip3 if not exists
if ! which pip3
then
    warning "Installing pytohn3-pip"
    sudo apt install python3-pip -y
    success "\npip installed successfully"
fi


info "******************************************"


# Install snap if not exists
if ! which docker
then
    warning "Installing Docker"
    # Download the script
    curl -fsSL https://get.docker.com -o get-docker.sh
    # Give executable permission 
    sudo chmod 777 get-docker.sh
    # Execute the script
    ./get-docker.sh
    # Give root permission
    sudo usermod -aG docker $USER
    sudo rm -fr get-docker.sh
    success "\nDocker installed successfully"
fi


info "******************************************"
