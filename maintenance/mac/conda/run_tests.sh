export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  source maintenance/mac/conda/env.sh
  eval $APPNAME system version
  eval $APPNAME system selftest
  eval $APPNAME system selfcoverage
EOF
