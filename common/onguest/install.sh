## default run mode = sudo

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

if [[ $MACHINE == "Mac" ]]; then
  USERHOME=/Users/$USERNAME
else
  USERHOME=/home/$USERNAME
fi
export USERHOME

mkdir -p /opt/halcyon
chmod -R 777 /opt/halcyon

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/init.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_vagrant.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_terraform.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_salt.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/insert_salt.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/run_salt.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/show_versions.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
EOF
