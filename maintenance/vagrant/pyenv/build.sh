su -m $SUDO_USER <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_deps.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_python.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/install_app.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/pyenv/run_tests.sh'"
EOF