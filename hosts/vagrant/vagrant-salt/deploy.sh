source .tmp/_env.sh

su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/basis/core/salt/install.sh'"
EOF
