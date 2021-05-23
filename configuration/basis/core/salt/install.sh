source .tmp/_env.sh

mkdir -p /opt/halcyon
mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform

chmod -R 777 /opt/halcyon
chmod -R 777 $PLATFORM

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/library/dependencies/apt.sh
fi

bash .tmp/bash-environment-manager-master/namespaces/runners/salt/install_salt.sh
bash .tmp/bash-environment-manager-master/namespaces/runners/salt/run_salt.sh
