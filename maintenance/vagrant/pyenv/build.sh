export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_apt_dependencies.sh $APPNAME $USERNAME'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_python.sh $APPNAME $USERNAME'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_pip_dependencies.sh $APPNAME $USERNAME'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_app.sh $APPNAME $USERNAME'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/run_tests.sh $APPNAME $USERNAME'"
EOF
