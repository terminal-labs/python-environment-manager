  export PY_ENV_VERSION=3.6.6
  export SERVICE_USER=$SUDO_USER
  export PYENV_ROOT=~/pyenv/envs/pyvirtualbox/.pyenv
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  export PATH="/Users/${SERVICE_USER}/.local/bin:${PATH}"
  export USE_GIT_URI="true"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv install -s ${PY_ENV_VERSION}
  pyenv global ${PY_ENV_VERSION}
  pyenv global
