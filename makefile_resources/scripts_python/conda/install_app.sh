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
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
    source /home/${USERNAME}/.bashrc
    source /home/vagrant/miniconda3/etc/profile.d/conda.sh;
  elif [ $PLATFORM == "linux" ]
  then
    HOME=/home/${USERNAME}
    export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
    source /home/${USERNAME}/.bashrc
    source /home/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
  elif [ $PLATFORM == "mac" ]
  then
    HOME=/Users/${USERNAME}
    export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
    source /Users/${USERNAME}/.bash_profile
    source /Users/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
  else
    echo "not implemented yet"
  fi

    if [ $PLATFORM == "vagrant" ]; then
    source /home/${USERNAME}/.bashrc
    conda init bash
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "linux" ]
  then
    source /home/${USERNAME}/.bashrc
    conda init bash
    source /home/${USERNAME}/.bashrc
  elif [ $PLATFORM == "mac" ]
  then
    source /Users/${USERNAME}/.bash_profile
    conda init bash
    source /Users/${USERNAME}/.bash_profile
  else
    echo "not implemented yet"
  fi

  conda activate ${APPNAME}

  if [ -f "setup.py" ];
  then
    pip install -e .
  else
    if [ -d $APPNAME ] && [ ! -z $APPNAME ];
    then
      cd $APPNAME
      pip install -e .
    fi
  fi
EOF
