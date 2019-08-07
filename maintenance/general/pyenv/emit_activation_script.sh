export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME << 'EOF'
  if [ $PLATFORM == "linux" ]; then
   cp maintenance/general/pyenv/linux_activate.sh activate.sh
  elif [ $PLATFORM == "mac" ]
  then
    cp maintenance/general/pyenv/mac_activate.sh activate.sh
  else
    echo "not implemented yet"
  fi
EOF
