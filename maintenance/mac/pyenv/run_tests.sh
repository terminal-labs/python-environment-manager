export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  source maintenance/mac/pyenv/env.sh
  eval $APPNAME system version
  eval $APPNAME system selftest
  eval $APPNAME system selfcoverage
EOF
