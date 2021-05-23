source .tmp/_env.sh

export TYPE

su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/configuration/basis/core/conda/install.sh'"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/configuration/namespaces/types/${TYPE}/steps.sh'"
EOF
