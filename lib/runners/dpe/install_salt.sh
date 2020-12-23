source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_changedir.sh

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
