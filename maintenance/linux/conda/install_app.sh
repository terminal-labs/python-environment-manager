su -m $SUDO_USER <<'EOF'
  source maintenance/linux/conda/env.sh
  cd pyvirtualbox
  pip install .
EOF
