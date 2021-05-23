export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/library/common/vars.sh
source .tmp/bash-environment-manager-master/library/common/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/library/common/setup_tmp.sh
  bash .tmp/bash-environment-manager-master/library/common/emit_vars.sh $APPNAME $USERNAME $CMD
EOF

if [[ $CMD == "onhost" ]]; then
  bash .tmp/bash-environment-manager-master/common/onhost/deploy.sh
fi

if [[ $CMD == "onguest" ]]; then
  bash .tmp/bash-environment-manager-master/common/onguest/deploy.sh
fi

if [[ $CMD == "vagrant-onguest" ]]; then
  bash .tmp/bash-environment-manager-master/hosts/vagrant/vagrant-onguest/deploy.sh
fi
