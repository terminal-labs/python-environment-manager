export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME << 'EOF'
  if [ $PLATFORM == "linux" ]; then
    cp maintenance/general/conda/linux_activate.sh activate.sh
  elif [ $PLATFORM == "mac" ]
  then
    cp maintenance/general/conda/mac_activate.sh activate.sh
   else
    echo "not implemented yet"
  fi
  sed "s/-appname-/$APPNAME/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh
  sed "s/-username-/$USERNAME/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh  
  sed "s/-platform-/$PLATFORM/g" activate.sh > activate.tmp
  rm activate.sh
  mv activate.tmp activate.sh
EOF
