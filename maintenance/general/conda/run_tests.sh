export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'  
  source maintenance/general/conda/env.sh
  if [ -d $APPNAME ] && [ ! -z $APPNAME ];
  then
    ${APPNAME} system version
    ${APPNAME} system selftest
    ${APPNAME} system selfcoverage
  fi
EOF
