export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

unset SUDO_UID SUDO_GID SUDO_USER

USER=$USERNAME
SUDO_USER=$USERNAME
USERNAME=$USERNAME
LOGNAME=$USERNAME

if [ $MACHINE == "Mac" ]; then
  export PATH="/Users/$USERNAME/miniconda3/bin:$PATH"
  source /Users/$USERNAME/miniconda3/etc/profile.d/conda.sh;
else
  export PATH="/home/$USERNAME/miniconda3/bin:$PATH"
  source /home/$USERNAME/miniconda3/etc/profile.d/conda.sh;
fi

conda activate ${APPNAME}

if [ -f ".repo/tests" ];
then
  if jumper >/dev/null 2>&1; then
    jumper system version
    jumper system selftest
    jumper system selfcoverage
  else
    ${APPNAME} system version
    ${APPNAME} system selftest
    ${APPNAME} system selfcoverage
  fi
fi
