export APPNAME=$1
export USERNAME=$2
su -m $USERNAME <<'EOF'
  source maintenance/mac/conda/env.sh
  eval cd ${APPNAME}
  pip install .
EOF
