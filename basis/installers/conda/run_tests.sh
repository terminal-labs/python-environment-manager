source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/library/common/lib.sh
source .tmp/bash-environment-manager-master/library/common/vars.sh

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
