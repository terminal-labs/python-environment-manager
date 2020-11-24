export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3

PYTHONVERSION=3.6.9
DPENAME=dpe
USER=USERNAME
export APPNAME
export USERNAME
export PLATFORM
export PYTHONVERSION
export DPENAME
export USER

source .tmp/bash-environment-manager-master/lib/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

if [ ${MACHINE} == "Mac" ]; then
  USERHOME=/Users/${USERNAME}
else
  USERHOME=/home/${USERNAME}
fi
export USERHOME

if [ ${MACHINE} != "Mac" ]; then
  bash .tmp/bash-environment-manager-master/lib/appdeps.sh
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

  cd repos
   git clone https://github.com/terminal-labs/inflation.git --recursive
  cd ..

  cd downloads
  if [ ${MACHINE} == "Mac" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  else
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
  fi
  cd ..

  if [ ${MACHINE} == "Mac" ]; then
    :
  else
    cd downloads
    sudo dpkg -i vagrant_2.2.5_x86_64.deb
    cd ..
  fi

  cd downloads
  if [ ${MACHINE} == "Mac" ]; then
    bash Miniconda3-latest-MacOSX-x86_64.sh -b -p ${USERHOME}/${DPENAME}/$APPNAME/miniconda3
    rm Miniconda3-latest-*
  else
    bash Miniconda3-latest-Linux-x86_64.sh -b -p ${USERHOME}/${DPENAME}/$APPNAME/miniconda3
    rm Miniconda3-latest-*
  fi
  cd ..

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

  pip install pyyaml

  cd repos/inflation
    pip install .
  cd ../..
EOF

su -m ${USERNAME} <<'EOF'
  unset SUDO_UID SUDO_GID SUDO_USER
  USER=${USERNAME}
  SUDO_USER=${USERNAME}
  USERNAME=${USERNAME}

  LOGNAME=${USERNAME}
  export PATH=${USERHOME}/${DPENAME}/$APPNAME/miniconda3/bin:$PATH
  export PATH=${USERHOME}/${DPENAME}/$APPNAME/bin:$PATH

  export USE_GIT_URI="true"
  if [ ${MACHINE} == "Mac" ]; then
    source ${USERHOME}/.bash_profile
  else
    source ${USERHOME}/.bashrc
  fi
    source activate ${APPNAME}
EOF