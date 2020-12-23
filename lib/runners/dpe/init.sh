source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_changedir.sh

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  if [[ ! -f "Miniconda3-latest-MacOSX-x86_64.sh" ]];
  then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  fi
else
  if [[ ! -f "Miniconda3-latest-Linux-x86_64.sh" ]];
  then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
  fi
fi
cd -

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $PLATFORM/platform/miniconda3
else
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $PLATFORM/platform/miniconda3
fi
cd -

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH

conda --version
conda init bash

source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda update -y -n base -c defaults conda
conda --version
conda update -y conda
conda --version
conda create -y -n $APPNAME python=$PYTHONVERSION

conda activate $APPNAME

pip install --upgrade pip
pip install --upgrade setuptools

pip install pyyaml
