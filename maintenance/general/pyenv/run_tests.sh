export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source maintenance/general/pyenv/env.sh
  if [ -d $APPNAME ] 
  then
    eval $APPNAME system version
    eval $APPNAME system selftest
    eval $APPNAME system selfcoverage
  fi
EOF
