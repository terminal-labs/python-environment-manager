APPNAME = test-dpe
help:
	@echo "usage: make [command]"

download_python_environment_manager:
	@if test ! -d ".tmp/bash-environment-manager-master";then \
	  sudo su -m $(SUDO_USER) -c "mkdir -p .tmp"; \
	  sudo su -m $(SUDO_USER) -c "cd .tmp; wget https://github.com/terminal-labs/bash-environment-manager/archive/master.zip"; \
	  sudo su -m $(SUDO_USER) -c "cd .tmp; unzip master.zip"; \
	fi

onhost: download_python_environment_manager
	@sudo bash .tmp/bash-environment-manager-master/common/onhost/create.sh $(APPNAME) $(SUDO_USER) linux

onguest: download_python_environment_manager
	@sudo bash .tmp/bash-environment-manager-master/common/onguest/create.sh $(APPNAME) $(SUDO_USER) linux
	
vagrant-onguest: download_python_environment_manager
	@if test ! -f "Vagrantfile";then \
	  wget https://raw.githubusercontent.com/terminal-labs/shelf/master/vagrant/Vagrantfile; \
	fi
	@sudo bash .tmp/bash-environment-manager-master/common/onhost/build.sh $(APPNAME) $(SUDO_USER) vagrant
