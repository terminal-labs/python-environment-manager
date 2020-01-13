APPNAME=demo
PYTHONVERSION=3.6.9
DPENAME=dpe
USERNAME=mike
USER=USERNAME
export APPNAME
export PYTHONVERSION
export DPENAME
export USERNAME
export USER

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
MACHINE=$machine
export MACHINE

if [ ${MACHINE} == "Mac" ]; then
  USERHOME=/Users/${USERNAME}
else
  USERHOME=/home/${USERNAME}
fi
export USERHOME

if [ ${MACHINE} != "Mac" ]; then
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

fi

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}
  LOGNAME=${USERNAME}



  cd ${USERHOME}

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

  if [ ${MACHINE} == "Mac" ]; then
    :
  else
    cd downloads
    sudo dpkg -i vagrant_2.2.5_x86_64.deb
    vagrant plugin install vagrant-digitalocean
    cd ..
  fi

  cd downloads
  bash Miniconda3-latest-Linux-x86_64.sh -b -p ${USERHOME}/${DPENAME}/$APPNAME/miniconda3
  rm Miniconda3-latest-*
  export PATH=${USERHOME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  conda --version
  conda init bash

  if [ ${MACHINE} == "Mac" ]; then
   source ${USERHOME}/.bash_profile
  else
   source ${USERHOME}/.bashrc
  fi
  conda update -y -n base -c defaults conda
  conda --version
  conda update -y conda
  conda --version
  conda create -y -n $APPNAME python=${PYTHONVERSION}
  source activate $APPNAME
  pip install --upgrade pip
  pip install --upgrade setuptools
EOF

chown -R ${USERNAME} ${USERHOME}/${DPENAME}
chmod -R 777 ${USERHOME}/${DPENAME}

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}

  LOGNAME=${USERNAME}  export PATH=${USERHOME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=${USERHOME}/${DPENAME}/$APPNAME/bin:$PATH

  export USE_GIT_URI="true"
  if [ ${MACHINE} == "Mac" ]; then
   source ${USERHOME}/.bash_profile
  else
   source ${USERHOME}/.bashrc
  fi
  source activate ${APPNAME}
EOF
