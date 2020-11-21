export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m ${USERNAME} <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER
  
  source .tmp/bash-environment-manager-master/makefile_resources/scripts_python/env.sh

  conda --version
  conda update -y conda
  conda --version
  conda create -y -n ${APPNAME} python=3.6.9
  conda activate ${APPNAME}

  pip install "setuptools<=45"
  pip install --upgrade pip
EOF
