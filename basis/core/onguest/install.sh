source .tmp/_env.sh

mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform
chmod -R 777 $PLATFORM

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/init.sh
EOF

su -m $INTERNALUSER<<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/install_app.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/install_vagrant.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/install_terraform.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/install_salt.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/runners/dpe/run_salt.sh
EOF

# su -m $INTERNALUSER <<'EOF'
#   bash .tmp/bash-environment-manager-master/runners/dpe/show_versions.sh
# EOF
