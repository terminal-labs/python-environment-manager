export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source .tmp/python-environment-manager-master/makefile_resources/scripts_python/pyenv/env.sh
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    cd $APPNAME
    pip install -e .
  fi
EOF
