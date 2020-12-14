## default run mdoe = user

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
  rm terraform*
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/terraform_0.12.24_linux_amd64.zip
fi
cd -

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/downloads
  unzip terraform_0.12.24_linux_amd64.zip
  cp terraform ../bin/terraform
fi
