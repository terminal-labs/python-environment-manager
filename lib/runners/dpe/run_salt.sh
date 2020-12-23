source .tmp/_env.sh

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

sudo su -m root <<'EOF'
if [[ -d "saltstack" ]]; then
  export PATH=/application/platform/miniconda3/bin:$PATH
  export PATH=/home/vagrant/.local/bin:$PATH
  source activate $APPNAME
  export DEESCALATED_SALT_CONFIG_DIR=/Users/mike/Desktop/bash-environment-templates/samples/fuzzball/saltstack/etc
  export DEESCALATED_SALT_ROOT_DIR=/Users/mike/Desktop/bash-environment-templates/samples/fuzzball/saltstack/srv/salt
  export DEESCALATED_SALT_LOG_FILE=/Users/mike/Desktop/bash-environment-templates/samples/fuzzball/saltstack/logs/logs
  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --local state.highstate
fi
EOF
