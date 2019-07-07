export APPNAME=$1
export USERNAME=$2
su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  if [ -d $APPNAME ] 
  then
    eval $APPNAME system version
    eval $APPNAME system selftest
    eval $APPNAME system selfcoverage
  fi
EOF
