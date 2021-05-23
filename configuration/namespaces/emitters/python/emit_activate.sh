source .tmp/_env.sh

su -m $USERNAME << 'EOF'
  if [[ $MACHINE == "Linux" ]]; then
    cp .tmp/bash-environment-manager-master/configuration/basis/emitters/conda/activate_linux.sh activate.sh
  elif [[ $MACHINE == "Mac" ]]
  then
    cp .tmp/bash-environment-manager-master/configuration/basis/emitters/conda/activate_mac.sh activate.sh
  else
    echo "not implemented yet"
  fi
EOF
