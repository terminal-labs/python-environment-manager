source .tmp/_env.sh

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/download
  wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
  cd ../..
fi

if [[ $MACHINE == "Mac" ]]; then
  :
else
  cd .tmp/download
  sudo dpkg -i vagrant_2.2.5_x86_64.deb
  cd ../..
fi
