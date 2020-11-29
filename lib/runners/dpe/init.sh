export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

unset SUDO_UID SUDO_GID SUDO_USER

USER=$USERNAME
SUDO_USER=$USERNAME
USERNAME=$USERNAME
LOGNAME=$USERNAME

cd $USERHOME
mkdir -p $DPENAME
cd $DPENAME
mkdir -p $APPNAME
cd $APPNAME

mkdir -p downloads
mkdir -p repos
mkdir -p scripts
mkdir -p bin

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
  rm Miniconda3-latest-*
else
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $USERHOME/$DPENAME/$APPNAME/miniconda3
  rm Miniconda3-latest-*
fi
cd ..

export PATH=$USERHOME/$DPENAME/$APPNAME/miniconda3/bin:$PATH
conda --version
conda init bash

if [[ $MACHINE == "Mac" ]]; then
 source $USERHOME/.bash_profile
else
 source $USERHOME/.bashrc
fi

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
