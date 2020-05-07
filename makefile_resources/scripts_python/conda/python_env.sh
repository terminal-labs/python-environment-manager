if [ $PLATFORM == "vagrant" ]
then
  HOME=/home/vagrant
  source /home/${USERNAME}/.bashrc
  export PATH="/home/vagrant/miniconda3/bin:$PATH"
  export PATH="/home/vagrant/.local/bin:$PATH"
  source /home/vagrant/miniconda3/etc/profile.d/conda.sh;
elif [ $PLATFORM == "linux" ]
then
  HOME=/home/${USERNAME}
  source /home/${USERNAME}/.bashrc
  export PATH="/home/${USERNAME}/miniconda3/bin:$PATH"
  export PATH="/home/${USERNAME}/.local/bin:$PATH"
  export PATH="/home/circleci/.local/bin:$PATH"
  source /home/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
elif [ $PLATFORM == "mac" ]
then
  HOME=/Users/${USERNAME}
  source /Users/${USERNAME}/.bash_profile
  export PATH="/Users/${USERNAME}/miniconda3/bin:$PATH"
  source /Users/${USERNAME}/miniconda3/etc/profile.d/conda.sh;
else
  echo "not implemented yet"
fi

if [ $PLATFORM == "vagrant" ]; then
  source /home/${USERNAME}/.bashrc
  conda init bash
  source /home/${USERNAME}/.bashrc
elif [ $PLATFORM == "linux" ]
then
  source /home/${USERNAME}/.bashrc
  conda init bash
  source /home/${USERNAME}/.bashrc
elif [ $PLATFORM == "mac" ]
then
  source /Users/${USERNAME}/.bash_profile
  conda init bash
  source /Users/${USERNAME}/.bash_profile
else
  echo "not implemented yet"
fi

conda activate ${APPNAME}
