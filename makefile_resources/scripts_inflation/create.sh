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
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/Miniconda3-latest-Linux-x86_64.sh
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/vagrant_2.2.5_x86_64.deb
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
  pip install --upgrade "pip"
  pip install --upgrade "setuptools<=45"

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

cd .tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
cd -

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
apt-get install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update
apt-get install -y google-cloud-sdk

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  HOME=/home/${USERNAME}
  LOGNAME=${USERNAME}
  cd /home/${USERNAME}/${DPENAME}/$APPNAME/downloads
  rm terraform*
  wget https://tl-build-resources.s3.us-east-2.amazonaws.com/terraform_0.12.24_linux_amd64.zip
  unzip terraform_0.12.24_linux_amd64.zip
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

  echo "dpe v2020.5.1"
  conda --version
  python --version
  nvm --version
  node --version
  rambo --version
  inflation version
  echo "utilitiespackage" $(utilitiespackage system version)

  lpass --version
  salt --version
  terraform -version
  vagrant --version
  aws --version
  gcloud version
  az version
  sudo env "PATH=$PATH" salt-call --local state.sls testing.helloworld
EOF

if test -d "extras/football/saltstack";then \
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

  export DEESCALATED_SALT_CONFIG_DIR=/vagrant/extras/football/saltstack/configs
  export DEESCALATED_SALT_ROOT_DIR=/vagrant/extras/football/saltstack/states
  export DEESCALATED_SALT_LOG_FILE=/vagrant/extras/football/saltstack/logs/logs

  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --state-output=terse \
     --local state.highstate
fi
