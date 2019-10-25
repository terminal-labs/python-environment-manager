export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  if [ $PLATFORM == "vagrant" ]; then
    eval "vagrant up"
    eval vagrant ssh --command 'cd /vagrant; sudo bash bootstrap.sh'
  elif [ $PLATFORM == "linux" ]
  then
    echo "not implemented yet"
  elif [ $PLATFORM == "mac" ]
  then
    echo "not implemented yet"
  else
    echo "not implemented yet"
  fi
EOF
