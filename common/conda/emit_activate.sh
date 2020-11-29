export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

bash .tmp/bash-environment-manager-master/lib/runners/conda/emit_activation.sh
