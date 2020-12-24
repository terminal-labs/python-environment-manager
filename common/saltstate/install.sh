source .tmp/_env.sh

mkdir -p /opt/halcyon
chmod -R 777 /opt/halcyon

mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

bash .tmp/bash-environment-manager-master/lib/runners/saltstate/init.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
bash .tmp/bash-environment-manager-master/lib/runners/saltstate/run_salt.sh $APPNAME $USERNAME $PLATFORM $PYTHONVERSION $DPENAME $USER $USERHOME $MACHINE $CMD
