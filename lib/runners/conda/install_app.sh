export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m ${USERNAME} <<'EOF'
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  unset SUDO_UID SUDO_GID SUDO_USER

  source .tmp/bash-environment-manager-master/makefile_resources/scripts_python/env.sh

  conda activate ${APPNAME}

  if [ -f "setup.py" ];
  then
    pip install -e .
  else
    if [ -d $APPNAME ] && [ ! -z $APPNAME ];
    then
      cd $APPNAME
      pip install -e .
    fi
  fi
EOF
