source .tmp/_env.sh

mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform
chmod -R 777 $PLATFORM

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/library/dependencies/apt.sh
fi

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/init.sh
EOF

su -m $INTERNALUSER<<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/install_app.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/install_vagrant.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/install_terraform.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/install_salt.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/run_salt.sh
EOF

su -m $INTERNALUSER <<'EOF'
  bash .tmp/bash-environment-manager-master/basis/installers/onguest/show_versions.sh
EOF
