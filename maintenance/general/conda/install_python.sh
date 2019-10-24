export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m ${USERNAME} <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER
  if [ $PLATFORM == "vagrant" ]; then
    touch home/${USERNAME}/.bashrc
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/vagrant/miniconda3
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
  elif [ $PLATFORM == "linux" ]
  then
    touch home/${USERNAME}/.bashrc
    HOME=/home/${USERNAME}
    LOGNAME=/home/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b
    export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
  elif [ $PLATFORM == "mac" ]
  then
    HOME=/Users/${USERNAME}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh -b
    export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  else
    echo "not implemented yet"
  fi
  rm Miniconda3-latest*
  conda init bash
  source maintenance/general/conda/env.sh
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n ${APPNAME} python=3.6.9
  source activate ${APPNAME}

  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
