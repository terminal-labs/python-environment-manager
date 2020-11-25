export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

if [ $CMD == "onhost" ]; then
  bash .tmp/bash-environment-manager-master/common/onhost/deploy.sh $APPNAME $USERNAME vagrant $CMD
fi

if [ $CMD == "vagrant-onguest" ]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-onguest/deploy.sh $APPNAME $USERNAME vagrant $CMD
fi
