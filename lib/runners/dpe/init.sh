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

export PATH=$PLATFORM/platform/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$PLATFORM/platform/$DPENAME/$APPNAME/bin:$PATH

cd $PLATFORM/platform/$DPENAME/$APPNAME/downloads
if [[ $MACHINE == "Mac" ]]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
else
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
cd -

cd $PLATFORM/platform/$DPENAME/$APPNAME/downloads
if [[ $MACHINE == "Mac" ]]; then
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p ../miniconda3
else
  bash Miniconda3-latest-Linux-x86_64.sh -b -p ../miniconda3
fi
rm Miniconda3-latest-*
cd -

conda --version
conda init bash

conda update -y -n base -c defaults conda
conda --version
conda update -y conda
conda --version
conda create -y -n $APPNAME python=$PYTHONVERSION

source activate $APPNAME

pip install --upgrade pip
pip install --upgrade setuptools

pip install pyyaml
