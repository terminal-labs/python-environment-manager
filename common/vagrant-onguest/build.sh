export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/makefile_resources/scripts_vagrant_saltstates/install_deps.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/makefile_resources/scripts_vagrant_saltstates/install_salt_open.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/makefile_resources/scripts_vagrant_saltstates/run_salt.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/makefile_resources/scripts_vagrant_saltstates/test.sh'"
EOF
