## default run mdoe = user

export APPNAME=$1
export USERNAME=$2
export PLATFORM=$3
export PYTHONVERSION=$4
export DPENAME=$5
export USER=$6
export USERHOME=$7
export MACHINE=$8
export CMD=$9

LOGNAME=$USERNAME

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

export PATH=$PLATFORM/platform/miniconda3/bin:$PATH

sudo su -m root <<'EOF'
if [[ -d "saltstack" ]]; then
  source .tmp/bash-environment-manager-master/lib/bash/vars.sh
  export PATH=$PLATFORM/platform/miniconda3/bin:$PATH
  source /opt/halcyon/platform/miniconda3/etc/profile.d/conda.sh

  conda activate test-dpe

  export DEESCALATED_SALT_CONFIG_DIR=/home/user/Desktop/bash-environment-templates/samples/fuzzball/saltstack/etc
  export DEESCALATED_SALT_ROOT_DIR=/home/user/Desktop/bash-environment-templates/samples/fuzzball/saltstack/srv/salt
  export DEESCALATED_SALT_LOG_FILE=/home/user/Desktop/bash-environment-templates/samples/fuzzball/saltstack/logs/logs

  salt-call \
     --config-dir=$DEESCALATED_SALT_CONFIG_DIR \
     --log-file=$DEESCALATED_SALT_LOG_FILE \
     --file-root=$DEESCALATED_SALT_ROOT_DIR \
     --log-level=info \
     --local state.highstate
fi
EOF
