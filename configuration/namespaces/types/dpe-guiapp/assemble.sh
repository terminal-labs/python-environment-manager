export APPNAME=$1
export USERNAME=$2
export CMD=$3

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/bash/lib.sh

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/bash/setup_tmp.sh
  bash .tmp/bash-environment-manager-master/lib/bash/emit_vars.sh $APPNAME $USERNAME $CMD
EOF

if [[ $CMD == "ondesktop" ]]; then
  bash .tmp/bash-environment-manager-master/common/ondesktop/deploy.sh
fi
