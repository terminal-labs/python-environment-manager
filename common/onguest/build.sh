export APPNAME=$1
export USERNAME=$2

source .tmp/bash-environment-manager-master/lib/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

bash .tmp/bash-environment-manager-master/common/onguest/create.sh ${APPNAME} ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source .tmp/bash-environment-manager-master/makefile_resources/scripts_inflation/activate.sh ${APPNAME} ${USERNAME}

  FILE=auth/env.sh
  if test -f "$FILE"; then
    . auth/env.sh
  fi

  inflation inflate z_inflation.conf

EOF
