source .tmp/_env.sh

mkdir -p /opt/halcyon
chmod 777 -R /opt/halcyon

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
  bash .tmp/bash-environment-manager-master/lib/runners/conda/test_run.sh
EOF
