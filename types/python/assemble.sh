export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

if [ $CMD == "conda" ]; then
  bash .tmp/bash-environment-manager-master/common/conda/deploy.sh $APPNAME $USERNAME computed $CMD
fi

if [ $CMD == "vagrant-conda" ]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-conda/deploy.sh $APPNAME $USERNAME computed $CMD
fi
