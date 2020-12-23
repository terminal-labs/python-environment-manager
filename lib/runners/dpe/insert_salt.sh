source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_changedir.sh

export PATH=$USERHOME/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$USERHOME/$DPENAME/$APPNAME/bin:$PATH
