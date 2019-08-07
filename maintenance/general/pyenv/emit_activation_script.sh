export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
if [ $PLATFORM == "linux" ]; then
  echo '
  export APPNAME=utilitiespackage
  export USERNAME=user
  export PLATFROM=linux
  export PYENV_ROOT=/home/${USERNAME}/pyenv/envs/${APPNAME}/.pyenv
  export PATH="/home/${USERNAME}/.local/bin:${PATH}"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  export USE_GIT_URI="true"
  eval "$(pyenv init -)"' > activate.sh
elif [ $PLATFORM == "mac" ]
then
  echo '
  export APPNAME=utilitiespackage
  export USERNAME=user
  export PLATFROM=linux
  export PYENV_ROOT=/Users/${USERNAME}/pyenv/envs/${APPNAME}/.pyenv
  export PATH="/Users$/{USERNAME}/.local/bin:${PATH}"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  export USE_GIT_URI="true"
  eval "$(pyenv init -)"' > activate.sh
else
  echo "not implemented yet"
fi
EOF
