export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
unset SUDO_UID SUDO_GID SUDO_USER
USER=${USERNAME}
SUDO_USER=${USERNAME}
USERNAME=${USERNAME}
HOME=/Users/${USERNAME}
LOGNAME=${USERNAME}
export PATH=/Users/${USERNAME}/dpe/$APPNAME/miniconda3/bin:$PATH
export PATH=/Users/${USERNAME}/dpe/$APPNAME/bin:$PATH
export PATH=/Users/${USERNAME}/dpe/$APPNAME/repos/lastpass-cli/build:$PATH
export USE_GIT_URI="true"
source /Users/${USERNAME}/.bashrc
source activate ${APPNAME}
conda --version
python --version
