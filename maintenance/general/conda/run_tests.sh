su -m vagrant <<'EOF'
  source maintenance/vagrant/conda/env.sh
  pyvirtualbox system version
  pyvirtualbox system selftest
  pyvirtualbox system selfcoverage
EOF
