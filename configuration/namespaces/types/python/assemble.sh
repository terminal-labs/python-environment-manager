export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/library/common/vars.sh
source .tmp/bash-environment-manager-master/library/common/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/library/common/setup_tmp.sh
EOF

if [[ $CMD == "conda" ]]; then
  bash .tmp/bash-environment-manager-master/library/common/emit_vars.sh $APPNAME $USERNAME $CMD
  bash .tmp/bash-environment-manager-master/configuration/basis/core/conda/deploy.sh
fi

if [[ $CMD == "vagrant-conda" ]]; then
  bash .tmp/bash-environment-manager-master/library/common/emit_vars.sh $APPNAME $USERNAME $CMD
  bash .tmp/bash-environment-manager-master/configuration/hosts/vagrant/vagrant-conda/deploy.sh
fi
