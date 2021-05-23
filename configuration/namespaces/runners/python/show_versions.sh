source .tmp/_env.sh

source .tmp/bash-environment-manager-master/library/common/lib.sh
source .tmp/bash-environment-manager-master/library/common/vars.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate $APPNAME

conda --version
python --version

echo "utilitiespackage" $(utilitiespackage system version)
