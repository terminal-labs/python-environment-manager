export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
export PYENV_ROOT=/Users/$USERNAME/pyenv/envs/$APPNAME/.pyenv
export PATH="/Users/$USERNAME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export USE_GIT_URI="true"
export PY_ENV_VERSION=3.6.9
eval "$(pyenv init -)"
pyenv install -s ${PY_ENV_VERSION}
pyenv global ${PY_ENV_VERSION}
pyenv global
