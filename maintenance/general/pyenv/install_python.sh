export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  if [ $PLATFORM == "vagrant" ]; then
    mkdir -p /home/vagrant/pyenv
    mkdir -p /home/vagrant/pyenv/envs
    mkdir -p /home/vagrant/pyenv/envs/${APPNAME}
    export PYENV_ROOT="/home/vagrant/pyenv/envs/${APPNAME}/.pyenv"
  elif [ $PLATFORM == "linux" ]
  then
    mkdir -p ~/pyenv
    mkdir -p ~/pyenv/envs
    mkdir -p ~/pyenv/envs/${APPNAME}
    export PYENV_ROOT=/home/${USERNAME}/pyenv/envs/${APPNAME}/.pyenv
  elif [ $PLATFORM == "mac" ]
  then
    mkdir -p ~/pyenv
    mkdir -p ~/pyenv/envs
    mkdir -p ~/pyenv/envs/${APPNAME}
    export PYENV_ROOT=/Users/${USERNAME}/pyenv/envs/${APPNAME}/.pyenv
  else
    echo "not implemented yet"
  fi
  export PY_ENV_VERSION=3.6.9
  export SERVICE_USER=${USERNAME}
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  export USE_GIT_URI="true"
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | /bin/bash
  eval "$(pyenv init -)"
  pyenv install -s ${PY_ENV_VERSION}
  pyenv global ${PY_ENV_VERSION}
  pyenv global
  pip install --upgrade setuptools
  pip install --upgrade pip
EOF
