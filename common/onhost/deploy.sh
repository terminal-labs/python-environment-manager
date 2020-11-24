export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3

su -m $USERNAME <<'EOF'
  eval "vagrant up
  eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/bash-environment-manager-master/common/onguest/install.sh"" ${APPNAME}"" vagrant"" ${PLATFORM}'"
EOF
