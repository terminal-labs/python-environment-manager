export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/bash/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
EOF

if [[ $CMD == "conda" ]]; then
  bash .tmp/bash-environment-manager-master/lib/bash/emit_vars.sh $APPNAME $USERNAME $CMD
  bash .tmp/bash-environment-manager-master/common/conda/deploy.sh
fi

if [[ $CMD == "vagrant-conda" ]]; then
  bash .tmp/bash-environment-manager-master/lib/bash/emit_vars.sh $APPNAME $USERNAME $CMD
  bash .tmp/bash-environment-manager-master/common/vagrant-conda/deploy.sh
fi
