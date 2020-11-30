export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

if [[ $CMD == "saltstates" ]]; then
  bash .tmp/bash-environment-manager-master/common/saltstates/deploy.sh $APPNAME $USERNAME computed $CMD
fi

if [[ $CMD == "vagrant-saltstates" ]]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-saltstates/deploy.sh $APPNAME $USERNAME computed $CMD
fi
