export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/bash/lib.sh

getmachine
getuserhome
emit_env_file

edit_env_file "-appname-" $APPNAME
edit_env_file "-platform-" $PLATFORM
edit_env_file "-cmd-" $CMD
edit_env_file "-pythonversion-" "3.6.9"
edit_env_file "-dpename-" "dpe"
edit_env_file "-wd-" $(pwd)

if [[ $CMD == "conda" ]]; then
  edit_env_file "-user-" $USERNAME
  edit_env_file "-username-" $USERNAME
  edit_env_file "-userhome-" $USERHOME
  edit_env_file "-internaluser-" $USERNAME
  edit_env_file "-internalusername-" $USERNAME
  edit_env_file "-internaluserhome-" $USERHOME
  edit_env_file "-machine-" $MACHINE
fi

if [[ $CMD == "vagrant-conda" ]]; then
  edit_env_file "-user-" $USERNAME
  edit_env_file "-username-" $USERNAME
  edit_env_file "-userhome-" $USERHOME
  edit_env_file "-internaluser-" "vagrant"
  edit_env_file "-internalusername-" "vagrant"
  edit_env_file "-internaluserhome-" "/home/vagrant"
  edit_env_file "-machine-" "Linux"
fi

cat .tmp/_env.sh
