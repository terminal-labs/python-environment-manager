source .tmp/_env.sh

mkdir -p /opt/halcyon
chmod -R 777 /opt/halcyon

mkdir -p $PLATFORM
mkdir -p $PLATFORM/platform

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

su -m $USER <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/conda/init.sh
EOF

su -m $USER <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/conda/install_app.sh
EOF

su -m $USER <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/conda/run_tests.sh
EOF
