export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=3.6.9
export DPENAME=dpe
export USER=USERNAME

source .tmp/bash-environment-manager-master/lib/bash/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

echo "install conda"
