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
  cd ..
  cd repos
    
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

  export USE_GIT_URI="true"
  source /home/${USERNAME}/.bashrc
  source activate ${APPNAME}
EOF
