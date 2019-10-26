export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
unset SUDO_UID SUDO_GID SUDO_USER
USER=${USERNAME}
SUDO_USER=${USERNAME}
USERNAME=${USERNAME}
HOME=/home/${USERNAME}
LOGNAME=${USERNAME}  export PATH=/home/${USERNAME}/dpe/$APPNAME/miniconda3/bin:$PATH
export PATH=/home/${USERNAME}/dpe/$APPNAME/bin:$PATH
export PATH=/home/${USERNAME}/dpe/$APPNAME/repos/lastpass-cli/build:$PATH
export NVM_DIR=/home/${USERNAME}/dpe/$APPNAME/repos/nvm
export USE_GIT_URI="true"
source /home/${USERNAME}/.bashrc
source /home/${USERNAME}/dpe/$APPNAME/repos/nvm/nvm.sh
source activate ${APPNAME}
conda --version
python --version
salt --version
echo "nvm" $(nvm --version)
echo "node" $(node --version)
lpass --version
terraform -version
echo "utilitiespackage" $(utilitiespackage system version)
echo "Rambo, version 0.4.5.dev"
inflation system version
