source .tmp/bash-environment-manager-master/lib/bash/vars.sh

bash source .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh

cd $PLATFORM

mkdir -p platform
cd platform
mkdir -p $DPENAME
cd $DPENAME
mkdir -p $APPNAME
cd $APPNAME

mkdir -p downloads
mkdir -p unzipped
mkdir -p repos
mkdir -p bin

cd ../../../..
