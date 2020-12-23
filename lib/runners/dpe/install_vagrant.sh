source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/mod_changedir.sh

cd downloads
if [[ $MACHINE == "Mac" ]]; then
  :
else
  wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
fi
cd ..

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd downloads
  sudo dpkg -i vagrant_2.2.5_x86_64.deb
fi
