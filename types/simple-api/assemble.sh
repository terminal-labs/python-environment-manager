export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
EOF

if [[ $CMD == "onhost" ]]; then
  bash .tmp/bash-environment-manager-master/common/onhost/deploy.sh $APPNAME $USERNAME computed $CMD
fi

if [[ $CMD == "onguest" ]]; then
  bash .tmp/bash-environment-manager-master/common/onguest/deploy.sh $APPNAME $USERNAME computed $CMD
fi

if [[ $CMD == "vagrant-onguest" ]]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-onguest/deploy.sh $APPNAME $USERNAME vagrant $CMD
fi
