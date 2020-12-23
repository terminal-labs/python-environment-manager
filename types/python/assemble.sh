export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

source .tmp/bash-environment-manager-master/lib/bash/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
EOF

getmachine
getuserhome

emit_env_file

edit_env_file "-appname-" $APPNAME
edit_env_file "-platform-" $PLATFORM
edit_env_file "-cmd-" $CMD
edit_env_file "-userhome-" $USERHOME
edit_env_file "-pythonversion-" "3.6.9"
edit_env_file "-dpename-" "dpe"

if [[ $CMD == "conda" ]]; then
  edit_env_file "-user-" $USERNAME
  edit_env_file "-username-" $USERNAME
  edit_env_file "-machine-" $MACHINE
  bash .tmp/bash-environment-manager-master/common/conda/deploy.sh
fi

if [[ $CMD == "vagrant-conda" ]]; then
  edit_env_file "-user-" "vagrant"
  edit_env_file "-username-" $USERNAME
  edit_env_file "-machine-" "Linux"
  bash .tmp/bash-environment-manager-master/common/vagrant-conda/deploy.sh
fi
