export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

USER=$USERNAME
SUDO_USER=$USERNAME
USERNAME=$USERNAME
LOGNAME=$USERNAME

cd $USERHOME
mkdir -p $DPENAME
cd $DPENAME
mkdir -p $APPNAME
cd $APPNAME

mkdir -p downloads
mkdir -p repos
mkdir -p scripts
mkdir -p bin

if [ $MACHINE == "Mac" ]; then
  source $USERHOME/.bash_profile
else
  source $USERHOME/.bashrc
fi

export PATH=$USERHOME/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$USERHOME/$DPENAME/$APPNAME/bin:$PATH

export USE_GIT_URI="true"
source activate $APPNAME

python --version

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
