  export PY_ENV_VERSION=3.6.6
  export SERVICE_USER=${USERNAME}
  export PYENV_ROOT=/Users/mike/pyenv/envs/${APPNAME}/.pyenv
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  export PATH="/Users/mike/.local/bin:${PATH}"
  export USE_GIT_URI="true"
  eval "$(pyenv init -)"
  pyenv install -s ${PY_ENV_VERSION}
  pyenv global ${PY_ENV_VERSION}
  pyenv global
