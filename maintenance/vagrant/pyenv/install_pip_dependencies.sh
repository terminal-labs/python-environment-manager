export APPNAME=$1
export USERNAME=$2
su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  if [ -f dependencies/pip.txt ] 
  then
    pip install --user -r dependencies/pip.txt
  fi
EOF
