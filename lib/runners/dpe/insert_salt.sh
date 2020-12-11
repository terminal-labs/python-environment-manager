export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=.tmp/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=.tmp/$DPENAME/$APPNAME/bin:$PATH

cd /vagrant
mkdir -p /etc/salt
cp -r saltstack/etc/* /etc/salt
cp -r saltstack/srv/* /srv
