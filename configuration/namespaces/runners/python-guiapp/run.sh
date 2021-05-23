source .tmp/_env.sh

sudo su -m root <<'EOF'
if [[ -d "saltstack" ]]; then
  source .tmp/_env.sh
  export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
  source $PLATFORM/platform/miniconda3/etc/profile.d/conda.sh
  source activate $APPNAME
  export DEESCALATED_SALT_CONFIG_DIR=$WD/saltstack/etc
  export DEESCALATED_SALT_ROOT_DIR=$WD/saltstack/srv/salt
  export DEESCALATED_SALT_LOG_FILE=$WD/saltstack/logs/logs
  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --local state.highstate
  chmod -R 777 .tmp
fi
EOF
