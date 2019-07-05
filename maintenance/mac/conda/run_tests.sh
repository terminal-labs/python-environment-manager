su -m $USER <<'EOF'
  source maintenance/mac/conda/env.sh
  pyvirtualbox system version
  pyvirtualbox system selftest
  pyvirtualbox system selfcoverage
EOF
