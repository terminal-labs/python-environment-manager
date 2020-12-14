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

source .tmp/bash-environment-manager-master/lib/bash/vars.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/getusername.sh
source .tmp/bash-environment-manager-master/lib/runners/dpe/modules/changedir.sh

sudo su -m root <<'EOF'
if [[ -d "saltstack" ]]; then
  export PATH=/opt/halcyon/platform/miniconda3/bin:$PATH
  export PATH=/home/vagrant/.local/bin:$PATH
  source activate sdm
  salt-call --log-level=info --state-output=terse --local state.highstate
fi
EOF
