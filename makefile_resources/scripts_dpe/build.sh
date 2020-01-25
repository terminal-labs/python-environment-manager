export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  if [ $PLATFORM == "vagrant" ]; then
    export USERNAME=vagrant
    eval "vagrant up"
    eval "vagrant ssh --command 'cd /vagrant; sudo bash .tmp/python-environment-manager-master/makefile_resources/scripts_dpe/create.sh $(APPNAME) $(USERNAME) vagrant"
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
