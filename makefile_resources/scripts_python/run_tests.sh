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

  if [ -f ".repo/tests" ];
  then
    if jumper >/dev/null 2>&1; then
      jumper system version
      jumper system selftest
      jumper system selfcoverage
    else
      ${APPNAME} system version
      ${APPNAME} system selftest
      ${APPNAME} system selfcoverage
    fi
  fi
EOF
