if [ $PLATFORM == "vagrant" ]
then
  export PATH="/home/vagrant/miniconda3/bin:$PATH"
  export PATH="/home/vagrant/.local/bin:$PATH"
  source /home/${USERNAME}/.bashrc
  conda activate ${APPNAME}
elif [ $PLATFORM == "linux" ]
then
  export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
  export PATH="/home/${USERNAME}/.local/bin:$PATH"
  export PATH="/home/circleci/.local/bin:$PATH"
  source /home/${USERNAME}/.bashrc
  conda activate ${APPNAME}
elif [ $PLATFORM == "mac" ]
then
  source /Users/${USERNAME}/.bash_profile
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  source /Users/${USERNAME}/.bash_profile
  conda activate ${APPNAME}
else
  echo "not implemented yet"
fi

conda activate ${APPNAME}
