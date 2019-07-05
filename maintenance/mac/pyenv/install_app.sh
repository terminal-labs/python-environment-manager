su -m $SUDO_USER <<'EOF'
  source maintenance/mac/pyenv/env.sh
  cd pyvirtualbox
  pip install --user .
EOF
