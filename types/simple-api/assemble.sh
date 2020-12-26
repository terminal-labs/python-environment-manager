export APPNAME=$1
export USERNAME=$2
export CMD=$3

bash .tmp/bash-environment-manager-master/common/conda/asm.sh $APPNAME $USERNAME $CMD
