export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export CMD=$4

su -m $USERNAME <<'EOF'
  eval "vagrant up"
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/common/conda/install.sh"" ${APPNAME}"" vagrant"" ${PLATFORM}'"
EOF
