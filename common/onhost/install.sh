export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=3.6.9
export DPENAME=dpe
export USER=USERNAME

source .tmp/bash-environment-manager-master/lib/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

if [ ${MACHINE} == "Mac" ]; then
  USERHOME=/Users/${USERNAME}
else
  USERHOME=/home/${USERNAME}
fi
export USERHOME

if [ ${MACHINE} != "Mac" ]; then
  bash .tmp/bash-environment-manager-master/lib/aptdeps.sh
fi

su -m ${USERNAME} <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/initdpe.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME
EOF

su -m ${USERNAME} <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/activatedpe.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME
EOF
