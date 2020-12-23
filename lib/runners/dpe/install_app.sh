source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/lib.sh
source .tmp/bash-environment-manager-master/lib/bash/vars.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh

conda activate ${APPNAME}

if [[ -f "dependencies/repos-pip.txt" ]];
then
  cat dependencies/repos-pip.txt | while read line
  do
    clone_repo $line
    install_project_repo_pip $line
  done
else
  :
fi

if [[ -f "setup.py" ]];
then
  pip install -e .
else
  if [[ -d $APPNAME ]] && [[ ! -z $APPNAME ]];
  then
    cd $APPNAME
    pip install -e .
  fi
fi
