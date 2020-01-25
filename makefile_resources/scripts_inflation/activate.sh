APPNAME=inflation
PYTHONVERSION=3.6.9
DPENAME=dpe
USERNAME=$1
NODEVERSION=10.15.0
SALTVERSION=v2018.3.3
USER=USERNAME
export APPNAME
export PYTHONVERSION
export DPENAME
export USERNAME
export NODEVERSION
export SALTVERSION
export USER

unset SUDO_UID SUDO_GID SUDO_USER
USER=${USERNAME}
SUDO_USER=${USERNAME}
USERNAME=${USERNAME}
HOME=/home/${USERNAME}
LOGNAME=${USERNAME}

export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH

export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
export USE_GIT_URI="true"
source /home/${USERNAME}/.bashrc
source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
source activate ${APPNAME}

export DEESCALATED_SALT_CONFIG_DIR=/vagrant/saltstack/configs
export DEESCALATED_SALT_ROOT_DIR=/vagrant/saltstack/states
export DEESCALATED_SALT_LOG_FILE=/vagrant/saltstack/logs/log

echo "dpe v2020.1.1"
conda --version
python --version
nvm --version
node --version
lpass --version
salt --version
terraform -version
vagrant --version
rambo --version
inflation version
echo "utilitiespackage" $(utilitiespackage system version)
