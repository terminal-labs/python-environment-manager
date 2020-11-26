export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

unset SUDO_UID SUDO_GID SUDO_USER

USER=$USERNAME
SUDO_USER=$USERNAME
USERNAME=$USERNAME
LOGNAME=$USERNAME

if [ $MACHINE == "Mac" ]; then
  if [ ! -d "/Users/$USERNAME/miniconda3" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh -b
    rm Miniconda3-latest*
  fi
  export PATH="/Users/$USERNAME/miniconda3/bin:$PATH"
  source /Users/$USERNAME/miniconda3/etc/profile.d/conda.sh;
else
  if [ ! -d "/home/$USERNAME/miniconda3" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b
    rm Miniconda3-latest*
  fi
  export PATH="/home/$USERNAME/miniconda3/bin:$PATH"
  source /home/$USERNAME/miniconda3/etc/profile.d/conda.sh;
fi

conda --version
conda update -y conda
conda --version
conda create -y -n $APPNAME python=3.6.9
conda activate $APPNAME

pip install "setuptools<=45"
pip install --upgrade pip
