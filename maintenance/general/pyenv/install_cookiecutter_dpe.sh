export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  chown -R vagrant /vagrant
  chmod -R 777 /vagrant
  export USER=vagrant
  export USERNAME=vagrant  
  cd /vagrant/cookiecutterapp
  make createdpe
EOF
