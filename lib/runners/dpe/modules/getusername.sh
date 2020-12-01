source .tmp/bash-environment-manager-master/lib/bash/lib.sh

if [[ $MACHINE == "Mac" ]]; then
 source $USERHOME/.bash_profile
else
 source $USERHOME/.bashrc
fi
export $USERHOME
