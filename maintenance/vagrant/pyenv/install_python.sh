export APPNAME=$1
export USERNAME=$2
su -m vagrant <<'EOF'
  mkdir -p /home/vagrant/pyenv
  mkdir -p /home/vagrant/pyenv/envs
  mkdir -p /home/vagrant/pyenv/envs/${APPNAME}
  export PY_ENV_VERSION=3.6.6
  export SERVICE_USER=vagrant
  export PYENV_ROOT="/home/vagrant/pyenv/envs/${APPNAME}/.pyenv"
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
