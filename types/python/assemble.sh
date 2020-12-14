export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
EOF

if [[ $CMD == "conda" ]]; then
  bash .tmp/bash-environment-manager-master/common/conda/deploy.sh $APPNAME $USERNAME computed $CMD
fi

if [[ $CMD == "vagrant-conda" ]]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-conda/deploy.sh $APPNAME $USERNAME computed $CMD
fi
