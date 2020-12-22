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

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
else
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
cd -

cd .tmp/downloads
if [[ $MACHINE == "Mac" ]]; then
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $PLATFORM/platform/miniconda3
else
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $PLATFORM/platform/miniconda3
fi
rm Miniconda3-latest-*
cd -

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH

sudo su -m root <<'EOF'
  source .tmp/bash-environment-manager-master/lib/bash/vars.sh
  export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
  conda init bash
EOF

conda init bash

source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda update -y -n base -c defaults conda
conda --version
conda update -y conda
conda --version
conda create -y -n $APPNAME python=$PYTHONVERSION

conda activate $APPNAME

pip install --upgrade pip
pip install --upgrade distro
pip install --upgrade setuptools

pip install pyyaml
