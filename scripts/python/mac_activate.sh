export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
export PATH="/Users/$USERNAME/.local/bin:$PATH"
export USE_GIT_URI="true"
source /Users/${USERNAME}/.bash_profile
source /Users/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
conda activate ${APPNAME}
