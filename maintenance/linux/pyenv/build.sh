su -m $SUDO_USER <<'EOF'
  sudo bash maintenance/linux/pyenv/install_deps.sh
  sudo bash maintenance/linux/pyenv/install_python.sh
  sudo bash maintenance/linux/pyenv/install_app.sh
  sudo bash maintenance/linux/pyenv/run_tests.sh
EOF
