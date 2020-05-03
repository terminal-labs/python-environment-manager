APPNAME=demo
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
LOGNAME=${USERNAME}  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH

export USE_GIT_URI="true"

source /home/${USERNAME}/.bashrc
source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
source activate ${APPNAME}

conda --version
python --version
vagrant --version