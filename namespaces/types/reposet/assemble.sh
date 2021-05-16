export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/bash/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
  bash .tmp/bash-environment-manager-master/lib/bash/emit_vars.sh $APPNAME $USERNAME $CMD
EOF

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
