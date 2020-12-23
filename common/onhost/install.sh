source .tmp/_env.sh

mkdir -p /opt/halcyon
chmod 777 -R /opt/halcyon

if [[ $MACHINE != "Mac" ]]; then
  bash .tmp/bash-environment-manager-master/lib/deps/apt.sh
fi

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/init.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_app.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_vagrant.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_terraform.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/install_salt.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/insert_salt.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/run_salt.sh
EOF

su -m $USERNAME <<'EOF'
  bash .tmp/bash-environment-manager-master/lib/runners/dpe/show_versions.sh
EOF
