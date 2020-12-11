source .tmp/bash-environment-manager-master/lib/bash/vars.sh

mkdir -p .tmp
cd .tmp
mkdir -p scratch
mkdir -p scripts
mkdir -p clones
cd -

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

cd ../../../../../..
