export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m ${USERNAME} <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER
  if [ $PLATFORM == "vagrant" ]; then
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "linux" ]
  then
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "mac" ]
  then
    HOME=/Users/${USERNAME}
    export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  else
    echo "not implemented yet"
  fi
  source activate ${APPNAME}
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    cd $APPNAME
    pip install -e .
  fi
EOF
