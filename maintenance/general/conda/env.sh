if [ $PLATFORM == "vagrant" ]
then
  source /home/${USERNAME}/.bashrc
  export PATH="/home/vagrant/miniconda3/bin:$PATH"
  export PATH="/home/vagrant/.local/bin:$PATH"
  HOME=/home/vagrant
  source /home/${USERNAME}/.bashrc
elif [ $PLATFORM == "linux" ]
then
  source /home/${USERNAME}/.bashrc
  export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
  export PATH="/home/${USERNAME}/.local/bin:$PATH"
  export PATH="/home/circleci/.local/bin:$PATH"
  HOME=/home/${USERNAME}
  source /home/${USERNAME}/.bashrc
elif [ $PLATFORM == "mac" ]
then
  source /Users/${USERNAME}/.bash_profile
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  HOME=/Users/${USERNAME}
  source /Users/${USERNAME}/.bashrc
else
  echo "not implemented yet"
fi
source activate ${APPNAME}
