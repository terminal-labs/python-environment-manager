APPNAME=demo
PYTHONVERSION=3.6.9
DPENAME=dpe
USERNAME=$1
NODEVERSION=10.15.0
SALTVERSION=v2018.3.3
USER=USERNAME
export APPNAME
export PYTHONVERSION
export DPENAME
export USERNAME
export NODEVERSION
export SALTVERSION
export USER

if [  -n "$(uname -a | grep Ubuntu)" ]; then
    echo "running in ubuntu"
else
    echo "not running in ubuntu"
    exit
fi


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
  make \
  libcurl4  \
  libcurl4-openssl-dev  \
  libssl-dev  \
  libxml2 \
  libxml2-dev  \
  libssl1.1 \
  pkg-config \
  ca-certificates \
  xclip \
  
su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}
  
  cd /home/${USERNAME}
  mkdir -p ${DPENAME}
  cd ${DPENAME}
  mkdir -p ${APPNAME}
  mkdir -p ${APPNAME}/downloads
  mkdir -p ${APPNAME}/repos
  mkdir -p ${APPNAME}/scripts 
  mkdir -p ${APPNAME}/bin
  
  cd $APPNAME
  cd downloads
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
  wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
  cd ..
  cd repos
  git clone https://github.com/saltstack/salt.git
  git clone https://github.com/nvm-sh/nvm.git
  git clone https://github.com/lastpass/lastpass-cli.git
  git clone https://github.com/terminal-labs/rambo.git --recursive
  git clone https://github.com/terminal-labs/inflation.git --recursiv
  cd ..
  
  cd downloads
  sudo dpkg -i vagrant_2.2.5_x86_64.deb
  vagrant plugin install vagrant-digitalocean
  cd ..
  
  cd downloads
  bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3
  rm Miniconda3-latest-*
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  conda --version
  conda init bash
  . /home/${USERNAME}/.bashrc
  conda update -y -n base -c defaults conda
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n $APPNAME python=${PYTHONVERSION}
  source activate $APPNAME
  pip install --upgrade pip
  pip install --upgrade setuptools
  
  pip install utilities-package
  cd ..

  cd repos/salt
  git checkout ${SALTVERSION}
  pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
  pip install -e .
  cd ../..
  
  cd repos/rambo
  pip install -e .
  cd ../..
  
  cd repos/inflation
  git checkout clickwrapper
  pip install -e .
  cd ../..
  
  cd scripts
  rm *
  wget https://raw.githubusercontent.com/terminal-labs/python-environment-manager/master/scripts/key-loader.py
  wget https://raw.githubusercontent.com/terminal-labs/python-environment-manager/master/scripts/messaging.py
  cd ..
  
  export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
  cd repos/nvm
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  . nvm.sh
  cd ../..
  nvm install ${NODEVERSION}
  nvm use ${NODEVERSION}
  npm -g install js-beautify
  cd repos/lastpass-cli
  make
  cd ../..
EOF


su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}  cd /home/${USERNAME}/${DPENAME}/$APPNAME/downloads
  rm terraform*
  wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
  unzip terraform_0.12.7_linux_amd64.zip
  cp terraform /home/${USERNAME}/${DPENAME}/$APPNAME/bin/terraform
  sudo chmod +x /home/${USERNAME}/${DPENAME}/$APPNAME/bin/terraform
EOF


su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}  cd /home/${USERNAME}/${DPENAME}/$APPNAME/downloads
  rm deploy-ubuntu*
  wget https://raw.githubusercontent.com/terminal-labs/saltstack-cookiecutter/master/deploy-ubuntu.sh
  sudo bash deploy-ubuntu.sh
EOF


chown -R ${USERNAME} /home/${USERNAME}/${DPENAME}
chmod -R 777 /home/${USERNAME}/${DPENAME}


su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH
  
  export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
  export USE_GIT_URI="true"

  source /home/${USERNAME}/.bashrc
  source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
  source activate ${APPNAME}
  
  python /home/${USERNAME}/${DPENAME}/$APPNAME/scripts/messaging.py dpeseemsgood
  python /home/${USERNAME}/${DPENAME}/$APPNAME/scripts/messaging.py getversion
  
  echo "dpe v2019.8.0"
  conda --version
  python --version
  nvm --version
  node --version
  lpass --version
  salt --version
  terraform -version
  vagrant --version
  
  rambo --version
  inflation version
  utilitiespackage system version
  
  python /home/${USERNAME}/${DPENAME}/$APPNAME/scripts/messaging.py keyloader
  python /home/${USERNAME}/${DPENAME}/$APPNAME/scripts/key-loader.py
  
  python /home/${USERNAME}/${DPENAME}/$APPNAME/scripts/messaging.py testsalt
  sudo env "PATH=$PATH" salt-call --local state.sls testing.helloworld
EOF
