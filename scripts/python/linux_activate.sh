export APPNAME=-appname-
export USERNAME=-username-
export PLATFORM=-platform-
export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
export PATH="/home/$USERNAME/.local/bin:$PATH"
export USE_GIT_URI="true"
source /home/${USERNAME}/.bashrc
source /home/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
conda activate ${APPNAME}
