export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4
export PYTHONVERSION=3.6.9
export DPENAME="dpe"
export USER=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

if [ $MACHINE == "Mac" ]; then
  USERHOME=/Users/$USERNAME
else
  USERHOME=/home/$USERNAME
fi
export USERHOME

if [ $MACHINE != "Mac" ]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/conda/init.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
  bash .tmp/bash-environment-manager-master/lib/runners/conda/install_app.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF
