export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  if [ $PLATFORM == "vagrant" ]; then
    export USERNAME=vagrant
    eval "vagrant up"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/general/pyenv/install_apt_dependencies.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/general/pyenv/install_python.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/general/pyenv/install_pip_dependencies.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/general/pyenv/install_app.sh $APPNAME $USERNAME $PLATFORM'"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/general/pyenv/run_tests.sh $APPNAME $USERNAME $PLATFORM'"
  elif [ $PLATFORM == "mac" ]
  then
    sudo bash maintenance/general/pyenv/install_python.sh $APPNAME $USERNAME $PLATFORM
    sudo bash maintenance/general/pyenv/install_app.sh $APPNAME $USERNAME $PLATFORM
    sudo bash maintenance/general/pyenv/run_tests.sh $APPNAME $USERNAME $PLATFORM
  else
    echo "not implemented yet"
  fi
EOF
