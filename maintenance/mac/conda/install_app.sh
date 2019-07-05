su -m $SUDO_USER <<'EOF'
  source maintenance/mac/conda/env.sh
  cd pyvirtualbox
  pip install .
EOF
