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

source .tmp/bash-environment-manager-master/lib/bash/vars.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate ${APPNAME}

if [[ -f ".repo/tests" ]];
then
  if jumper >/dev/null 2>&1; then
    jumper system version
    jumper system selftest
    jumper system selfcoverage
  else
    ${APPNAME} system version
    ${APPNAME} system selftest
    ${APPNAME} system selfcoverage
  fi
fi
