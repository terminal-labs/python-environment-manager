export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

if [[ "Mac"=="Mac" ]]; then
  echo "not supported on mac"
  exit
fi

bash .tmp/bash-environment-manager-master/common/saltstate/install.sh $APPNAME $USERNAME $PLATFORM $CMD
