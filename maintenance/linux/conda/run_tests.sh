su -m $USER <<'EOF'
  source maintenance/linux/conda/env.sh
  pyvirtualbox system version
  pyvirtualbox system selftest
  pyvirtualbox system selfcoverage
EOF
