source .tmp/_env.sh

source .tmp/bash-environment-manager-master/lib/bash/setup_miniconda.sh

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
