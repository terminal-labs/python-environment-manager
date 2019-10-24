export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  chown -R /vagrant
  chmod -R 777 /vagrant  
  cd /vagrant/cookiecutterapp
  make createdpe
EOF
