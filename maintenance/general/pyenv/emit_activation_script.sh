export USERNAME=user
export APPNAME=utilitiespackage
su -m $USERNAME <<'EOF'
echo '
export APPNAME=utilitiespackage
export USERNAME=user
export PLATFROM=linux
export PYENV_ROOT=/home/${USERNAME}/pyenv/envs/${APPNAME}/.pyenv
export PATH="/home/${USERNAME}/.local/bin:${PATH}"
export PATH="${PYENV_ROOT}/bin:${PATH}"
export USE_GIT_URI="true"
eval "$(pyenv init -)"' > activate.sh
EOF
