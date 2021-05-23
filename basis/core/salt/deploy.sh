source .tmp/_env.sh

if [[ "Mac"=="Mac" ]]; then
  echo "not supported on mac"
  exit
fi

bash .tmp/bash-environment-manager-master/common/saltstate/install.sh
