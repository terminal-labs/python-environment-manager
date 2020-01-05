export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  vagrant up
  vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/install_deps.sh'
  vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/install_salt_open.sh'
  vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/run_salt.sh'
  vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/maintenance/vagrant_saltstates/test.sh'
EOF

