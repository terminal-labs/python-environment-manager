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

if [[ ! -f ".tmp/downloads/2018.3.3.zip" ]];
then
  cd .tmp/downloads
  wget https://terminal-labs-saltstack-releases.s3-us-west-2.amazonaws.com/2018.3.3.zip
  cd -
fi

if [[ ! -d ".tmp/downloads/2018.3.3" ]];
then
  cd .tmp/downloads
  unzip 2018.3.3.zip
  cd -
fi

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate ${APPNAME}

cd .tmp/downloads
cd 2018.3.3/salt
pip install msgpack==0.6.2
pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install -e .
