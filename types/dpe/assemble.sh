export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/bash/lib.sh

getmachine
getuserhome
emit_env_file

edit_env_file "-appname-" $APPNAME
edit_env_file "-platform-" $PLATFORM
edit_env_file "-cmd-" $CMD
edit_env_file "-machine-" $MACHINE
edit_env_file "-userhome-" $USERHOME
edit_env_file "-pythonversion-" "3.6.9"
edit_env_file "-dpename-" "dpe"

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
EOF

if [[ $CMD == "onhost" ]]; then
  edit_env_file "-user-" $USERNAME
  edit_env_file "-username-" $USERNAME
  edit_env_file "-wd-" $(pwd)
  chown $USERNAME .tmp/_env.sh
  bash .tmp/bash-environment-manager-master/common/onhost/deploy.sh
fi

if [[ $CMD == "onguest" ]]; then
  edit_env_file "-user-" $USERNAME
  edit_env_file "-username-" $USERNAME
  edit_env_file "-wd-" $(pwd)
  chown $USERNAME .tmp/_env.sh
  bash .tmp/bash-environment-manager-master/common/onguest/deploy.sh
fi

if [[ $CMD == "vagrant-onguest" ]]; then
  edit_env_file "-user-" vagrant
  edit_env_file "-username-" $USERNAME
  edit_env_file "-wd-" "/vagrant"
  chown $USERNAME .tmp/_env.sh
  bash .tmp/bash-environment-manager-master/common/vagrant-onguest/deploy.sh
fi
