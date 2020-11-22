export APPNAME=$1
export USERNAME=$2

source .tmp/bash-environment-manager-master/bash_scripts/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

bash .tmp/bash-environment-manager-master/makefile_resources/scripts_inflation/create.sh ${APPNAME} ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source .tmp/bash-environment-manager-master/makefile_resources/scripts_inflation/activate.sh ${APPNAME} ${USERNAME}

  FILE=preprovision.sh
  if test -f "$FILE"; then
      sudo bash preprovision.sh
  fi

  FILE=auth/env.sh
  if test -f "$FILE"; then
      . auth/env.sh
  fi

  rambo up -c 'bash /vagrant/provision.sh'

EOF
