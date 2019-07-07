# start of section that inherits sudo
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" update
DEBIAN_FRONTEND=noninteractive apt -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" upgrade

apt -y install git \
  wget \
  zip \
  unzip \
  rsync \

apt -y install \
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

su -m $SUDO_USER <<'EOF'
appname=demo
cd ~
mkdir -p .deescalated_platform_environments
cd .deescalated_platform_environments
mkdir -p $appname
mkdir -p $appname/downloads
mkdir -p $appname/repos
mkdir -p $appname/bin
cd $appname
cd downloads
wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
cd ..
cd repos
git clone https://github.com/saltstack/salt
git clone https://github.com/creationix/nvm.git
git clone https://github.com/lastpass/lastpass-cli.git
cd ..
cd downloads
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.deescalated_platform_environments/$appname/miniconda3
export PATH=~/.deescalated_platform_environments/$appname/miniconda3/bin:$PATH
conda update -y -n base -c defaults conda
conda create -y -n lxc-cloud-env python=3.7
source activate lxc-cloud-env
pip -qqq install --upgrade pip
pip -qqq install --upgrade setuptools
cd ..
cd repos/salt
git checkout v2018.3.3
pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
pip install -e .
salt --version
cd ../..
export NVM_DIR=~/.deescalated_platform_environments/$appname/repos/nvm
cd repos/nvm
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
. nvm.sh
cd ../..
nvm install --no-progress 10.15.0 >/dev/null
nvm use 10.15.0 >/dev/null
npm -g install js-beautify >/dev/null
# install lastpass
cd repos/lastpass-cli
make
cd ../..
EOF
