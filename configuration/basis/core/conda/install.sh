source .tmp/_env.sh

mkdir -p /opt/halcyon
mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform

chmod -R 777 /opt/halcyon
chmod -R 777 $PLATFORM

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/library/dependencies/apt.sh
fi

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/configuration/basis/installers/conda/init.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/configuration/basis/installers/conda/install_app.sh
EOF
