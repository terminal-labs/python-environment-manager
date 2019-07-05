su -m $SUDO_USER <<'EOF'
  source maintenance/linux/pyenv/env.sh
  pyvirtualbox system version
  pyvirtualbox system selftest
  pyvirtualbox system selfcoverage
EOF
