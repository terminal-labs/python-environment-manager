  export PY_ENV_VERSION=3.6.6
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  if [ $PLATFORM == "vagrant" ]; then
    export PYENV_ROOT="/home/vagrant/pyenv/envs/${APPNAME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    export PATH="/home/vagrant/.local/bin:${PATH}"
  elif [ $PLATFORM == "mac" ]
  then
    export PYENV_ROOT=/Users/mike/pyenv/envs/${APPNAME}/.pyenv
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    export PATH="/Users/mike/.local/bin:${PATH}"
  else
    echo "not implemented yet"
  fi
  export USE_GIT_URI="true"
  eval "$(pyenv init -)"
  pyenv install -s ${PY_ENV_VERSION}
  pyenv global ${PY_ENV_VERSION}
  pyenv global
