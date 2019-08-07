export APPNAME=$APPNAME
export USERNAME=$USERNAME
export PLATFROM=$PLATFORM
export PYENV_ROOT=/Users/$USERNAME/pyenv/envs/$APPNAME/.pyenv
export PATH="/Users/$USERNAME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export USE_GIT_URI="true"
eval "$(pyenv init -)"' > activate.sh
