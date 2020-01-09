export USERNAME=$1
su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/install_deps.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/install_salt_open.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/run_salt.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/test.sh'"
EOF
