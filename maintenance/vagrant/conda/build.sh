su -m $SUDO_USER <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/conda/install_deps.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/conda/install_python.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/conda/install_app.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash maintenance/vagrant/conda/run_tests.sh'"
EOF
