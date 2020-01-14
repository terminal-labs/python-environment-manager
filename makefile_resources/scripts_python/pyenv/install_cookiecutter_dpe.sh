export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  cd /vagrant/cookiecutterapp
  sudo make createdpe
EOF
