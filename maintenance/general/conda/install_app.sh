export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source /home/vagrant/.bashrc
  HOME=/home/vagrant
  conda activate ${APPNAME}
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    cd $APPNAME
    pip install -e .
  fi
EOF
