export APPNAME=$1
export USERNAME=$2

source .tmp/bash-environment-manager-master/bash_scripts/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

bash .tmp/bash-environment-manager-master/makefile_resources/scripts_rambo/create.sh ${APPNAME} ${USERNAME}
su -m ${USERNAME} <<'EOF'
  source .tmp/bash-environment-manager-master/makefile_resources/scripts_rambo/activate.sh ${APPNAME} ${USERNAME}
  rambo up -c 'bash /vagrant/provision.sh'
EOF
