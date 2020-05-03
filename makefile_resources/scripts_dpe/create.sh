APPNAME=$1
PYTHONVERSION=3.6.9
DPENAME=dpe
USERNAME=$2
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
  libpq-dev \
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
  wget https://terminal-labs-saltstack-releases.s3-us-west-2.amazonaws.com/2018.3.3.zip
  cd ..
  cd repos
  git clone https://github.com/nvm-sh/nvm.git
  git clone https://github.com/lastpass/lastpass-cli.git
  git clone https://github.com/terminal-labs/rambo.git --recursive
  git clone https://github.com/terminal-labs/inflation.git --recursive
  git clone https://gitlab.com/terminallabs/utilitiespackage/utilities-package.git --recursive
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
  
  pip install PyYAML
  cd ..

  cd downloads
  unzip 2018.3.3.zip
  cd 2018.3.3/salt
  pip install msgpack==0.6.2
  pip install pyzmq==17.0 PyYAML pycrypto msgpack-python jinja2 psutil futures tornado
  pip install -e .
  cd ../../..
  
  cd repos/rambo
  pip install .
  cd ../..
  
  cd repos/inflation/inflation
  pip install .
  cd ../../..
  
  cd repos/utilities-package/utilitiespackage
  pip install .
  cd ../../..

  cd scripts
  rm *
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
  LOGNAME=${USERNAME}
  cd /home/${USERNAME}/${DPENAME}/$APPNAME/downloads
  rm terraform*
  wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
  unzip terraform_0.12.7_linux_amd64.zip
  cp terraform /home/${USERNAME}/${DPENAME}/$APPNAME/bin/terraform
EOF
chmod +x /home/${USERNAME}/${DPENAME}/$APPNAME/bin/terraform

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}
  cd /home/${USERNAME}/${DPENAME}/$APPNAME/downloads
  rm deploy-ubuntu*
  wget https://raw.githubusercontent.com/terminal-labs/saltstack-cookiecutter/master/deploy-ubuntu.sh
EOF
bash /home/${USERNAME}/${DPENAME}/$APPNAME/downloads/deploy-ubuntu.sh

chown -R ${USERNAME} /home/${USERNAME}/${DPENAME}
chmod -R 777 /home/${USERNAME}/${DPENAME}

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH
  
  export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
  export USE_GIT_URI="true"

  source /home/${USERNAME}/.bashrc
  source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
  source activate ${APPNAME}
  
  echo "dpe v2020.1.1"
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
  echo "utilitiespackage" $(utilitiespackage system version)
  
  sudo env "PATH=$PATH" salt-call --local state.sls testing.helloworld
EOF

if test -d "saltstack";then \
  chown -R ${USERNAME} /home/${USERNAME}/${DPENAME}
  chmod -R 777 /home/${USERNAME}/${DPENAME}
  chown -R ${USERNAME} /vagrant
  chmod -R 777 /vagrant

  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}

  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/bin:$PATH
  export PATH=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/lastpass-cli/build:$PATH

  export NVM_DIR=/home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm
  export USE_GIT_URI="true"
  source /home/${USERNAME}/.bashrc
  source /home/${USERNAME}/${DPENAME}/$APPNAME/repos/nvm/nvm.sh
  source activate ${APPNAME}

  export DEESCALATED_SALT_CONFIG_DIR=/vagrant/saltstack/configs
  export DEESCALATED_SALT_ROOT_DIR=/vagrant/saltstack/states
  export DEESCALATED_SALT_LOG_FILE=/vagrant/saltstack/logs/logs

  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --state-output=terse \
     --local state.highstate
fi
