export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

bash .tmp/bash-environment-manager-master/common/saltstate/install.sh $APPNAME $USERNAME $PLATFORM $CMD