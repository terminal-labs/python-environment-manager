su -m $SUDO_USER <<'EOF'
  source maintenance/linux/pyenv/env.sh
  cd pyvirtualbox
  pip install --user .
EOF
