export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
su -m $USERNAME <<'EOF'
  source .tmp/python-environment-manager-master/makefile_resources/scripts_python/env.sh
  if [ ! -f "setup.py" ];
  then
    if [ -d $APPNAME ] && [ ! -z $APPNAME ];
    then
      ${APPNAME} system version
      ${APPNAME} system selftest
      ${APPNAME} system selfcoverage
    fi
  else
    ${APPNAME} --version
  fi
EOF
