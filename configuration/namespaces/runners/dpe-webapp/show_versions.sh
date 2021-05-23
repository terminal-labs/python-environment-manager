source .tmp/_env.sh

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
