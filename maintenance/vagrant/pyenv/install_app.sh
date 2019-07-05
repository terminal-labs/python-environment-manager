su -m vagrant <<'EOF'
  source maintenance/vagrant/pyenv/env.sh
  cd pyvirtualbox
  pip install .
EOF
