source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=$USERHOME/$DPENAME/$APPNAME/miniconda3/bin:$PATH
export PATH=$USERHOME/$DPENAME/$APPNAME/bin:$PATH
