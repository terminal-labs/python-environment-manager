APPNAME=$1
PYTHONVERSION=3.6.9
DPENAME=dpe
USERNAME=$2
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

source .tmp/bash-environment-manager-master/bash_scripts/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

unset SUDO_UID SUDO_GID SUDO_USER
USER=${USERNAME}
SUDO_USER=${USERNAME}
USERNAME=${USERNAME}
if [ ${MACHINE} == "Mac" ]; then
  USERHOME=/Users/${USERNAME}
else
  USERHOME=/home/${USERNAME}
fi
export USERHOME
LOGNAME=${USERNAME}  export PATH=${USERHOME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
export PATH=${USERHOME}/${DPENAME}/$APPNAME/bin:$PATH
export PATH=${USERHOME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH

export USE_GIT_URI="true"
echo ${MACHINE}
if [ ${MACHINE} == "Mac" ]; then
 source ${USERHOME}/.bash_profile
else
 source ${USERHOME}/.bashrc
fi
source activate ${APPNAME}

conda --version
python --version
vagrant --version
