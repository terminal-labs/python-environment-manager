source .tmp/_env.sh

su -m $USERNAME << 'EOF'
  if [[ $MACHINE == "Linux" ]]; then
    cp .tmp/bash-environment-manager-master/types/python/emit/activate_linux.sh activate.sh
  elif [[ $MACHINE == "Mac" ]]
  then
    cp .tmp/bash-environment-manager-master/types/python/emit/activate_mac.sh activate.sh
  else
    echo "not implemented yet"
  fi
EOF
