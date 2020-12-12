export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  :
else
  wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
fi
cd -

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/downloads
  sudo dpkg -i vagrant_2.2.5_x86_64.deb
fi
