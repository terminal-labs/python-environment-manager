export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
if [ $PLATFORM == "vagrant" ]; then
  bash .tmp/bash-environment-manager-master/common/vagrant-onguest/build.sh $APPNAME $SUDO_USER vagrant
fi
