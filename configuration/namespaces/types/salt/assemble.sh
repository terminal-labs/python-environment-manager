export APPNAME=$1
export USERNAME=$2
export CMD=$3
export TYPE=$4

source .tmp/bash-environment-manager-master/library/common/vars.sh
source .tmp/bash-environment-manager-master/library/common/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/library/common/setup_tmp.sh
  bash .tmp/bash-environment-manager-master/library/common/emit_vars.sh $APPNAME $USERNAME $CMD $TYPE
EOF

if [[ $CMD == "salt" ]]; then
  bash .tmp/bash-environment-manager-master/configuration/basis/core/salt/deploy.sh
fi

if [[ $CMD == "vagrant-salt" ]]; then
  bash .tmp/bash-environment-manager-master/configuration/hosts/vagrant/vagrant-salt/deploy.sh
fi
