su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  pyvirtualbox system version
  pyvirtualbox system selftest
  pyvirtualbox system selfcoverage
EOF
