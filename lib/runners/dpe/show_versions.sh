source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate $APPNAME

echo "dpe v2020.1.2"
conda --version
python --version
nvm --version
node --version
lpass --version
salt --version
terraform -version
vagrant --version

rambo --version
echo "inflation" $(inflation system version)
echo "utilitiespackage" $(utilitiespackage system version)
