source .tmp/_env.sh

cd .tmp/download
if [[ $MACHINE == "Mac" ]]; then
  if [[ ! -f "Miniconda3-latest-MacOSX-x86_64.sh" ]];
  then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
  fi
else
  if [[ ! -f "Miniconda3-latest-Linux-x86_64.sh" ]];
  then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
  fi
fi
cd -

cd .tmp/download
if [[ $MACHINE == "Mac" ]]; then
  bash Miniconda3-latest-MacOSX-x86_64.sh -b -p $PLATFORM/platform/miniconda3
else
  export HOME=$INTERNALUSERHOME  
  bash Miniconda3-latest-Linux-x86_64.sh -b -p $PLATFORM/platform/miniconda3
fi
cd -
