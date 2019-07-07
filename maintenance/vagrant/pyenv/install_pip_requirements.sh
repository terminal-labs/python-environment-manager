export APPNAME=$1
export USERNAME=$2
su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  if [ -f requirements.txt ] 
  then
    pip install --user -r requirements.txt
  fi
EOF
