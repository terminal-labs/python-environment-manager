export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  source maintenance/mac/pyenv/env.sh
  eval cd $APPNAME
  pip install --user .
EOF
