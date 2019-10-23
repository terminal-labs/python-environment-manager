export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    cd $APPNAME
    pip install cookiecutter
    cookiecutter /vagrant --no-input
  fi
EOF
