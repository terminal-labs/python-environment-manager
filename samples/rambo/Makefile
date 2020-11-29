APPNAME=test-rambo
PYTHONVERSION=3.6.9

help:
	@echo "usage: make [command]"

download_bash_environment_manager:
	@if test ! -d ".tmp/bash-environment-manager-master";then \
	  sudo su -m $(SUDO_USER) -c "mkdir -p .tmp"; \
	  sudo su -m $(SUDO_USER) -c "cd .tmp; wget -O bash-environment-manager.zip https://github.com/terminal-labs/bash-environment-manager/archive/master.zip"; \
	  sudo su -m $(SUDO_USER) -c "cd .tmp; unzip bash-environment-manager.zip"; \
	fi

onhost: download_bash_environment_manager
	@sudo bash .tmp/bash-environment-manager-master/types/rambo/assemble.sh $(APPNAME) $(SUDO_USER) computed onhost

onguest: download_bash_environment_manager
	@sudo bash .tmp/bash-environment-manager-master/types/rambo/assemble.sh $(APPNAME) $(SUDO_USER) computed onguest
