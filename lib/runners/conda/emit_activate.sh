export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

source .tmp/bash-environment-manager-master/lib/bash/lib.sh
getmachine
MACHINE=$_MACHINE
export MACHINE

if [ $MACHINE == "Mac" ]; then
  cp .tmp/bash-environment-manager-master/lib/runners/conda/activate_mac.sh activate.sh
else
  cp .tmp/bash-environment-manager-master/lib/runners/conda/activate_linux.sh activate.sh
fi

sed "s/-appname-/$APPNAME/g" activate.sh > activate.tmp
rm activate.sh
mv activate.tmp activate.sh

sed "s/-username-/$USERNAME/g" activate.sh > activate.tmp
rm activate.sh
mv activate.tmp activate.sh
