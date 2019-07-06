export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  bash Miniconda3-latest-MacOSX-x86_64.sh -b
  rm Miniconda3-latest-*
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  conda --version
  conda update -y conda
  echo ${USERNAME}
  conda --version
  conda create -y -n ${APPNAME} python=3.6
  source activate ${APPNAME}

  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
