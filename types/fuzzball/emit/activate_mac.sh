export APPNAME=-appname-
export USERNAME=-username-

export PATH="/Users/$USERNAME/miniconda3/bin:$PATH"
source /Users/$USERNAME/miniconda3/etc/profile.d/conda.sh;

conda activate ${APPNAME}
