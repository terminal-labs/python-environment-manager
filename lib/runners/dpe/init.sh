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

source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh

export PATH=$USERHOME/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$USERHOME/$DPENAME/$APPNAME/bin:$PATH

cd downloads
if [[ $MACHINE == "Mac" ]]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
else
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
cd ..

cd downloads
if [[ $MACHINE == "Mac" ]]; then
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $USERHOME/$DPENAME/$APPNAME/miniconda3
else
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $USERHOME/$DPENAME/$APPNAME/miniconda3
fi
rm Miniconda3-latest-*
cd ..

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

# cd repos/inflation
#   pip install .
# cd ../..

# cd repos
# git clone https://github.com/nvm-sh/nvm.git
# git clone https://github.com/lastpass/lastpass-cli.git
# git clone https://github.com/terminal-labs/rambo.git
# git clone https://github.com/terminal-labs/inflation.git
# git clone https://gitlab.com/terminallabs/utilitiespackage/utilities-package.git
# cd ..
