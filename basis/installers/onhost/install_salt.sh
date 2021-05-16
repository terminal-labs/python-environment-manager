source .tmp/_env.sh

if [[ ! -f ".tmp/download/2018.3.3.zip" ]];
then
  cd .tmp/download
  wget https://tl-build-resources.s3-accelerate.amazonaws.com/2018.3.3.zip
  cd -
fi

if [[ ! -d ".tmp/download/2018.3.3" ]];
then
  cd .tmp/download
  unzip 2018.3.3.zip -d ../unzipped
  cd -
fi

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate ${APPNAME}

cd .tmp/unzipped
cd 2018.3.3/salt
pip install msgpack==0.6.2
pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install -e .
