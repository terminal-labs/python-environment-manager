su -m vagrant <<'EOF'
  source maintenance/vagrant/conda/env.sh
  cd pyvirtualbox
  pip install .
EOF
