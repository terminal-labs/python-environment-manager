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
wget https://terminal-labs-saltstack-releases.s3-us-west-2.amazonaws.com/2018.3.3.zip
cd -

cd $PLATFORM/platform/$DPENAME/$APPNAME/downloads
unzip 2018.3.3.zip
cd -

source activate $APPNAME

cd $PLATFORM/platform/$DPENAME/$APPNAME/downloads
cd 2018.3.3/salt
pip install msgpack==0.6.2
pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install .
