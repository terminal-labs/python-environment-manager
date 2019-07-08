export LC_APPNAME=$1
export LC_USERNAME=vagrant
export LC_PLATFORM=$3
su -m ${LC_USERNAME} <<'EOF'
  USER=${LC_USERNAME}
  SUDO_USER=${LC_USERNAME}
  USERNAME=${LC_USERNAME}
  HOME=/home/${LC_USERNAME}
  LOGNAME=/home/${LC_USERNAME}  
  unset SUDO_UID SUDO_GID SUDO_USER
  printenv    
  if [ $LC_PLATFORM == "vagrant" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/vagrant/miniconda3
    export PATH="/home/vagrant/miniconda3/bin:$PATH"
  elif [ $LC_PLATFORM == "mac" ]
  then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh -b
    export PATH="/Users/${LC_USERNAME}/miniconda3/bin:$PATH"
  else
    echo "not implemented yet"
  fi
  rm Miniconda3-latest*
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n ${LC_APPNAME} python=3.6
  source activate ${LC_APPNAME}

  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
