APPNAME=demo3
PYTHONVERSION=3.7
DPENAME=.deescalated_platform_environments

DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt -y install \
  git \
  wget \
  zip \
  unzip \
  rsync \
  bash-completion \
  build-essential \
  cmake \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip \

export APPNAME
export PYTHONVERSION
export DPENAME
su -m $SUDO_USER <<'EOF'
cd /home/user
mkdir -p ${DPENAME}
cd ${DPENAME}
mkdir -p ${APPNAME}
mkdir -p ${APPNAME}/downloads
mkdir -p ${APPNAME}/repos
mkdir -p ${APPNAME}/bin
cd $APPNAME
cd downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
cd ..
cd repos
git clone https://github.com/saltstack/salt
git clone https://github.com/creationix/nvm.git
git clone https://github.com/lastpass/lastpass-cli.git
cd ..
cd downloads
bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/user/.deescalated_platform_environments/$APPNAME/miniconda3
export PATH=/home/user/.deescalated_platform_environments/$APPNAME/miniconda3/bin:$PATH
conda --version
conda update -y -n base -c defaults conda
conda --version
conda update -y conda
conda --version
conda create -y -n $APPNAME python=${PYTHONVERSION}
source activate $APPNAME
pip install --upgrade pip
pip install --upgrade setuptools
cd ..
cd repos/salt
git checkout v2018.3.3
pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install -e .
salt --version
cd ../..
export NVM_DIR=/home/user/.deescalated_platform_environments/$APPNAME/repos/nvm
cd repos/nvm
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
. nvm.sh
cd ../..
nvm install 10.15.0
nvm use 10.15.0
npm -g install js-beautify
cd repos/lastpass-cli
make
cd ../..
EOF
